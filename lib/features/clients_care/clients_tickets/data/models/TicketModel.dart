import 'category_model.dart';
import 'status_model.dart';
import 'sub_category_model.dart';

class TicketModel {
  TicketModel({
    this.fkClient,
    this.typeProblem,
    this.detailsProblem,
    this.notesTicket,
    this.typeTicket,
    this.fkUserOpen,
    this.fkUserClose,
    this.fkUserRecive,
    this.dateOpen,
    this.dateClose,
    this.dateRecive,
    this.clientType,
    this.closeId,
    this.reciveId,
    this.openId,
    this.iDcustomer,
    this.idTicket,
    this.nameEnterprisetc,
    this.notesRate,
    this.rate,
    this.fkuserRate,
    this.dateRate,
    this.department,
    this.suspendId,
    this.suspendDate,
    this.categoriesTicketFk,
    this.subcategoriesTicketFk,
    this.ticketSource,
    this.nameClient,
    this.nameEnterprise,
    this.status,
  });

  String? fkClient;
  String? typeProblem;
  String? detailsProblem;
  String? notesTicket;
  String? typeTicket;
  dynamic fkUserOpen;
  dynamic fkUserClose;
  dynamic fkUserRecive;
  dynamic dateOpen;
  dynamic dateClose;
  dynamic dateRecive;
  String? clientType;
  dynamic closeId;
  dynamic reciveId;
  dynamic openId;
  dynamic iDcustomer;
  String? idTicket;
  dynamic nameEnterprisetc;
  dynamic notesRate;
  dynamic rate;
  dynamic fkuserRate;
  dynamic dateRate;
  dynamic department;
  dynamic suspendId;
  dynamic suspendDate;
  List<CategoryModel>? categoriesTicketFk;
  List<SubCategoryModel>? subcategoriesTicketFk;
  dynamic ticketSource;
  String? nameClient;
  String? nameEnterprise;
  List<List<StatusModel>>? status;

