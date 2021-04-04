import 'package:simple_process/src/simple_process_base.dart';
import 'package:simple_process/src/simple_process_options.dart';
import 'package:simple_process/src/simple_process_result.dart';

typedef HandlerFunction = void Function(SimpleProcessResult);

class SimpleProcess extends SimpleProcessBase<SimpleProcessResult> {
  SimpleProcess(SimpleProcessOptions simpleProcessOptions) : super(simpleProcessOptions);
}

class SimpleProcessAsync extends SimpleProcessBase<Future<SimpleProcessResult>> {
  SimpleProcessAsync(SimpleProcessOptions simpleProcessOptions) : super(simpleProcessOptions);
}
