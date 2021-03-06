/// For each operand that names a file of a type other than directory, ls displays its name as well as any requested, associated
/// information.  For each operand that names a file of type directory, ls displays the names of files contained within that
/// directory, as well as any requested, associated information.///
/// If no operands are given, the contents of the current directory are displayed.  If more than one operand is given, non-direc-
/// tory operands are displayed first; directory and non-directory operands are sorted separately and in lexicographical order.///
/// The following options are available:
/// ls [-ABCFGHLOPRSTUW@abcdefghiklmnopqrstuwx1] [file ...]
///
/// The ls utility exits 0 on success, and >0 if an error occurs.
class BinaryLs {
  String binaryName = 'ls'; // list directory contents

  /// Display extended attribute keys and sizes in long (-l) output.
  String at_ = '-@';

  /// (The numeric digit ``one''.)  Force output to be one entry per line.  This is the default when output is not to a terminal.
  String one = '-1';

  /// List all entries except for . and ...  Always set for the super-user.
  String A = '-A';

  /// Include directory entries whose names begin with a dot (.).
  String a = '-a';

  /// Force printing of non-printable characters (as defined by ctype(3) and current locale settings) in file names as \xxx, where xxx is the numeric value of the character in octal.
  String B = '-B';

  /// As -B, but use C escape codes whenever possible.
  String b = '-b';

  /// Force multi-column output; this is the default when output is to a terminal.
  String C = '-C';

  /// Use time when file status was last changed for sorting (-t) or long printing (-l).
  String c = '-c';

  /// Directories are listed as plain files (not searched recursively).
  String d = '-d';

  /// Print the Access Control List (ACL) associated with the file, if present, in long (-l) output.
  String e = '-e';

  /// Display a slash (`/') immediately after each pathname that is a directory, an asterisk (`*') after each that is exe-
  ///          cutable, an at sign (`@') after each symbolic link, an equals sign (`=') after each socket, a percent sign (`%') after
  ///          each whiteout, and a vertical bar (`|') after each that is a FIFO.
  String F = '-F';

  /// Output is not sorted.  This option turns on the -a option.
  String f = '-f';

  /// Enable colorized output.  This option is equivalent to defining CLICOLOR in the environment.  (See below.)
  String G = '-G';

  /// This option is only available for compatibility with POSIX; it is used to display the group name in the long (-l) for-
  /// mat output (the owner name is suppressed).
  String g = '-g';

  /// Symbolic links on the command line are followed.  This option is assumed if none of the -F, -d, or -l options are
  /// specified.
  String H = '-H';

  /// When used with the -l option, use unit suffixes: Byte, Kilobyte, Megabyte, Gigabyte, Terabyte and Petabyte in order to
  /// reduce the number of digits to three or less using base 2 for sizes.
  String h = '-h';

  /// For each file, print the file's file serial number (inode number).
  String i = '-i';

  /// If the -s option is specified, print the file size allocation in kilobytes, not blocks.  This option overrides the
  ///          environment variable BLOCKSIZE.
  String k = '-k';

  /// Follow all symbolic links to final target and list the file or directory the link references rather than the link
  /// itself.  This option cancels the -P option.
  String L = '-L';

  /// The lowercase letter ``ell''.)  List in long format.  (See below.)  If the output is to a terminal, a total sum for
  String l = '-l';

  /// Stream output format; list files across the page, separated by commas.
  String m = '-m';

  /// Display user and group IDs numerically, rather than converting to a user or group name in a long (-l) output.  This
  /// option turns on the -l option.
  String n = '-n';

  /// Include the file flags in a long (-l) output.
  String O = '-O';

  /// List in long format, but omit the group id.
  String o = '-o';

  /// If argument is a symbolic link, list the link itself rather than the object the link references.  This option cancels
  /// the -H and -L options.
  String P = '-P';

  /// Write a slash (`/') after each filename if that file is a directory.
  String p = '-p';

  /// Force printing of non-graphic characters in file names as the character `?'; this is the default when output is to a
  /// terminal.
  String q = '-q';

  /// Recursively list subdirectories encountered.
  String R = '-R';

  /// Reverse the order of the sort to get reverse lexicographical order or the oldest entries first (or largest files last,
  ///          if combined with sort by size
  String r = '-r';

  /// Sort files by size
  String S = '-S';

  /// Display the number of file system blocks actually used by each file, in units of 512 bytes, where partial units are
  /// rounded up to the next integer value.  If the output is to a terminal, a total sum for all the file sizes is output on
  /// a line before the listing.  The environment variable BLOCKSIZE overrides the unit size of 512 bytes.
  String s = '-s';

  /// When used with the -l (lowercase letter ``ell'') option, display complete time information for the file, including
  /// month, day, hour, minute, second, and year.
  String T = '-T';

  /// Sort by time modified (most recently modified first) before sorting the operands by lexicographical order.
  String t = '-t';

  /// Use time of last access, instead of last modification of the file for sorting (-t) or long printing (-l).
  String u = '-u';

  /// Use time of file creation, instead of last modification for sorting (-t) or long output (-l).
  String U = '-U';

  /// Force unedited printing of non-graphic characters; this is the default when output is not to a terminal.
  String v = '-v';

  /// Display whiteouts when scanning directories.  (-S) flag).
  String W = '-W';

  /// Force raw printing of non-printable characters.  This is the default when output is not to a terminal.
  String w = '-w';

  /// The same as -C, except that the multi-column output is produced with entries sorted across, rather than down, the col-
  String x = '-x';
}
