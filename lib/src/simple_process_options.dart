import 'dart:convert';
import 'dart:io';

class SimpleProcessOptions<T> {
  /// working directory for commands to run in
  late String baseDir;

  /// app bynary on the machine
  final String? binary;

  /// Not used yet
  final int maxConcurrentProcesses;

  /// Run in Shell
  final bool runInShell;

  /// stdoutEncoding
  final Encoding stdoutEncoding;

  /// stderrEncoding
  final Encoding stderrEncoding;

  /// Show all outputs (Debug mode) - default = false
  final showOutput;

  /// Any command executed will be prefixed with this config
  /// E.g.
  ///   runs: binary_app -c <config> <command>
  final String? config;

  /// Options
  SimpleProcessOptions(
      {baseDir,
      this.binary,
      this.maxConcurrentProcesses = 6,
      this.config,
      this.runInShell = false,
      this.stdoutEncoding = systemEncoding,
      this.stderrEncoding = systemEncoding,
      this.showOutput = false})
      : baseDir = baseDir ?? Directory.current.path;
}
