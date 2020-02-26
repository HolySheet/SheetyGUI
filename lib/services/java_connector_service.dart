import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../utility.dart';

class JavaConnectorService {
  final File jarPath;

  JavaConnectorService()
      : jarPath = findHolySheet();

  static File findHolySheet() =>
      Directory.current.listSync().firstWhere((file) {
        var name = file.uri.pathSegments.last;
        return name.startsWith('HolySheet') && name.endsWith('.jar');
      }, orElse: () => '${Directory.current}\\HolySheet.jar'.file());

  Future<void> connect() async {
    if (!(await jarPath.exists())) {
      print('Couldn\'t find HolySheet jar at ${jarPath.path}');
      exit(0);
    }

    print('Starting backend...');

    var completer = Completer();

    print('Loading Java process...');

    Process.start('javaw', [
      '-jar',
      '--add-opens=jdk.jshell/jdk.jshell=ALL-UNNAMED',
      jarPath.path,
      '-g',
      '8999',
      '-p',
      '$pid',
      '-a',
      'credentials.json',
      '-z',
    ]).then((process) {
      void printOutput(String data) => print('[Java] ${data.trim().replaceAll('\r\n', '\n')}');

      process.stderr.transform(utf8.decoder).listen(printOutput);
      process.stdout.transform(utf8.decoder).listen((string) {
        printOutput(string);
        if (string.contains('gRPC Server started')) {
          print('gRPC connection established with Java program with PID of: ${process.pid}');
          completer?.complete();
          completer = null;
        }
      });
    });

    return completer.future;
  }
}
