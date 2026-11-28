#!/usr/bin/env python3
import argparse, asyncio, base64, html, functools, http.server, json, threading, shutil, struct, tempfile
from pathlib import Path
from patchright.async_api import async_playwright

EXPECTED_NAMES = {f"{n}_en-US.png" for n in range(1, 9)}
FULL_NAMES = {f"full-{name}.png" for name in ('settings-appearance', 'settings-diary', 'settings-food', 'settings-weight', 'settings-charts', 'settings-tabs', 'settings-data', 'about', 'whats-new', 'open-food-facts-login', 'open-food-facts-search', 'quick-add', 'meal-create', 'food-create', 'foods-bulk-edit', 'diary-edit', 'diary-bulk-edit', 'diary-repeat', 'weight-edit', 'diary-filters', 'food-filters', 'meal-food-picker', 'settings-search', 'meal-edit', 'nutrition-details', 'graph-weight', 'graph-metric-picker', 'data-delete-picker', 'diary-search-empty')}
MAX_BYTES = 8 * 1024 * 1024
STATUS_BAR_HEIGHT = 24

PROFILES = {
    "phoneScreenshots": (450, 800, 2.4),
    "sevenInchScreenshots": (1440, 810, 4/3),
    "tenInchScreenshots": (1280, 800, 2),
    "desktop": (1600, 881, 1),
}

def validate_screenshot(path, expected):
    with path.open("rb") as source:
        header = source.read(26)
    if header[:8] != b"\x89PNG\r\n\x1a\n" or len(header) != 26:
        raise ValueError(f"Invalid PNG: {path}")
    if struct.unpack(">II", header[16:24]) != expected:
        raise ValueError(f"Unexpected dimensions: {path}")
    if header[24:26] != bytes((8, 2)) or path.stat().st_size > MAX_BYTES:
        raise ValueError(f"Invalid RGB PNG or file size: {path}")


async def request(page, message=None):
    command = {"command": "request_data"}
    if message is not None:
        command["message"] = message
    await page.evaluate("command => { window.$flutterDriver(JSON.stringify(command)); }", command, isolated_context=False)
    await page.wait_for_function("window.$flutterDriverResult != null", timeout=90000)
    result = await page.evaluate("() => {const r = window.$flutterDriverResult; window.$flutterDriverResult = null; return r;}", isolated_context=False)
    response = json.loads(result)
    if response.get("isError"):
        raise RuntimeError(response)
    return json.loads(response["response"]["message"])

async def capture_with_status_bar(page, compositor, path, width, height, scale):
    screenshot = await page.screenshot(animations="disabled", scale="device")
    pixel_width, pixel_height = round(width * scale), round(height * scale)
    app_width, app_height = struct.unpack(">II", screenshot[16:24])
    if app_width != pixel_width or abs(pixel_height - app_height - STATUS_BAR_HEIGHT * scale) > 1:
        raise ValueError(f"Unexpected app screenshot dimensions: {app_width}x{app_height}")
    await compositor.set_content('<body style="margin:0;overflow:hidden"><canvas style="display:block"></canvas></body>')
    await compositor.evaluate("""async ({src, width, height, scale}) => {
        const img = new Image();
        img.src = src;
        await img.decode();
        const canvas = document.querySelector('canvas');
        canvas.width = width;
        canvas.height = height;
        const ctx = canvas.getContext('2d', {alpha: false});
        const barHeight = height - img.naturalHeight;
        const sample = document.createElement('canvas');
        sample.width = sample.height = 1;
        const sampleCtx = sample.getContext('2d');
        sampleCtx.drawImage(img, 0, 0, img.naturalWidth, 1, 0, 0, 1, 1);
        const [r, g, b] = sampleCtx.getImageData(0, 0, 1, 1).data;
        ctx.fillStyle = `rgb(${r}, ${g}, ${b})`;
        ctx.fillRect(0, 0, width, barHeight);
        ctx.drawImage(img, 0, barHeight);
        ctx.save();
        ctx.scale(scale, scale);
        ctx.translate(0, (barHeight / scale - 24) / 2);
        ctx.fillStyle = (r * .299 + g * .587 + b * .114) > 150
            ? '#202124' : '#f1f3f4';
        ctx.font = '500 14px Arial, sans-serif';
        ctx.textBaseline = 'middle';
        ctx.fillText('9:41', 16, 12);
        const right = width / scale - 16;
        const percentWidth = ctx.measureText('100%').width;
        const batteryX = right - percentWidth - 4 - 10;
        ctx.fillText('100%', right - percentWidth, 12);
        ctx.save();
        ctx.translate(batteryX, 4.5);
        ctx.beginPath();
        ctx.roundRect(3, 0, 4, 2, .5);
        ctx.roundRect(1, 2, 8, 13, 1.5);
        ctx.fill();
        ctx.restore();
        ctx.save();
        ctx.translate(batteryX - 19, 4.5);
        ctx.fill(new Path2D('M1 14 14 1v13Z'));
        ctx.restore();
        ctx.save();
        ctx.translate(batteryX - 39, 4);
        ctx.fill(new Path2D('M0 5a12 12 0 0 1 16 0L8 15Z'));
        ctx.restore();
        ctx.restore();
    }""", {"src": "data:image/png;base64," + base64.b64encode(screenshot).decode(),
           "width": pixel_width, "height": pixel_height, "scale": scale}, isolated_context=False)
    await compositor.screenshot(path=str(path), animations="disabled", scale="device")