  TicketModel.fromJson(dynamic json) {
    fkClient = json['fk_client'].toString();
    typeProblem = json['type_problem'];
    detailsProblem = json['details_problem'];
    notesTicket = json['notes_ticket'];
    typeTicket = json['type_ticket'];
    fkUserOpen = json['fk_user_open'];
    fkUserClose = json['fk_user_close'];
    fkUserRecive = json['fk_user_recive'];
    dateOpen = json['date_open'];
    dateClose = json['date_close'];
    dateRecive = json['date_recive'];
    clientType = json['client_type'];
    closeId = json['close_id'];
    reciveId = json['recive_id'];
    openId = json['open_id'];
    iDcustomer = json['IDcustomer'];
    idTicket = json['id_ticket'].toString();
    nameEnterprisetc = json['name_enterprisetc'];
    notesRate = json['notes_rate'];
    rate = json['rate'];
    fkuserRate = json['fkuser_rate'];
    dateRate = json['date_rate'];
    department = json['department'];
    suspendId = json['suspend_id'];
    suspendDate = json['suspend_date'];
    if (json['categories_ticket_fk'] != null) {
      categoriesTicketFk = [];
      json['categories_ticket_fk'].forEach((v) {
        categoriesTicketFk?.add(CategoryModel.fromMap(v));
      });
    }
    if (json['subcategories_ticket_fk'] != null) {
      subcategoriesTicketFk = [];
      json['subcategories_ticket_fk'].forEach((v) {
        subcategoriesTicketFk?.add(SubCategoryModel.fromMap(v));
      });
    }
    ticketSource = json['ticket_source'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    if (json['status'] != null) {
      status = [];
      for (final element in json['status']) {
        final List<StatusModel> statusModel = [];
        for (final statusElement in element) {
          statusModel.add(StatusModel.fromJson(statusElement));
        }
        status?.add(statusModel);
      }
    }
  }

  TicketModel copyWith({
    String? fkClient,
    String? typeProblem,
    String? detailsProblem,
    String? notesTicket,
    String? typeTicket,
    dynamic fkUserOpen,
    dynamic fkUserClose,
    dynamic fkUserRecive,
    dynamic dateOpen,
    dynamic dateClose,
    dynamic dateRecive,
    String? clientType,
    dynamic closeId,
    dynamic reciveId,
    dynamic openId,
    dynamic iDcustomer,
    String? idTicket,
    dynamic nameEnterprisetc,
    dynamic notesRate,
    dynamic rate,
    dynamic fkuserRate,
    dynamic dateRate,
    dynamic department,
    dynamic suspendId,
    dynamic suspendDate,
    List<CategoryModel>? categoriesTicketFk,
    List<SubCategoryModel>? subcategoriesTicketFk,
    dynamic ticketSource,
    String? nameClient,
    String? nameEnterprise,
    List<List<StatusModel>>? status,
  }) {
    return TicketModel(
      fkClient: fkClient ?? this.fkClient,
      typeProblem: typeProblem ?? this.typeProblem,
      detailsProblem: detailsProblem ?? this.detailsProblem,
      notesTicket: notesTicket ?? this.notesTicket,
      typeTicket: typeTicket ?? this.typeTicket,
      fkUserOpen: fkUserOpen ?? this.fkUserOpen,
      fkUserClose: fkUserClose ?? this.fkUserClose,
      fkUserRecive: fkUserRecive ?? this.fkUserRecive,
      dateOpen: dateOpen ?? this.dateOpen,
      dateClose: dateClose ?? this.dateClose,
      dateRecive: dateRecive ?? this.dateRecive,
      clientType: clientType ?? this.clientType,
      closeId: closeId ?? this.closeId,
      reciveId: reciveId ?? this.reciveId,
      openId: openId ?? this.openId,
      iDcustomer: iDcustomer ?? this.iDcustomer,
      idTicket: idTicket ?? this.idTicket,
      nameEnterprisetc: nameEnterprisetc ?? this.nameEnterprisetc,
      notesRate: notesRate ?? this.notesRate,
      rate: rate ?? this.rate,
      fkuserRate: fkuserRate ?? this.fkuserRate,
      dateRate: dateRate ?? this.dateRate,
      department: department ?? this.department,
      suspendId: suspendId ?? this.suspendId,
      suspendDate: suspendDate ?? this.suspendDate,
      categoriesTicketFk: categoriesTicketFk ?? this.categoriesTicketFk,
      subcategoriesTicketFk:
          subcategoriesTicketFk ?? this.subcategoriesTicketFk,
      ticketSource: ticketSource ?? this.ticketSource,
      nameClient: nameClient ?? this.nameClient,
      nameEnterprise: nameEnterprise ?? this.nameEnterprise,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fk_client'] = fkClient;
    map['type_problem'] = typeProblem;
    map['details_problem'] = detailsProblem;
    map['notes_ticket'] = notesTicket;
    map['type_ticket'] = typeTicket;
    map['fk_user_open'] = fkUserOpen;
    map['fk_user_close'] = fkUserClose;
    map['fk_user_recive'] = fkUserRecive;
    map['date_open'] = dateOpen;
    map['date_close'] = dateClose;
    map['date_recive'] = dateRecive;
    map['client_type'] = clientType;
    map['close_id'] = closeId;
    map['recive_id'] = reciveId;
    map['open_id'] = openId;
    map['IDcustomer'] = iDcustomer;
    map['id_ticket'] = idTicket;
    map['name_enterprisetc'] = nameEnterprisetc;
    map['notes_rate'] = notesRate;
    map['rate'] = rate;
    map['fkuser_rate'] = fkuserRate;
    map['date_rate'] = dateRate;
    map['department'] = department;
    map['suspend_id'] = suspendId;
    map['suspend_date'] = suspendDate;
    if (categoriesTicketFk != null) {
      map['categories_ticket_fk'] =
          categoriesTicketFk?.map((v) => v.toMap()).toList();
    }
    if (subcategoriesTicketFk != null) {
      map['subcategories_ticket_fk'] =
          subcategoriesTicketFk?.map((v) => v.toMap()).toList();
    }
    map['ticket_source'] = ticketSource;
    map['name_client'] = nameClient;
    map['name_enterprise'] = nameEnterprise;
    if (status != null) {
      map['status'] =
          status?.map((v) => v.map((e) => e.toJson()).toList()).toList();
    }
    return map;
  }
}
