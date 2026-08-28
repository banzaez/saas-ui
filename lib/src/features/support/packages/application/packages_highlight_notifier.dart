import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saas_ui/src/core/models/highlight_level.dart';

part 'packages_highlight_notifier.g.dart';

@riverpod
class PackagesHighlight extends _$PackagesHighlight {
  @override
  Map<String, HighlightLevel> build() => {};

  HighlightLevel getLevel(String fieldId) =>
      state[fieldId] ?? HighlightLevel.none;

  void setField(String fieldId, HighlightLevel level) {
    state = Map<String, HighlightLevel>.from(state)..[fieldId] = level;
  }

  void setFields(Map<String, HighlightLevel> fields) {
    state = {...state, ...fields};
  }

  void clear() => state = {};
}
