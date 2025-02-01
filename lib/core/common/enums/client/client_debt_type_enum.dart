enum ClientDebtTypeEnum {
  all,
  users,
  region;
}

extension ClientDebtTypeEnumExtension on ClientDebtTypeEnum {
  String get toParam {
    switch (this) {
      case ClientDebtTypeEnum.all:
        return 'all';

      case ClientDebtTypeEnum.users:
        return 'users';

      case ClientDebtTypeEnum.region:
        return 'regoin';
    }
  }
}

enum TypeOfInvoice {
  subscriber(text: "مشترك", value: "مشترك"),
  withdrawn(text: "منسحب", value: "منسحب"),
  restrictWithdrawn(text: "منسحب مقيد", value: "مقيد"),
  // cancelApprovement(text: "الفواتير المعادة للمشرف", value: "الفواتير المعادة من الانسحاب"),
  // cancelWithdraw(text: "الفواتير المعادة من الانسحاب", value: "الفواتير المعادة من الانسحاب"),
  all(text: 'الكل', value: null);

  final String text;
  final String? value;

  const TypeOfInvoice({required this.text, required this.value});
}
enum StatusOfInvoice {
  cancelApprovement(text: "الفواتير المعادة للمشرف", value: 1),
  cancelWithdraw(text: "الفواتير المعادة من الانسحاب", value: 2);

  final String text;
  final int value;

  const StatusOfInvoice({required this.text, required this.value});
}
