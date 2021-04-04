import 'dart:io';

class SimpleProcessResult {

  /// Process result
  final ProcessResult? processResult;

  /// Process exception
  final ProcessException? processException;

  SimpleProcessResult({this.processResult, this.processException});

  /// Return true if ok, else false
  bool get isOk => (processResult != null && processResult?.exitCode == 0);
  
  /// Exit code
  int get exitCode =>
      processResult?.exitCode ?? processException?.errorCode ?? 0;

  /// Has output message
  bool get hasOutput =>
      processResult?.stdout.runtimeType == String &&
      (processResult?.stdout as String).isNotEmpty;

  /// /// Has output error
  bool get hasError =>
      processException?.message != null ||
      processResult?.stderr.runtimeType == String &&
          (processResult?.stderr as String).isNotEmpty;

  /// Result message
  String get resultMessage => isOk
      ? (processResult?.stdout.toString() ?? processResult?.toString() ?? '')
      : (processException?.toString() ??
          processResult?.stderr.toString() ??
          '');

  @override
  String toString() => resultMessage;
}

/// Extension
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
