import 'dart:io';
import 'package:simple_process/simple_process.dart';
import 'package:simple_process/src/constants/error_codes.dart';
import 'package:test/test.dart';

void main() {
  group('Test sync process:', () {
    late SimpleProcess syncProcess;

    setUp(() {
      syncProcess = SimpleProcess(SimpleProcessOptions());
    });

    test('Test invalid binary argument', () {
      expect(
          () => syncProcess.run(
              exec: 'invalid-binary',
              handlerFn: (result) {
                print('ExitCode == ${result.exitCode}');
              }),
          throwsA(
            isA<SimpleProcessResult>().having(
              (error) => error.exitCode,
              'Error code == 2 "Critical error"',
              ErrorCodes.criticalError,
            ),
          ));
    });

    test('List files on Linux/MacOs successfully', () {
      if (Platform.isWindows) return; // this is not a valid windows OS test

      var result = syncProcess.run(exec: BinaryLs().binaryName);
      expect(result.exitCode, ErrorCodes.ok);
    });
  });
}
