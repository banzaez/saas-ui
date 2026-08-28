extension ExtString on String {
  String get capitalizeFirst =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(
    RegExp(' +'),
    ' ',
  ).split(' ').map((str) => str.capitalizeFirst).join(' ');

  String toWithoutSpace() => replaceAll(' ', '');

  String toSortable() => toLowerCase().replaceAll(' ', '');

  // format string with params
  // example: "Hello %$1\$, how are you %$2\$?" => "Hello John, how are you?"
  String format(List<String> params) {
    String result = this;
    for (int i = 1; i <= params.length; i++) {
      result = result.replaceAll('%$i\$', params[i - 1]);
    }

    return result;
  }
}
