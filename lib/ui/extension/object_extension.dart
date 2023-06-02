extension ConditionalCast on Object {
  T? optionalCast<T>() {
    final Object self = this;
    return self is T ? (self as T) : null;
  }
}