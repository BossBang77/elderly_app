///Iterable extension
extension IterableExtension<T> on Iterable<T> {
  ///return first or null if it empty
  T? get firstOrNull => isEmpty ? null : first;

  ///where or null
  T? whereOrNull(bool Function(T element) condition) {
    try {
      return where(condition).firstOrNull;
    } catch (e) {
      return null;
    }
  }

  ///where or null
  T? getOrNull(int index) {
    try {
      return toList()[index];
    } catch (e) {
      return null;
    }
  }
}
