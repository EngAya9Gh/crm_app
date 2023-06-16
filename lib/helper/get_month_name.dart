List<String> getYearList({int fromYear = 2022}) {
  if (fromYear > DateTime.now().year) {
    fromYear = DateTime.now().year;
  }
  return List.generate(DateTime.now().year - fromYear + 1, (index) => (fromYear + index).toString());
}

final List<String> quarterList = List.generate(4, (index) => "Q${index + 1}");

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

int getMonthNumber(String month) {
  final monthNumber = monthList.indexOf(month) + 1;
  if (monthNumber == -1) {
    return 1;
  }
  return monthNumber;
}

String getQuarterName(int quarter) {
  final index = quarter - 1;
  return quarterList[index];
}

int getQuarterNumber(String quarter) {
  final quarterNumber = quarterList.indexOf(quarter) + 1;
  if (quarterNumber == -1) {
    return 1;
  }
  return quarterNumber;
}
