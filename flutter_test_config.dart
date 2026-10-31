import 'dart:async';

import 'package:fit_book/logging.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  talker.configure(
    logger: TalkerLogger(
      settings: TalkerLoggerSettings(
        level: LogLevel.warning,
        enableColors: false,
      ),
      formatter: const TerminalResponsiveLoggerFormatter(),
      output: (message) => debugPrint(message),
    ),
  );

  await testMain();
}
