import 'dart:convert';
import 'dart:io';

import 'package:dtg_web_admin/main.dart';
import 'package:logger/logger.dart';

import 'const.dart';

/// Writes the log output to a file.
class FileOutput extends LogOutput {
  final File file;
  final bool overrideExisting;
  final Encoding encoding;
  late IOSink _sink;

  // IOSink? _sink;

  FileOutput({
    required this.file,
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  @override
  Future<void> init() async {
    _sink = file.openWrite(
      mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
      encoding: encoding,
    );
  }

  @override
  void output(OutputEvent event) {
    _sink?.writeAll(event.lines, '\n');
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}

var logger = Logger(
    printer: PrettyPrinter(
      printTime: true,
    ),
    /*
  Output of log to Console or File
   */
    output: isLogConsole
        ? ConsoleOutput()
        : FileOutput(file: File(Const.LOG_FILE_NAME)),
    //<-----File----->
    // output: FileOutput(
    //   file: File("cdg_log_1.txt")
    // ),
    //<-----Console----->
    // output: ConsoleOutput(),

    /*
  Filter of log for Debug and Release mode:
  DevelopmentFilter:
  - Debug: Log on
  - Production: Log off
  ProductionFilter
  - Debug: Log on
  - Production: Log on
   */
    // filter: isLogConsole ? DevelopmentFilter() : ProductionFilter(),
    //<-----Development----->
    // filter: DevelopmentFilter(),
    //<-----Production----->
    // filter: ProductionFilter(),
    //<-----No Log----->
    filter: DevelopmentFilter());

// var logger = Logger(
//   filter: MyFilter()
// );
//
class NoLogFilter extends LogFilter {
  @override
  bool shouldLog(LogEvent event) {
    return false;
  }
}
