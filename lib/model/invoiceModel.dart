import 'dart:convert';

import 'package:crm_smart/Repository/cache_repo.dart';
import 'package:crm_smart/view_model/notify_vm.dart';

import '../constants.dart';

class InvoiceModel extends CacheRepository{
  InvoiceModel({
     this.idInvoice,
     this.dateCreate,
     this.typePay,
     this.renewYear,
     this.typeInstallation,
     this.imageRecord,
     this.imagelogo,
     this.fkIdClient,
     this.fkIdUser,
     this.amountPaid,
     this.notes,
     this.nameUser,
     this.nameClient,
     required this.products,
     this.total,
    this.name_enterprise,
    this.fk_regoin,
    this.name_regoin,
    this.type_client,
    this.lastuserupdate,
    this.lastuserupdateName,

    this.nameuserinstall,
    this.dateinstall_done,
    this.isdoneinstall,
    this.userinstall,
    this.dateinstall_task,
    this.fkusertask,
    this.nameuserApprove,
    this.date_lastuserupdate,
    this.path,
    this.fk_country,
    this.reason_date,
    this.date_approve,
    this.stateclient,
    this.value_back,
    this.desc_reason_back,
    this.reason_back,
    this.fkuser_back,
    this.date_change_back,
    this.nameuserback,
    this.nameuserreplay,
    this.nameusertask,

    this.daterepaly,
    this.fkuserdatareplay,

    this.iduser_approve,
    this.isApprove,
    this.mobile,
    this.ismarketing,
    this.city,
    this.name_city,
    this.namemaincity,
    this.id_maincity,
    this.numbarnch,
    this.numusers,
    this.nummostda,
    this.numTax,
    this.imagelogopath,
    //name_city,mcit.namemaincity,mcit.id_maincity
    // this.nameuserApprove,
    // this.date_approve,

  });
    String? idInvoice;
    String? dateCreate;
    String? typePay;
    String? renewYear;
    String? typeInstallation;
    String? imageRecord='';
    String? imagelogo='';
    String? imagelogopath='';
    String? fkIdClient;
    String? fkIdUser;
    String? amountPaid;
    String? notes;
    String? nameUser;
    String? nameClient;
    String? total;
    String? name_enterprise;
    String? fk_regoin;
    String? name_regoin;
    String? type_client;
    String? lastuserupdate;
    String? lastuserupdateName;

    String? nameuserinstall;
    String? dateinstall_done;
    String? isdoneinstall;
    String? userinstall;
    String? dateinstall_task;
    String? fkusertask;
    String? date_lastuserupdate;
    String? path = '';
    String? fk_country;
    String? reason_date;
    String? stateclient;
    String? value_back;
    String? desc_reason_back;
    String? reason_back;
    String? fkuser_back;
    String? date_change_back;
    String? nameuserback;
    String? nameuserreplay;
    String? nameusertask;
    String? daterepaly;
    String? fkuserdatareplay;

    String? iduser_approve;
    String? isApprove;
    String? nameuserApprove;
    String? date_approve;
    String? mobile;//mobile client
    String? ismarketing;
    String? numbarnch;
    String? numusers;
    String? nummostda;
    String? numTax;
    String?  city,
  name_city,
  namemaincity,
  id_maincity;

