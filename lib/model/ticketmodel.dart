import '../core/common/enums/ticket_source_enum.dart';
import 'category_model.dart';
import 'sub_category_model.dart';

class TicketModel {
  TicketModel({
    required this.idTicket,
    required this.fkClient,
    required this.typeProblem,
    required this.detailsProblem,
    required this.notesTicket,
    required this.typeTicket,
    required this.fkUserOpen,
    required this.fkUserClose,
    required this.fkUserRecive,
    required this.dateOpen,
    required this.dateClose,
    required this.dateRecive,
    required this.clientType,
    required this.nameClient,
    required this.nameEnterprise,
    required this.nameRegoin,
    required this.nameuseropen,
    required this.nameuserrecive,
    required this.nameuserclose,
    required this.fk_country,
    this.ticketSource,
    this.mobile,
    this.transferticket,
    // new
    this.idTicketDetail,
    this.typeTicketReopen,
    this.fkUserReopen,
    this.dateReopen,
    this.categoriesTicketFk,
    this.subcategoriesTicketFk,
  });

  late final String? idTicket;
  late final String? fkClient;
  late final String? typeProblem;
  late final String? detailsProblem;
  late final String? notesTicket;
  late final String? typeTicket;
  late final String? fkUserOpen;
  late final String? fkUserClose;
  late final String? fkUserRecive;
  late final String? dateOpen;
  late final String? dateClose;
  late final String? dateRecive;
  late final String? clientType;
  late final TicketSourceEnums? ticketSource;

  late final String? nameClient;
  late final String? nameEnterprise;
  late final String? nameRegoin;
  late final String? nameuseropen;
  late final String? nameuserrecive;
  late final String? nameuserclose;
  late final String? fk_country;

  late final String? mobile;
  late final String? rate;
  late final String? fkuser_rate;
  late final String? date_rate;
  late final String? nameuserrate;
  late final String? notes_rate;

  late List<TransferTicket?>? transferticket = [];

  late List<CategoryModel>? categories = [];
  late List<SubCategoryModel>? subCategories = [];
  // new fields
  late final String? idTicketDetail;
  late final String? typeTicketReopen;
  late final String? fkUserReopen;
  late final String? dateReopen;
  late final List<CategoryModel>? categoriesTicketFk;
  late final List<SubCategoryModel>? subcategoriesTicketFk;

  TicketModel.fromJson(Map<String, dynamic> json) {
    idTicket = json['id_ticket'].toString();
    fkClient = json['fk_client']?.toString();
    typeProblem = json['type_problem']?.toString();
    detailsProblem = json['details_problem']?.toString();
    notesTicket = json['notes_ticket']?.toString();
    typeTicket = json['type_ticket']?.toString();
    fkUserOpen = json['fk_user_open']?.toString();
    fkUserClose = json['fk_user_close']?.toString();
    fkUserRecive = json['fk_user_recive']?.toString();
    dateOpen = json['date_open']?.toString();
    dateClose = json['date_close']?.toString();
    dateRecive = json['date_recive']?.toString();
    clientType = json['client_type']?.toString();
    nameClient = json['name_client']?.toString();
    nameEnterprise = json['name_enterprise']?.toString();
    nameRegoin = json['name_regoin']?.toString();
    nameuseropen = json['nameuseropen']?.toString();
    nameuserrecive = json['nameuserrecive']?.toString();
    nameuserclose = json['nameuserclose']?.toString();
    fk_country = json['fk_country']?.toString();
    ticketSource = TicketSourceEnumsExtension.fromString(json['ticket_source']);
    mobile = json['mobile']?.toString();
    rate = json['rate']?.toString();
    fkuser_rate = json['fkuser_rate']?.toString();
    date_rate = json['date_rate']?.toString();
    nameuserrate = json['nameuserrate']?.toString();
    notes_rate = json['notes_rate']?.toString();
    transferticket = getproud(json['transferticket']);
    categories = _prepareCategories(json);
    subCategories = _prepareSubCategories(json);
    // new
    idTicketDetail = json['id_ticket_detail']?.toString();
    typeTicketReopen = json['type_ticket_reopen']?.toString();
    fkUserReopen = json['fk_user_reopen']?.toString();
    dateReopen = json['date_reopen']?.toString();
    categoriesTicketFk = _prepareCategories(json);
    subcategoriesTicketFk = _prepareSubCategories(json);
  }

  List<SubCategoryModel>? _prepareSubCategories(Map<String, dynamic> json) {
    // todo: data comming from the backend is not handled yet so it causes erros,, it must a be a list of subcategories but we are getting Strings
    // todo: remove this return after the backend is fixed
    // return [];

    if (json['subcategories_ticket_fk'].runtimeType == String) {
      // print(
      //     "id_ticket is => ${json['id_ticket']} >> subcategories_ticket_fk is a string => ${json['subcategories_ticket_fk']}");
      return [];
    }
    // print(
    //     "id_ticket is => ${json['id_ticket']} >> subcategories_ticket_fk is a list => ${json['subcategories_ticket_fk']}");

    return json['subcategories_ticket_fk']
            ?.map<SubCategoryModel>((e) => SubCategoryModel.fromMap(e))
            .toList() ??
        [];
  }

  List<CategoryModel>? _prepareCategories(Map<String, dynamic> json) {
    return json['categories_ticket_fk']
            ?.map<CategoryModel>((e) => CategoryModel.fromMap(e))
            .toList() ??
        [];
  }

