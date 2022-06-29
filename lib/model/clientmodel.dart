import 'package:crm_smart/Repository/cache_repo.dart';

class ClientModel extends CacheRepository{
  ClientModel({
     this.idClients,
     this.nameClient,
     this.nameEnterprise,
     this.typeJob,
     this.city,
     this.location,
     this.fkRegoin,
     this.fkcountry,
     this.dateCreate,
     this.typeClient,
     this.fkUser,
     this.dateTransfer,
     this.mobile,
     this.dateChangetype,
     this.reasonChange,
     this.reasonTransfer,
     this.nameCountry,

     this.nameUser,
    this.name_regoin,
    this.total,
    this.amount_paid,
    this.date_price,
    this.offer_price,
    // this.desc_reason,
    this.user_do,
    // this.value_back,
    // this.iduser_approve,
    this.	isApprove,
    // this.nameuserApprove,
    this.nameuserdoning,
    // this.date_approve,
    // this.id_invoice,
    this.nameusertransfer,
    this.fkusertrasfer,
    this.mobileuser,
    this.total_paid,
    this.ismarketing,
    this.name_city,
    this.namemaincity,
    this.id_maincity,
    this.clientusername,
  });
  late final String? idClients;
  late final String? nameClient;
  late final String? nameEnterprise;
  late final String? typeJob;
  late final String? city;
  late final String? location;
  late final String? fkRegoin;
  late final String? fkcountry;
  late final String? dateCreate;
  late final String? typeClient;
  late final String? fkUser;
  late final String? dateTransfer;
  late final String? mobile;
  late final String? dateChangetype;
  late final String? reasonChange;
  late final String? reasonTransfer;
  late final String? nameCountry;

  late final String? nameUser;
  late final String? name_regoin;
  late  String? total;
  late  String? amount_paid;

  late final String? offer_price;
  late final String? date_price;

  late final String? user_do;
  // late final String? desc_reason;//منسحب
  // late final String? value_back;
  // late final String? iduser_approve;
   String? 	isApprove;
  late final String? 	nameuserdoning;
  // late final String? 	nameuserApprove;
  // late final String? 	date_approve;
  //late  String? 	id_invoice;

  late final String? nameusertransfer;
  late final String? fkusertrasfer;
  late final String? mobileuser;
  late  String? total_paid;
  late  String? ismarketing;
  late  String? clientusername;
  String?
      name_city,
      namemaincity,
      id_maincity;

  ClientModel.fromJson(Map<String, dynamic> json){
    idClients = json['id_clients'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    typeJob = json['type_job'];
    city = json['city'];
    location = json['location'];
    fkRegoin = json['fk_regoin'];
    fkcountry = json['fk_country'];
    dateCreate = json['date_create'];
    typeClient = json['type_client'];
    fkUser = json['fk_user'];
    dateTransfer = json['date_transfer'];
    mobile = json['mobile'];
    dateChangetype = json['date_changetype'];
    reasonChange = json['reason_change'];
    reasonTransfer = json['reason_transfer'];
    nameCountry = json['nameCountry'];
    nameUser = json['nameUser'];
    name_regoin = json['name_regoin'];
    total = json['total'];
    amount_paid = json['amount_paid'];
    /////////////////////////////
    offer_price=json['offer_price'];
    date_price=json['date_price'];

    user_do = json['user_do'];
    // desc_reason=json['desc_reason'];
    // value_back=json['value_back'];
    // iduser_approve=json['iduser_approve'];
    isApprove=json['isApprove'];
    nameuserdoning=json['nameuserdoning'];//الموظف الي حول العميل
    //nameuserApprove=json['nameuserApprove'];//الموظف الي وافق على العميل معتمد الاشتراك
    //date_approve=json['date_approve'];  //
    //id_invoice=json['id_invoice'];  //

    nameusertransfer = json['nameusertransfer'];
    fkusertrasfer = json['fkusertrasfer'];
    mobileuser = json['mobileuser'];
    total_paid = json['total_paid'];
    ismarketing = json['ismarketing'];
    name_city = json['name_city'];
    namemaincity = json['namemaincity'];
    id_maincity = json['id_maincity'];
    clientusername = json['clientusername'];
  }

  Map<String, dynamic> toJson() {
     final _data = <String, dynamic>{};
    _data['id_clients'] = idClients;
    _data['name_client'] = nameClient;
    _data['name_enterprise'] = nameEnterprise;
    _data['type_job'] = typeJob;
    _data['city'] = city;
    _data['location'] = location;
    _data['fk_regoin'] = fkRegoin;
    _data['fk_country'] = fkcountry;
    _data['date_create'] = dateCreate;
    _data['type_client'] = typeClient;
    _data['fk_user'] = fkUser;
    _data['date_transfer'] = dateTransfer;
    _data['mobile'] = mobile;
    _data['date_changetype'] = dateChangetype;
    _data['reason_change'] = reasonChange;
    _data['reason_transfer'] = reasonTransfer;
    _data['nameCountry'] = nameCountry;
    _data['name_regoin'] = name_regoin;
    _data['total'] = total;
    _data['amount_paid'] = amount_paid;
    _data['nameUser'] = nameUser;
     _data['offer_price'] = offer_price;
     _data['date_price'] = date_price;
     _data['user_do'] = user_do;
     // _data['desc_reason'] = desc_reason;
     // _data['value_back'] = value_back;
     // _data['iduser_approve'] = iduser_approve;
     _data['isApprove'] = 	isApprove;
     _data['nameuserdoning'] = 	nameuserdoning;
     // _data['nameuserApprove'] = 	nameuserApprove;
     // _data['date_approve'] = 	date_approve;
     //_data['id_invoice'] = 	id_invoice;

     _data['nameusertransfer'] = nameusertransfer;
     _data['fkusertrasfer'] = fkusertrasfer;
     _data['mobileuser'] = mobileuser;
     _data['total_paid'] = total_paid;
     _data['ismarketing'] = ismarketing;
     _data['city'] = city;
     _data['name_city'] = name_city;
     _data['namemaincity'] = namemaincity;
     _data['id_maincity'] = id_maincity;
     _data['clientusername'] = clientusername;
    return _data;
  }
  String userAsString() {
    return "${this.nameEnterprise}";
    // return '#${this.idUser} ${this.nameUser}';
  }

  ///this method will prevent the override of toString
  bool getfilteruser(String filter) {
    return this.nameEnterprise.toString().contains(filter);
  }
}