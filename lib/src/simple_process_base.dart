import 'package:simple_process/src/process_runner.dart';
import 'package:simple_process/src/simple_process_main.dart';
import 'package:simple_process/src/simple_process_options.dart';

class SimpleProcessBase<T> {
  final SimpleProcessOptions simpleProcessOptions;
  final ProcessRunner _processRunner;

  SimpleProcessBase(this.simpleProcessOptions)
      : _processRunner = ProcessRunner(simpleProcessOptions);

  T run(
          {String? exec,
          List<String>? args,
          bool? showOutput,
          HandlerFunction? handlerFn,
          bool? skipOnError}) =>
      _processRunner.runProcess<T>(exec ?? simpleProcessOptions.binary!,
          args: args,
          showOutput: showOutput,
          handlerFn: handlerFn,
          skipOnError: skipOnError);
}
