final List yearList = List.generate(DateTime.now().year - 2022 + 1, (index) => (2022 + index).toString());

final List quarterList = List.generate(4, (index) => "Q${index + 1}");

const List<String> monthList = [
  "يناير",
  "فبراير",
  "مارس",
  "ابريل",
  "مايو",
  "يونيو",
  "يوليو",
  "أغسطس",
  "سبتمبر",
  "أكتوبر",
  "نوفمبر",
  "ديسمبر",
];

String getMonthName(int monthNumber) {
  if (monthNumber < 1 || monthNumber > 12) {
    return monthList.first;
  }
  final index = monthNumber - 1;
  return monthList[index];
}

int getMonthIndex(String month) {
  final monthNumber = monthList.indexOf(month) + 1;
  if (monthNumber == -1) {
    return 1;
  }
  return monthNumber;
}
