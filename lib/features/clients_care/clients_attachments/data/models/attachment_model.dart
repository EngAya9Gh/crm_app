
class AttachmentModel {
  final int? id;
  final int? fkInvoice;
  final String? invoiceAddress;
  final String? stateclient;
  final int? idClients;
  final String? nameEnterprise;
  final String? fileAttachInvoice;
  final dynamic typeFile;
  final dynamic addDate;
  final String? type;

  AttachmentModel({
    this.id,
    this.fkInvoice,
    this.invoiceAddress,
    this.stateclient,
    this.idClients,
    this.nameEnterprise,
    this.fileAttachInvoice,
    this.typeFile,
    this.addDate,
    this.type,
  });

  AttachmentModel copyWith({
    int? id,
    int? fkInvoice,
    String? invoiceAddress,
    String? stateclient,
    int? idClients,
    String? nameEnterprise,
    String? fileAttachInvoice,
    dynamic typeFile,
    dynamic addDate,
    String? type,
  }) =>
      AttachmentModel(
        id: id ?? this.id,
        fkInvoice: fkInvoice ?? this.fkInvoice,
        invoiceAddress: invoiceAddress ?? this.invoiceAddress,
        stateclient: stateclient ?? this.stateclient,
        idClients: idClients ?? this.idClients,
        nameEnterprise: nameEnterprise ?? this.nameEnterprise,
        fileAttachInvoice: fileAttachInvoice ?? this.fileAttachInvoice,
        typeFile: typeFile ?? this.typeFile,
        addDate: addDate ?? this.addDate,
        type: type ?? this.type,
      );

  factory AttachmentModel.fromJson(Map<String, dynamic> json) => AttachmentModel(
    id: json["id"],
    fkInvoice: json["fk_invoice"],
    invoiceAddress: json["invoice_address"],
    stateclient: json["stateclient"],
    idClients: json["id_clients"],
    nameEnterprise: json["name_enterprise"],
    fileAttachInvoice: json["file_attach_invoice"],
    typeFile: json["type_file"],
    addDate: json["add_date"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fk_invoice": fkInvoice,
    "invoice_address": invoiceAddress,
    "stateclient": stateclient,
    "id_clients": idClients,
    "name_enterprise": nameEnterprise,
    "file_attach_invoice": fileAttachInvoice,
    "type_file": typeFile,
    "add_date": addDate,
    "type": type,
  };
}
