import 'dart:io';

import 'package:simple_process/src/simple_process_main.dart';
import 'package:simple_process/src/simple_process_options.dart';
import 'package:simple_process/src/simple_process_result.dart';

class ProcessRunner {
  final SimpleProcessOptions simpleProcessOptions;
  ProcessRunner(this.simpleProcessOptions);

  dynamic runProcess<T>(
    String exec, {
    List<String>? args,
    bool? showOutput,
    HandlerFunction? handlerFn,
    bool? skipOnError,
  }) {
    if (T == SimpleProcessResult) {
      return runSyncProcess(exec,
          args: args,
          showOutput: showOutput,
          handlerFn: handlerFn,
          skipOnError: skipOnError);
    } else {
      return runAsyncProcess(exec,
          args: args,
          showOutput: showOutput,
          handlerFn: handlerFn,
          skipOnError: skipOnError);
    }
  }

  SimpleProcessResult runSyncProcess(
    String exec, {
    List<String>? args = const <String>[],
    bool? showOutput,
    HandlerFunction? handlerFn,
    bool? skipOnError,
  }) {
    skipOnError = skipOnError ?? false;
    showOutput = showOutput ?? simpleProcessOptions.showOutput;

    try {
      var result = Process.runSync(exec, _injectConfiguration(args),
          workingDirectory: simpleProcessOptions.baseDir,
          runInShell: simpleProcessOptions.runInShell,
          stdoutEncoding: simpleProcessOptions.stdoutEncoding,
          stderrEncoding: simpleProcessOptions.stderrEncoding);

      var simpleResult = SimpleProcessResult(processResult: result);
      if (showOutput == true) stdout.write(simpleResult.resultMessage);
      handlerFn?.call(simpleResult);
      return simpleResult;
    } on ProcessException catch (e) {
      var simpleResultException = SimpleProcessResult(processException: e);
      if (showOutput == true) stderr.write(simpleResultException.resultMessage);
      handlerFn?.call(simpleResultException);

      if (skipOnError == false) {
        throw simpleResultException;
      } else {
        return simpleResultException;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<SimpleProcessResult> runAsyncProcess(
    String exec, {
    List<String>? args = const <String>[],
    bool? showOutput,
    HandlerFunction? handlerFn,
    bool? skipOnError,
  }) async {
    
    skipOnError = skipOnError ?? false;
    showOutput = showOutput ?? simpleProcessOptions.showOutput;

    return Process.run(exec, _injectConfiguration(args),
            workingDirectory: simpleProcessOptions.baseDir,
            runInShell: simpleProcessOptions.runInShell,
            stdoutEncoding: simpleProcessOptions.stdoutEncoding,
            stderrEncoding: simpleProcessOptions.stderrEncoding)
        .then((result) {
      var simpleResult = SimpleProcessResult(processResult: result);
      if (showOutput == true) stdout.write(simpleResult.resultMessage);
      handlerFn?.call(simpleResult);
      return simpleResult;
    }).catchError((e) {
      var simpleResultException = SimpleProcessResult(processException: e);
      if (showOutput == true) stderr.write(simpleResultException.resultMessage);
      handlerFn?.call(simpleResultException);

      if (skipOnError == false) {
        throw simpleResultException;
      } else {
        return simpleResultException;
      }
    }, test: (e) => e is ProcessException).catchError((e) => throw e);
  }

  List<String> _injectConfiguration(List<String>? args) {
    if (simpleProcessOptions.config != null &&
        (simpleProcessOptions.config?.isNotEmpty ?? false)) {
      args?.insert(0, simpleProcessOptions.config!);
      args?.insert(0, '-c');
    }
    return args ?? [];
  }
}
