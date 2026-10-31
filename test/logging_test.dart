import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fit_book/logging.dart';
import 'package:talker_flutter/talker_flutter.dart';

void main() {
  test('Talker border follows the current terminal width', () {
    var terminalColumns = 50;
    final formatter = TerminalResponsiveLoggerFormatter(
      terminalColumnsProvider: () => terminalColumns,
    );
    final settings = TalkerLoggerSettings(
      maxLineWidth: 110,
      enableColors: false,
    );
    final details = LogDetails(
      message: 'hello',
      level: LogLevel.info,
      pen: AnsiPen(),
    );

    final narrow =
        formatter.fmt(details, settings).split(String.fromCharCode(10)).first;
    terminalColumns = 90;
    final wide =
        formatter.fmt(details, settings).split(String.fromCharCode(10)).first;

    expect(narrow.length, lessThan(50));
    expect(wide.length, lessThan(90));
    expect(wide.length, greaterThan(narrow.length));
  });

  test('Talker keeps its configured width without a terminal', () {
    final formatter = TerminalResponsiveLoggerFormatter(
      terminalColumnsProvider: () => null,
    );
    final settings = TalkerLoggerSettings(
      maxLineWidth: 110,
      enableColors: false,
    );
    final details = LogDetails(
      message: 'hello',
      level: LogLevel.info,
      pen: AnsiPen(),
    );

    final border =
        formatter.fmt(details, settings).split(String.fromCharCode(10)).first;
    expect(border.length, 111);
  });

  test('test logging only prints warnings and errors', () {
    final originalDebugPrint = debugPrint;
    final output = <String>[];
    debugPrint = (message, {wrapWidth}) {
      if (message != null) output.add(message);
    };
    addTearDown(() => debugPrint = originalDebugPrint);

    talker.debug('routine debug message');
    talker.info('routine info message');
    talker.warning('actionable warning message');
    talker.error('actionable error message');

    expect(output, hasLength(2));
    expect(output[0], contains('actionable warning message'));
    expect(output[1], contains('actionable error message'));
  });
}
