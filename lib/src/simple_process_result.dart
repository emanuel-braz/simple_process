import 'dart:io';

class SimpleProcessResult {
  final ProcessResult? processResult;
  final ProcessException? processException;

  SimpleProcessResult({this.processResult, this.processException});

  bool get isOk => (processResult != null && processResult?.exitCode == 0);
  int get exitCode =>
      processResult?.exitCode ?? processException?.errorCode ?? 0;

  bool get hasOutput =>
      processResult?.stdout.runtimeType == String &&
      (processResult?.stdout as String).isNotEmpty;

  bool get hasError =>
      processException?.message != null ||
      processResult?.stderr.runtimeType == String &&
          (processResult?.stderr as String).isNotEmpty;

  String get resultMessage => isOk
      ? (processResult?.stdout.toString() ?? processResult?.toString() ?? '')
      : (processException?.toString() ??
          processResult?.stderr.toString() ??
          '');

  @override
  String toString() => resultMessage;
}

extension ProcessResultExt on SimpleProcessResult {
  List<String> get lines {
    try {
      return resultMessage
          .toString()
          .split('\n')
          .where((e) => e.trim().isNotEmpty)
          .toList();
    } catch (e) {
      return [resultMessage];
    }
  }
}