async def capture(browser, url, out, name, debug_dir, args_camera_test=False, expected=None):
    w,h,scale = PROFILES[name]
    expected = EXPECTED_NAMES if expected is None else expected
    status_bar = not args_camera_test and name != "desktop"
    options = dict(viewport={"width":w,"height":h - STATUS_BAR_HEIGHT if status_bar else h}, device_scale_factor=scale, reduced_motion="reduce", locale="en-US", timezone_id="UTC")
    if name == "phoneScreenshots" and not args_camera_test:
        options.update(is_mobile=True, has_touch=True, user_agent="Mozilla/5.0 (Linux; Android 15; Pixel 6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Mobile Safari/537.36")
    context=await browser.new_context(**options, **({"permissions": ["camera"]} if args_camera_test else {}))
    dest=out/name
    dest.mkdir(parents=True,exist_ok=True)
    page=await context.new_page()
    compositor_context = await browser.new_context(viewport={"width": round(w * scale), "height": round(h * scale)}, device_scale_factor=1) if status_bar else None
    compositor = await compositor_context.new_page() if compositor_context else None
    page.on("console", lambda msg: print(name, msg.type, msg.text[:500], flush=True) if msg.type in ("error","warning") else None)
    errors = []
    page.on("pageerror", lambda e: errors.append(str(e)))
    try:
        await page.goto(url, wait_until="domcontentloaded")
        await page.wait_for_function("typeof window.$flutterDriver === 'function'",timeout=90000)
        print(name, "viewport",await page.evaluate("() => [innerWidth,innerHeight,devicePixelRatio]"),flush=True)
        response=await request(page,"pending")
        captured = set()
        while True:
            data=response.get("data") or {}
            command=data.get("web_driver_command")
            if command=="WebDriverCommandType.screenshot":
                filename=data["screenshot_name"]+".png"
                if filename not in expected or filename in captured:
                    raise RuntimeError(f"Unexpected screenshot: {filename}")
                await page.wait_for_timeout(500)
                if compositor:
                    await capture_with_status_bar(page, compositor, dest/filename, w, h, scale)
                else:
                    await page.screenshot(path=str(dest/filename), animations="disabled", scale="device")
                validate_screenshot(dest/filename, (round(w*scale), round(h*scale)))
                captured.add(filename)
                print(name,filename,flush=True)
                response=await request(page,"complete")
            elif command=="WebDriverCommandType.ack":
                response=await request(page,"pending")
            elif command=="WebDriverCommandType.noop":
                result=await request(page)
                print(name,"RESULT",json.dumps(result)[:5000],flush=True)
                if captured != expected or result.get("result") != "true" or errors:
                    raise RuntimeError(f"{name}: captured={captured}, result={result}, page errors={errors}")
                return
            else:
                raise RuntimeError(response)
    except Exception:
        await page.screenshot(path=str(debug_dir / f"{name}-debug.png"))
        raise
    finally:
        await context.close()
        if compositor_context:
            await compositor_context.close()

STORE_NAMES = ("diary", "graphs", "settings", "foods", "weights", "add-weight", "edit-food", "add-diary-entry")

PROFILE_LABELS = {
    "phoneScreenshots": "Phone",
    "sevenInchScreenshots": "7-inch tablet",
    "tenInchScreenshots": "10-inch tablet",
    "desktop": "Desktop",
}


