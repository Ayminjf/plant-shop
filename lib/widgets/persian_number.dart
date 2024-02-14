extension PersianNumberExtension on String {
  String get persianNumber {
    const english = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
    const persian = ["۰", "۱", "۲", "۳", "۴", "۵", "۶", "۷", "۸", "۹"];
    String text = this;
    for (var i = 0; i < english.length; i++) {
      text = text.replaceAll(english[i], persian[i]);
    }
    return text;
  }
}
