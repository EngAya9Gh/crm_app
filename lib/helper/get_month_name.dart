String getMonthName(int index) {
  switch (index) {
    case 1:
      return "يناير";
    case 2:
      return "فبراير";
    case 3:
      return "مارس";
    case 4:
      return "ابريل";
    case 5:
      return "مايو";
    case 6:
      return "يونيو";
    case 7:
      return "يوليو";
    case 8:
      return "أغسطس";
    case 9:
      return "سبتمبر";
    case 10:
      return "أكتوبر";
    case 11:
      return "نوفمبر";
    case 12:
      return "ديسمبر";
    default:
      return "يناير";
  }
}

int getMonthIndex(String month) {
  switch (month) {
    case "يناير":
      return 1;
    case "فبراير":
      return 2;
    case "مارس":
      return 3;
    case "ابريل":
      return 4;
    case "مايو":
      return 5;
    case "يونيو":
      return 6;
    case "يوليو":
      return 7;
    case "أغسطس":
      return 8;
    case "سبتمبر":
      return 9;
    case "أكتوبر":
      return 10;
    case "نوفمبر":
      return 11;
    case "ديسمبر":
      return 12;
    default:
      return 1;
  }
}