  //Map<String, dynamic> products;
   List<ProductsInvoice>? products;
  // var products;
  InvoiceModel.fromJson(Map<String, dynamic> jsondata){
    print(jsondata);
    idInvoice = jsondata['id_invoice'];
    dateCreate = jsondata['date_create'];
    typePay = jsondata['type_pay'];
    renewYear = jsondata['renew_year'];
    typeInstallation = jsondata['type_installation'];
    //json['img_image'].toString().trim().isEmpty?json['img_image']: urlimage+ json['img_image'];

    imageRecord = jsondata['image_record'].toString().trim().isEmpty
    ||jsondata['image_record']==null
    ? jsondata['image_record']
    : urlfile+ jsondata['image_record'];

    imagelogo = jsondata['imagelogo'].toString().trim().isEmpty
    ||jsondata['imagelogo']==null
    ? jsondata['imagelogo']
    : urlfilelogo+ jsondata['imagelogo'];

    fkIdClient = jsondata['fk_idClient'];
    fkIdUser = jsondata['fk_idUser'];
    amountPaid = jsondata['amount_paid'];
    notes = jsondata['notes'];
    nameUser = jsondata['nameUser'];
    nameClient = jsondata['name_client'];
    total = jsondata['total'];
    name_enterprise=jsondata['name_enterprise'];
    fk_regoin=jsondata['fk_regoin'];
    name_regoin=jsondata['name_regoin'];
    type_client=jsondata['type_client'];
    lastuserupdate=jsondata['lastuserupdate'];
    lastuserupdateName=jsondata['lastuserupdateName'];

    nameuserinstall=jsondata['nameuserinstall'];
    dateinstall_done=jsondata['dateinstall_done'];
    isdoneinstall=jsondata['isdoneinstall'];
    userinstall=jsondata['userinstall'];
    dateinstall_task=jsondata['dateinstall_task'];
    fkusertask=jsondata['fkusertask'];
    date_lastuserupdate=jsondata['date_lastuserupdate'];
    path=jsondata['path'];
    fk_country=jsondata['fk_country'];
    reason_date=jsondata['reason_date'];
    stateclient=jsondata['stateclient'];
    value_back=jsondata['value_back'];
    desc_reason_back=jsondata['desc_reason_back'];
    reason_back=jsondata['reason_back'];
    fkuser_back=jsondata['fkuser_back'];
    date_change_back=jsondata['date_change_back'];
    nameuserback=jsondata['nameuserback'];
    nameuserreplay=jsondata['nameuserreplay'];
    nameusertask=jsondata['nameusertask'];

    daterepaly=jsondata['daterepaly'];
    fkuserdatareplay=jsondata['fkuserdatareplay'];

    iduser_approve=jsondata['iduser_approve'];
    isApprove=jsondata['isApprove'];
    nameuserApprove=jsondata['nameuserApprove'];
    date_approve=jsondata['date_approve'];
    mobile=jsondata['mobile'];
    ismarketing=jsondata['ismarketing'];
    city = jsondata['city'];
    name_city = jsondata['name_city'];
    namemaincity = jsondata['namemaincity'];
    id_maincity = jsondata['id_maincity'];
    numbarnch = jsondata['numbarnch'];
    numusers = jsondata['numusers'];
    nummostda = jsondata['nummostda'];
    numTax = jsondata['numTax'];
    products=getproud(jsondata['products']);
      //  json.decode(
       // jsondata['products']
   // )//  jsondata['products']
   // .map(
       //     (e) {
              //print('eee'+json.decode(e));
        //      ProductsInvoice.fromJson(e);
              //print('eee'+e);
       // }).toList();
    //     .add(
    //     ProductsInvoice.fromJson(
    //         json.decode(jsondata['products'])
    //     )
    // );
    //     (json.decode(jsondata['products']) as List)
    // .map((e) => ProductsInvoice.fromJson(e)).toList();
       //List.from(

        //);
    // (){
    //   for (int i = 0; i < jsondata['products'].length; i++) {
    //   products!.add(
    //       ProductsInvoice.fromJson(jsondata['products'][i]));
    // }
    // return products;
    // }
    //
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_invoice'] = idInvoice;
    _data['date_create'] = dateCreate;
    _data['type_pay'] = typePay;
    _data['renew_year'] = renewYear;
    _data['type_installation'] = typeInstallation;
    _data['image_record'] = imageRecord;
    _data['imagelogo'] = imagelogo;
    _data['fk_idClient'] = fkIdClient;
    _data['fk_idUser'] = fkIdUser;
    _data['amount_paid'] = amountPaid;
    _data['notes'] = notes;
    _data['nameUser'] = nameUser;
    _data['name_client'] = nameClient;
    _data['total'] = total;
    _data['name_enterprise'] = name_enterprise;
    _data['fk_regoin'] = fk_regoin;
    _data['name_regoin'] = name_regoin;
    _data['type_client'] = type_client;
    _data['lastuserupdate'] = lastuserupdate;
    _data['lastuserupdateName'] = lastuserupdateName;

    _data['nameuserinstall'] = nameuserinstall;
    _data['dateinstall_done'] = dateinstall_done;
    _data['isdoneinstall'] = isdoneinstall;
    _data['userinstall'] = userinstall;//id user
    _data['dateinstall_task'] = dateinstall_task;
    _data['fkusertask'] = fkusertask;
    _data['date_lastuserupdate'] = date_lastuserupdate;
    _data['path'] = path;
    _data['fk_country'] = fk_country;
    _data['reason_date'] = reason_date;
    _data['stateclient'] = stateclient;
    _data['value_back'] = value_back;
    _data['desc_reason_back'] = desc_reason_back;
    _data['reason_back'] = reason_back;
    _data['fkuser_back'] = fkuser_back;
    _data['date_change_back'] = date_change_back;
    _data['nameuserback'] = nameuserback;
    _data['nameuserreplay'] = nameuserreplay;
    _data['nameusertask'] = nameusertask;

    _data['daterepaly'] = daterepaly;
    _data['fkuserdatareplay'] = fkuserdatareplay;

    _data['iduser_approve'] = iduser_approve;
    _data['isApprove'] = 	isApprove;

    _data['date_approve'] = date_approve;
    _data['nameuserApprove'] = nameuserApprove;
    _data['mobile'] = mobile;
    _data['ismarketing'] = ismarketing;
    _data['city'] = city;
    _data['name_city'] = name_city;
    _data['namemaincity'] = namemaincity;
    _data['id_maincity'] = id_maincity;
    _data['numbarnch'] = numbarnch;
    _data['nummostda'] = nummostda;
    _data['numusers'] = numusers;
    _data['numTax'] = numTax;
    _data['products'] =
        products!.map((e)=>e.toJson()).toList();
    return _data;
  }
  List<ProductsInvoice> getproud(data){
    List<ProductsInvoice> prodlist = [];
    if(data!=null){
    for (int i = 0; i < data.length; i++) {
      print(i);

      //print("data "+ "[" + data[i] + "]");
      prodlist.add(ProductsInvoice.fromJson(data[i]));
    }
    }
    return prodlist;

  }
}

