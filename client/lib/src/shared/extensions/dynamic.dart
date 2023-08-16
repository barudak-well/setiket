extension XDynamic on dynamic {
  /// [INFO]
  /// Use this for check if its not null
  bool isNotNull() {
    return this != null;
  }

  /// [INFO]
  /// Use this for check if its null
  bool isNull() {
    return this == null;
  }

  bool isNullOrEmpty() {
    return this == null || this.isEmpty;
  }
}
