extension XString on String {
  String get trimList => replaceAll('[', '').replaceAll(']', '');

  String get tmdbImage => "https://image.tmdb.org/t/p/original$this";

  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(this);

  bool get isPasswordValid => length > 8;
}
