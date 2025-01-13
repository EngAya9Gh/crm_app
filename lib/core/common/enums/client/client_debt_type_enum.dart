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
  subscriber(text:"مشترك",value: "مشترك"),
  withdrawn(text: "منسحب",value: "منسحب"),
  restrictWithdrawn(text: "منسحب مقيد",value: "مقيد"),
all(text:'الكل',value: null,);
  final String text;
  final String? value;

  const TypeOfInvoice({required this.text,required this.value});

}
