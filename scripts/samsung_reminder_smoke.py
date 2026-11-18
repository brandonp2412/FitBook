#!/usr/bin/env python3
"""Inspect FitBook's production Dart/WorkManager job on Samsung.

No debug APK, Kotlin receiver, fake clock or changes to diary data.
Optionally run a due job; WorkManager does not allow running a periodic task
before its scheduled interval even when JobScheduler's --force is used.
"""

import argparse
import re
import subprocess
import time

PACKAGE = 'com.presley.fit_book'
NAMESPACE = 'androidx.work.systemjobscheduler'


def adb(serial, *command):
    result = subprocess.run(
        ['adb', '-s', serial, *command], capture_output=True,
        text=True, timeout=35,
    )
    if result.returncode:
        raise RuntimeError(f"ADB failed: {' '.join(command)}: {result.stderr[-350:]}")
    return result.stdout


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--device', default='10.66.66.3:5555')
    parser.add_argument('--force-run', action='store_true',
                        help='Try running a due worker; premature jobs remain deferred')
    args = parser.parse_args()

    package = adb(args.device, 'shell', 'dumpsys', 'package', PACKAGE)
    if 'android.permission.POST_NOTIFICATIONS: granted=true' not in package:
        raise AssertionError('Notification permission is not granted')
    print('PASS: notification permission is granted', flush=True)

    jobs = adb(args.device, 'shell', 'dumpsys', 'jobscheduler')
    ids = sorted(set(re.findall(
        r'^\s*JOB androidx\.work\.systemjobscheduler:u0a\d+/(\d+):'
        r'[^\n]*@' + re.escape(PACKAGE) +
        r'/androidx\.work\.impl\.background\.systemjob\.SystemJobService',
        jobs, flags=re.MULTILINE,
    )))
    if not ids:
        raise AssertionError('No pending FitBook WorkManager job')
    print(f'PASS: persistent Android WorkManager job(s) scheduled: {ids}', flush=True)

    if not args.force_run:
        print('Not forcing an early job: WorkManager waits until its periodic interval.', flush=True)
        return

    previous_logs = adb(args.device, 'logcat', '-d', '-v', 'epoch')
    last_line_count = len(previous_logs.splitlines())
    result = adb(args.device, 'shell', 'cmd', 'jobscheduler', 'run',
                 '-f', '-n', NAMESPACE, PACKAGE, ids[0])
    if 'Running job' not in result:
        raise AssertionError(f'Android rejected job: {result}')
    print(f'JobScheduler request: {result.strip()}', flush=True)

    for _ in range(15):
        time.sleep(2)
        recent = adb(args.device, 'logcat', '-d', '-v', 'epoch').splitlines()
        # Keep only log entries newer than the baseline, if the ring buffer did not wrap.
        new_entries = recent[last_line_count:] if len(recent) >= last_line_count else recent
        lines = [s.strip() for s in new_entries if 'FitBookReminders:' in s]
        if lines:
            for line in lines[-5:]:
                print(line[:400], flush=True)
            if any('background check failed:' in line for line in lines):
                raise AssertionError('Dart reminder callback raised an error')
            print('PASS: background Dart callback executed', flush=True)
            return
        if any('Delaying execution for dev.fluttercommunity.workmanager.BackgroundWorker' in s
               for s in new_entries):
            print('DEFERRED: WorkManager ignored the early forced run; job remains scheduled.',
                  flush=True)
            return
    raise AssertionError('Neither Dart callback nor WorkManager deferral was observed')


if __name__ == '__main__':
    main()
