import 'package:crm_smart/model/invoiceModel.dart';

class CommissionCollaboratorsResponseModel {
  final num? totalSale;
  final num? totalPaid;
  final num? totalDue;
  final num? totalProgram;
  final num? totalDevices;
  final List<InvoiceModel>? invoiceModel;
  final int? count;

  const CommissionCollaboratorsResponseModel({
    this.totalSale,
    this.totalPaid,
    this.totalDue,
    this.totalProgram,
    this.totalDevices,
    this.invoiceModel,
    this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalSale': this.totalSale,
      'totalPaid': this.totalPaid,
      'totalDue': this.totalDue,
      'totalProgram': this.totalProgram,
      'totalDevices': this.totalDevices,
      'message': this.invoiceModel,
      'count': this.count,
    };
  }

  factory CommissionCollaboratorsResponseModel.fromMap(Map<String, dynamic> map) {
    return CommissionCollaboratorsResponseModel(
      totalSale: map['totalSale'],
      totalPaid: map['totalPaid'],
      totalDue: map['totalDue'],
      totalProgram: map['totalProgram'],
      totalDevices: map['totalDevices'],
      invoiceModel: map['message'] == null ? null : List.of(map['message']).map((e) => InvoiceModel.fromJson(e)).toList(),
      count: map['count'],
    );
  }

  CommissionCollaboratorsResponseModel copyWith({
    num? totalSale,
    num? totalPaid,
    num? totalDue,
    num? totalProgram,
    num? totalDevices,
    int? count,
    List<InvoiceModel>? invoiceModel,
  }) {
    return CommissionCollaboratorsResponseModel(
      totalSale: totalSale ?? this.totalSale,
      totalPaid: totalPaid ?? this.totalPaid,
      totalDue: totalDue ?? this.totalDue,
      totalProgram: totalProgram ?? this.totalProgram,
      totalDevices: totalDevices ?? this.totalDevices,
      invoiceModel: invoiceModel ?? this.invoiceModel,
      count: count ?? this.count,
    );
  }
}
