import 'package:flutter/material.dart';

enum TypeClientEnum {
  all,
  subscriber,
  negotiation,
  offer,
  excluded,
  withdrawn,
  suspendedExclusion,
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
    }
  }
}

enum TypeSubClientEnum {
  bill(id:1,text:"فاتورة مبيعات"),
  billDocument(id:2,text:"سند قبض"),
  BankTransferNotice(id:3,text:"اشعار تحويل بنكي"),
  TaxCertificate(id:4,text:"الشهادة الضريبية"),
  offer(id:5,text:"عرض سعر"),
  ;

  final int id;
  final String text;
  const TypeSubClientEnum({
    required this.id,
    required this.text,
  });
}
