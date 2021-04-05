import 'dart:io';
import 'package:simple_process/simple_process.dart';
import 'package:simple_process/src/constants/error_codes.dart';
import 'package:test/test.dart';

void main() {
  group('Test process:', () {
    late SimpleProcess syncProcess;
    late SimpleProcessAsync asyncProcess;

    setUp(() {
      syncProcess = SimpleProcess(SimpleProcessOptions());
      asyncProcess = SimpleProcessAsync(SimpleProcessOptions());
    });

    test('Test sync invalid binary', () {
      expect(
          () => syncProcess.run(exec: 'invalid-binary', args: ['##']),
          throwsA(
            isA<SimpleProcessResult>().having(
              (error) => error.exitCode,
              'Error code == 2 "Critical error"',
              ErrorCodes.criticalError,
            ),
          ));
    });

    test('Test sync invalid arguments', () {
      expect(
          () => syncProcess.run(exec: 'ls', args: ['##']),
          throwsA(
            isA<SimpleProcessResult>().having(
              (error) => error.exitCode,
              'Error code == 1 "Argument error"',
              ErrorCodes.error,
            ),
          ));
    });

    test('Test Async invalid binary', () async {
      try {
        await asyncProcess.run(exec: '###');
      } on SimpleProcessResult catch (e) {
        expect(e.exitCode, ErrorCodes.criticalError);
      }
    });

    test('Test Async invalid arguments', () async {
      try {
        await asyncProcess.run(exec: 'ls', args: ['####']);
      } on SimpleProcessResult catch (e) {
        expect(e.exitCode, ErrorCodes.error);
      }
    });

    test('List files on Linux/MacOs successfully', () {
      if (Platform.isWindows) return; // this is not a valid windows OS test
      var result = syncProcess.run(exec: BinaryLs().binaryName);
      expect(result.exitCode, ErrorCodes.ok);
    });
  });
}
