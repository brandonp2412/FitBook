import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final packageInfo = PackageInfo.fromPlatform();
    return Scaffold(
      appBar: AppBar(
        title: const Text("About"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/ic_launcher.png'),
              height: 150,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text("Version"),
            subtitle: FutureBuilder(
              future: packageInfo,
              builder: (context, snapshot) =>
                  Text(snapshot.data?.version ?? "1.0.0"),
            ),
            onTap: () async {
              const url =
                  'https://github.com/brandonp2412/FitBook/releases/latest';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Author"),
            leading: const Icon(Icons.person),
            subtitle: const Text("Brandon Presley"),
            onTap: () async {
              const url = 'https://github.com/brandonp2412';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("License"),
            leading: const Icon(Icons.balance),
            subtitle: const Text("MIT"),
            onTap: () async {
              const url =
                  'https://github.com/brandonp2412/FitBook?tab=MIT-1-ov-file#readme';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Donate"),
            leading: const Icon(Icons.favorite_outline),
            subtitle: const Text("Help support this project"),
            onTap: () async {
              const url = 'https://github.com/sponsors/brandonp2412';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
          ListTile(
            title: const Text("Source code"),
            leading: const Icon(Icons.code),
            onTap: () async {
              const url = 'https://github.com/brandonp2412/FitBook';
              if (await canLaunchUrlString(url)) await launchUrlString(url);
            },
          ),
        ],
      ),
    );
  }
}