class ProductsInvoice extends CacheRepository{
  ProductsInvoice({
     this.idInvoiceProduct,
     this.fkIdInvoice,
     this.fkProduct,
     this.amount,
     this.price,
     this.taxtotal,
     this.rateAdmin,
     this.rateUser,
     this.idProduct,
     this.nameProduct,
     this.priceProduct,
     this.type,
     this.fkCountry,
     this.fkConfig,
     this.isdeleted,
    this.fkclient,
    this.fkuser

  });
  late  String? idInvoiceProduct;
  late  String? fkIdInvoice;
  late  String? fkProduct;
  late  String? amount;
  late  String? price;
  late  String? taxtotal;
  late  String? rateAdmin;
  late  String? rateUser;
  String? idProduct;
  String? nameProduct;
  late final String? priceProduct;
  String? type;
  late final String? fkCountry;
  String? fkConfig;
  bool? isdeleted =false;
  String? fkuser;
  String? fkclient;


  ProductsInvoice.fromJson(Map<String, dynamic> json){
    print('in product from json ');
    print(json);
    idInvoiceProduct = json['id_invoice_product'];
    fkIdInvoice = json['fk_id_invoice'];
    fkProduct = json['fk_product'];
    amount = json['amount'];
    price = json['price'];
    taxtotal = json['taxtotal'];;
    rateAdmin = json['rate_admin'];
    rateUser = json['rateUser'];
    idProduct = json['id_product'];
    nameProduct = json['nameProduct'];
    priceProduct = json['priceProduct'];
    type = json['type'];
    fkCountry = json['fk_country'];
    fkConfig = json['fk_config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_invoice_product'] = idInvoiceProduct;
    _data['fk_id_invoice'] = fkIdInvoice;
    _data['fk_product'] = fkProduct;
    _data['amount'] = amount;
    _data['price'] = price;
    _data['taxtotal'] = taxtotal;
    _data['rate_admin'] = rateAdmin;
    _data['rateUser'] = rateUser;
    _data['id_product'] = idProduct;
    _data['nameProduct'] = nameProduct;
    _data['priceProduct'] = priceProduct;
    _data['type'] = type;
    _data['fk_country'] = fkCountry;
    _data['fk_config'] = fkConfig==null?"null":fkConfig;
    return _data;
  }
}