  List<TransferTicket> getproud(data) {
    List<TransferTicket> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(TransferTicket.fromJson(data[i]));
      }
    }
    return prodlist;
  }
}

class TransferTicket {
  TransferTicket({
    required this.id_tr_ticket,
    required this.resoantransfer_ticket,
    required this.fkuser_to,
    required this.fkuserfrom,
    required this.date_assigntr,
    required this.fk_ticket,
    required this.nameuserto,
    required this.nameuserfrom,
  });

  late String? id_tr_ticket;
  late String? resoantransfer_ticket;
  late String? fkuser_to;
  late String? fkuserfrom;
  late String? date_assigntr;
  late String? fk_ticket;
  late String? nameuserto;
  late String? nameuserfrom;

  TransferTicket.fromJson(Map<String, dynamic> json) {
    id_tr_ticket = json['id_tr_ticket'];
    resoantransfer_ticket = json['resoantransfer_ticket'];
    fkuser_to = json['fkuser_to'];
    fkuserfrom = json['fkuserfrom'];
    date_assigntr = json['date_assigntr'];
    fk_ticket = json['fk_ticket'];
    nameuserfrom = json['nameuserfrom'];
    nameuserto = json['nameuserto'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_tr_ticket'] = id_tr_ticket;
    _data['resoantransfer_ticket'] = resoantransfer_ticket;
    _data['fkuser_to'] = fkuser_to;
    _data['fkuserfrom'] = fkuserfrom;
    _data['date_assigntr'] = date_assigntr;
    _data['fk_ticket'] = fk_ticket;
    _data['nameuserfrom'] = nameuserfrom;
    _data['nameuserto'] = nameuserto;

    return _data;
  }
}

class NewTicketModel {
  //{ //        "fk_client": "222",
//         "type_problem": "مشكلة",
//         "details_problem": "وصف",
//         "client_type": null,
//         "type_ticket_reopen": 1,
//         "type_ticket": "اعادة فتح",
//         "fk_user_reopen": 408,
//         "date_reopen": "2024-03-21 15:45:32",
//         "id_ticket_detail": 9}
//{
//         "fk_client": "222",
//         "type_problem": "مشكلة",
//         "details_problem": "وصف",
//         "client_type": null,
//         "type_ticket_reopen": 0,
//         "type_ticket": "جديدة",
//         "fk_user_open": 408,
//         "date_open": "2024-03-21 15:50:05",
//         "id_ticket_detail": 10
//     }

  final String? fkClient;
  final String? typeProblem;
  final String? detailsProblem;
  final String? clientType;
  final String? typeTicketReopen;
  final String? typeTicket;
  final String? fkUserReopen;
  final String? dateReopen;
  final String? idTicketDetail;
  final String? fkUserOpen;

  NewTicketModel({
    this.fkClient,
    this.typeProblem,
    this.detailsProblem,
    this.clientType,
    this.typeTicketReopen,
    this.typeTicket,
    this.fkUserReopen,
    this.dateReopen,
    this.idTicketDetail,
    this.fkUserOpen,
  });

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fk_client'] = fkClient;
    _data['type_problem'] = typeProblem;
    _data['details_problem'] = detailsProblem;
    _data['client_type'] = clientType;
    _data['type_ticket_reopen'] = typeTicketReopen;
    _data['type_ticket'] = typeTicket;
    _data['fk_user_reopen'] = fkUserReopen;
    _data['date_reopen'] = dateReopen;
    _data['id_ticket_detail'] = idTicketDetail;
    _data['fk_user_open'] = fkUserOpen;
    return _data;
  }

  factory NewTicketModel.fromJson(Map<String, dynamic> json) {
    return NewTicketModel(
      fkClient: json['fk_client']?.toString(),
      typeProblem: json['type_problem']?.toString(),
      detailsProblem: json['details_problem']?.toString(),
      clientType: json['client_type']?.toString(),
      typeTicketReopen: json['type_ticket_reopen']?.toString(),
      typeTicket: json['type_ticket']?.toString(),
      fkUserReopen: json['fk_user_reopen']?.toString(),
      dateReopen: json['date_reopen']?.toString(),
      idTicketDetail: json['id_ticket_detail']?.toString(),
      fkUserOpen: json['fk_user_open']?.toString(),
    );
  }

  NewTicketModel copyWith({
    String? fkClient,
    String? typeProblem,
    String? detailsProblem,
    String? clientType,
    String? typeTicketReopen,
    String? typeTicket,
    String? fkUserReopen,
    String? dateReopen,
    String? idTicketDetail,
    String? fkUserOpen,
  }) {
    return NewTicketModel(
      fkClient: fkClient ?? this.fkClient,
      typeProblem: typeProblem ?? this.typeProblem,
      detailsProblem: detailsProblem ?? this.detailsProblem,
      clientType: clientType ?? this.clientType,
      typeTicketReopen: typeTicketReopen ?? this.typeTicketReopen,
      typeTicket: typeTicket ?? this.typeTicket,
      fkUserReopen: fkUserReopen ?? this.fkUserReopen,
      dateReopen: dateReopen ?? this.dateReopen,
      idTicketDetail: idTicketDetail ?? this.idTicketDetail,
      fkUserOpen: fkUserOpen ?? this.fkUserOpen,
    );
  }
}
