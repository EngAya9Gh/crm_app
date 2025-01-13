import 'package:flutter/material.dart';

enum TypeClientEnum {
  all('الكل'),
  subscriber('مشترك'),
  negotiation("تفاوض"),
  offer("عرض سعر"),
  excluded("مستبعد"),
  withdrawn("منسحب"),
  suspendedExclusion("معلق استبعاد"),
  restrictWithdrawn("منحسب مقيد");
  final  String text;
  const TypeClientEnum(this.text);
}

extension TypeOfClientFilterExtension on TypeClientEnum {
  String get value {
    switch (this) {
      case TypeClientEnum.all:
        return 'الكل';
      case TypeClientEnum.subscriber:
        return 'مشترك';
      case TypeClientEnum.negotiation:
        return 'تفاوض';
      case TypeClientEnum.offer:
        return 'عرض سعر';
      case TypeClientEnum.excluded:
        return 'مستبعد';
      case TypeClientEnum.withdrawn:
        return 'منسحب';
      case TypeClientEnum.suspendedExclusion:
        return 'معلق استبعاد';
        case TypeClientEnum.restrictWithdrawn:
        return 'مقيد';
    }
  }
}

enum TypeSubClientEnum {
  bill(id:1,text:"فاتورة مبيعات"),
  billDocument(id:2,text:"سند قبض"),
  BankTransferNotice(id:3,text:"اشعار تحويل بنكي"),
  TaxCertificate(id:4,text:"الشهادة الضريبية"),
  offer(id:5,text:"عرض سعر"),
  all(id:'all',text:"الكل"),
  ;

  final dynamic id;
  final String text;
  const TypeSubClientEnum({
    required this.id,
    required this.text,
  });
}
