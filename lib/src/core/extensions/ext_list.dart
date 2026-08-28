import 'package:saas_ui/src/core/models/base_model.dart';

extension ExtList<T extends BaseModel> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}