def build_gallery(captures, destination):
    entries = {}
    for profile in PROFILES:
        files = [
            (captures / profile / f"{number}_en-US.png", f"{number:02}-{name}.png")
            for number, name in enumerate(STORE_NAMES, 1)
        ] + [
            (captures / "full" / profile / name, name.removeprefix("full-"))
            for name in sorted(FULL_NAMES)
        ]
        w, h, scale = PROFILES[profile]
        for source, name in files:
            validate_screenshot(source, (round(w * scale), round(h * scale)))
        entries[profile] = files

    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=destination.parent, prefix=".gallery-") as temp:
        gallery = Path(temp) / "gallery"
        gallery.mkdir()
        root = ["# FitBook screenshot gallery", "",
                "Generated from the automated screenshot fixture with sample data.", "",
                f"{sum(map(len, entries.values()))} screenshots across {len(entries)} device profiles.", ""]
        sections = []
        for profile, files in entries.items():
            label = PROFILE_LABELS[profile]
            root.append(f"- [{label} — {len(files)} screenshots]({profile}/)")
            directory = gallery / profile
            directory.mkdir()
            markdown = [f"# {label}", "", "[All device profiles](../)", ""]
            cards = []
            w, h, scale = PROFILES[profile]
            image_width, image_height = round(w * scale), round(h * scale)
            for source, filename in files:
                shutil.copyfile(source, directory / filename)
                title = filename.removesuffix(".png")
                if title[:2].isdigit():
                    title = title[3:]
                title = title.replace("-", " ").capitalize()
                width = 260 if profile == "phoneScreenshots" else 480
                markdown.extend([f"### {title}", "", f'<a href="{filename}"><img src="{filename}" alt="{title}" width="{width}"/></a>', ""])
                path = f"{profile}/{filename}"
                cards.append(f'<a href="{path}"><img loading="lazy" src="{path}" width="{image_width}" height="{image_height}" alt="{html.escape(title)}"><span>{html.escape(title)}</span></a>')
            (directory / "README.md").write_text("\n".join(markdown), encoding="utf-8")
            sections.append(f'<section id="{profile}"><h2>{label} · {len(files)} screenshots</h2><div class="screens {profile}">{"".join(cards)}</div></section>')
        (gallery / "README.md").write_text("\n".join(root) + "\n", encoding="utf-8")
        links = " ".join(f'<a href="#{profile}">{label}</a>' for profile, label in PROFILE_LABELS.items())
        (gallery / "index.html").write_text(
            '<!doctype html><html lang="en"><meta charset="utf-8">'
            '<meta name="viewport" content="width=device-width,initial-scale=1">'
            '<title>FitBook screenshots</title><style>'
            'body{font:16px system-ui;margin:24px;background:#17161b;color:#eee}'
            'nav{display:flex;gap:20px;flex-wrap:wrap;position:sticky;top:0;z-index:1;background:#17161b;padding:12px 0}'
            'a{color:#d3bfff;text-decoration:none}.screens{display:grid;grid-template-columns:repeat(auto-fill,minmax(360px,1fr));gap:16px}'
            '.phoneScreenshots{grid-template-columns:repeat(auto-fill,minmax(200px,1fr))}'
            '.screens a{display:flex;flex-direction:column;gap:8px;background:#25242b;border-radius:12px;padding:12px}'
            'img{display:block;width:100%;height:auto;object-fit:contain;border-radius:5px;background:#17161b}section{scroll-margin-top:calc(var(--nav-height, 65px) + 12px)}'
            '@media(max-width:500px){.screens,.phoneScreenshots{grid-template-columns:1fr}}'
            '</style><h1>FitBook screenshots</h1><p>All device profiles · Sample data · Click any image for full resolution</p>'
            f'<nav>{links}</nav>{"".join(sections)}<script>const nav=document.querySelector("nav");const resize=()=>document.documentElement.style.setProperty("--nav-height",nav.offsetHeight+"px");resize();new ResizeObserver(resize).observe(nav);</script></html>',
            encoding="utf-8",
        )
        if destination.exists():
            shutil.rmtree(destination)
        gallery.rename(destination)


async def main(args):
    expected = FULL_NAMES if args.full else EXPECTED_NAMES
    args.output.mkdir(parents=True, exist_ok=True)
    handler=functools.partial(http.server.SimpleHTTPRequestHandler,directory=str(args.web))
    server=http.server.ThreadingHTTPServer(("127.0.0.1",0),handler)
    threading.Thread(target=server.serve_forever,daemon=True).start()
    try:
        with tempfile.TemporaryDirectory(prefix="fitbook-screenshots-") as directory:
            staged = Path(directory)
            async with async_playwright() as p:
                browser = await p.chromium.launch(
                    headless=True, args=["--no-sandbox", "--disable-dev-shm-usage"] + (["--use-fake-device-for-media-stream", "--use-fake-ui-for-media-stream"] if args.web_camera_test else [])
                )
                try:
                    for name in args.profiles:
                        await capture(browser, f"http://127.0.0.1:{server.server_port}/" + ("?gallery=full" if args.full else ""), staged, name, args.output, args.web_camera_test, expected)
                finally:
                    await browser.close()
            for name in args.profiles:
                destination = args.output / "full" / name if args.full else args.output / name
                destination.mkdir(parents=True, exist_ok=True)
                for filename in sorted(expected):
                    shutil.copyfile(staged / name / filename, destination / filename)
            if args.gallery:
                build_gallery(args.output, args.gallery)
    finally:
        server.shutdown()
        server.server_close()
if __name__=="__main__":
    parser=argparse.ArgumentParser()
    parser.add_argument("--full", action="store_true")
    parser.add_argument("--gallery", type=Path)
    parser.add_argument("--web",type=Path,required=True)
    parser.add_argument("--output",type=Path,required=True)
    parser.add_argument("--web-camera-test", action="store_true", help="Capture the web_camera_test.dart fixture using a simulated webcam")
    parser.add_argument("profiles",nargs="*",default=list(PROFILES))
    args = parser.parse_args()
    if args.gallery and not args.full:
        parser.error("--gallery requires --full")
    if args.full and args.web_camera_test:
        parser.error("--full is incompatible with --web-camera-test")
    if args.web_camera_test:
        EXPECTED_NAMES = {f"{n}_en-US.png" for n in range(1, 4)}
        PROFILES = {"phoneScreenshots": (1200, 900, 1)}
        args.profiles = ["phoneScreenshots"]
    if any(name not in PROFILES for name in args.profiles):
        parser.error("Unknown screenshot profile")
    asyncio.run(main(args))
