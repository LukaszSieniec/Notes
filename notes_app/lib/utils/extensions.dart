extension Content on String {
  String removeEmptySpace() => split(RegExp(r'(?:\r?\n|\r)'))
      .where((s) => s.trim().isNotEmpty)
      .join('\n');
}
