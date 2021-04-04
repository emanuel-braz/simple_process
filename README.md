## simple_process
A library for Dart developers.

## Usage

A usage example:

```dart
import 'package:simple_process/simple_process.dart';

var ls = BinaryLs();

// list files bynary
String binary = ls.binaryName;

void main() {
  runSync();
  runAsync();
}

runSync() {
  
  var runner = SimpleProcess(SimpleProcessOptions(
      binary: binary // default binary for this `SimpleProcess`.
      ));

  // Using default bynary (from SimpleProcessOptions)
  SimpleProcessResult result = runner.run(
      args: [ls.l, '../'],
      handlerFn: (result) {
        print('Result is ok == ${result.isOk}');
      });
  print('Files dir ../ ${result.lines[0]}');

  // Using declared binary and sync cascade operator
  runner
    ..run(
        exec: 'invalid-binary-ls',
        skipOnError:
            true, // It makes the error be skipped and it continues running next process
        args: [ls.l],
        handlerFn: (result) {
          print(
              '[ERROR] ExitCode: ${result.exitCode} - message: ${result.resultMessage}');
        })
    ..run(
        exec: binary,
        args: [ls.l, ls.a],
        handlerFn: (result) {
          print('Files -la ${result.lines[0]}');
        });

  try {
    runner.run(exec: 'some-invalid-binary', skipOnError: false); // throw error
  } catch (e) {
    print('\nError try/catch\n');
  }
}

runAsync() async {
  var ls = BinaryLs();
  var asyncRunner = SimpleProcessAsync(SimpleProcessOptions(
      binary: binary // defaul binary for this `SimpleProcessAsync`.
      ));

  // Catching errors on Future
  await asyncRunner
      .run(
          exec: 'invalid-binary-ls',
          args: [ls.l, ls.a],
          handlerFn: (result) {
            print('ERROR exitCode: ${result.exitCode}');
          })
      .catchError((error) {
    print('(Something wrong) ${(error as SimpleProcessResult).resultMessage}');
    return error;
  }, test: (e) => e is SimpleProcessResult).catchError((error) {
    print('Generic error: $error');
  });

  var lsResult = await asyncRunner.run(
      args: [ls.a],
  );

  print('\n\nExecuted ${ls.binaryName} ${ls.a}: OK == ${lsResult.isOk} \n${lsResult.resultMessage}\n');
}
```
