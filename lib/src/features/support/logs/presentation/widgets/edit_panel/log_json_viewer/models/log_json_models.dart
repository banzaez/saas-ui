enum JsonTokenType { normal, key, string, number, boolean, nullValue, base64 }

class JsonToken {
  final String text;
  final bool isMatch;
  final int? matchIndex;
  final JsonTokenType type;

  JsonToken(
    this.text, {
    this.isMatch = false,
    this.matchIndex,
    this.type = JsonTokenType.normal,
  });
}

class JsonLine {
  final List<JsonToken> tokens;
  final int lineNumber;
  JsonLine(this.tokens, this.lineNumber);
}

class ExtractedFile {
  final String name;
  final String base64;
  final String? type;
  final double? size;
  ExtractedFile({
    required this.name,
    required this.base64,
    this.type,
    this.size,
  });
}

class TokenizationResult {
  final String formattedJson;
  final List<JsonLine> lines;
  final List<int> matchLineIndices;
  final List<ExtractedFile> files;
  TokenizationResult(
    this.formattedJson,
    this.lines,
    this.matchLineIndices,
    this.files,
  );
}
