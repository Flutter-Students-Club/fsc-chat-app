extension StringExtensions on String {
  String get firstLetter => this[0].toUpperCase();
  String get capitalize => this[0].toUpperCase() + this.substring(1);
}
