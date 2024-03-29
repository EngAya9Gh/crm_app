import 'package:crm_smart/Repository/cache_repo.dart';
import 'package:crm_smart/model/participatModel.dart';
import 'package:image_picker/image_picker.dart';

import '../core/common/enums/enums.dart';
import '../core/utils/end_points.dart';
import 'agent_distributor_model.dart';

// enum AttachFileStatus { empty, network, picked, uploading, deleting, failedUpload, failedDelete, success }

enum AttachFileStatus { init, loading, failed, success }

class InvoiceModel extends CacheRepository {
  //region Variables
  String? idInvoice;
  String? dateCreate;
  String? typePay;
  String? currency_name;
  String? renewYear;
  String? typeInstallation;
  String? imageRecord = '';
  String? imagelogo = '';
  String? imagelogopath = '';
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
  String? mobile; //mobile client
  String? ismarketing;
  String? numbarnch;
  String? renewPlus;
  String? numusers;
  String? nummostda;
  String? numTax;
  String? hoursdelaytabel;
  String? hoursdelayinstall;
  String? clientusername;
  String? address_invoice;

  String? ready_install;
  String? date_readyinstall;
  String? user_ready_install;
  String? date_not_readyinstall;
  String? user_not_ready_install;
  String? nameuser_ready_install;
  String? nameuser_notready_install;
  String? count_delay_ready;
  String? isApproveFinance;
  String? iduser_FApprove;
  String? Date_FApprove;
  String? renew2year;
  String? participate_fk;
  String? rate_participate;
  String? type_seller;
  String? fk_agent;
  String? fk_regoin_invoice;
  String? name_regoin_invoice;
  String? date_delete;
  String? user_delete;
  bool? tag;
  String? city, name_city, namemaincity, id_maincity;

  //Map<String, dynamic> products;
  List<ProductsInvoice>? products;
  ParticipateModel? participal;
  AgentDistributorModel? agent_distibutor;
  List<DateInstallationClient>? datesInstallationClient;
  String? fileAttach;
  AttachFileStatus? attachFileStatus;
  AttachFileStatus? deleteAttachFileStatus;
  String? renew_agent;
  String? file_reject;
  List<FileAttach>? filesAttach;
  String? approveBackDone;
  String? TypeReadyClient;
  String? notes_ready;
  String? reason_suspend;
  String? reason_notReady;
  String? invoice_source;
  String? dateBackNow;

  //endregion

  //region Constructor
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
    this.renewPlus,
    this.numusers,
    this.nummostda,
    this.numTax,
    this.imagelogopath,
    this.hoursdelaytabel,
    this.hoursdelayinstall,
    this.clientusername,
    this.address_invoice,
    this.ready_install,
    this.date_readyinstall,
    this.user_ready_install,
    this.date_not_readyinstall,
    this.user_not_ready_install,
    this.nameuser_ready_install,
    this.nameuser_notready_install,
    this.count_delay_ready,
    this.isApproveFinance,
    this.iduser_FApprove,
    this.Date_FApprove,
    this.rate_participate,
    this.participate_fk,
    this.fk_agent,
    this.type_seller,
    this.currency_name,
    this.fk_regoin_invoice,
    this.name_regoin_invoice,
    this.user_delete,
    this.date_delete,
    this.datesInstallationClient,
    this.fileAttach,
    this.attachFileStatus,
    this.deleteAttachFileStatus,
    this.agent_distibutor,
    this.participal,
    this.renew2year,
    this.renew_agent,
    this.file_reject,
    this.filesAttach,
    this.approveBackDone,
    this.TypeReadyClient,
    this.notes_ready,
    this.reason_suspend,
    this.reason_notReady,
    this.invoice_source,
    this.dateBackNow,
    //name_city,mcit.namemaincity,mcit.id_maincity
    // this.nameuserApprove,
    // this.date_approve,
  });

  //endregion

  //region Json converters
  // var products;
  InvoiceModel.fromJson(Map<String, dynamic> jsondata) {
    idInvoice = jsondata['id_invoice']?.toString();
    user_delete = jsondata['user_delete']?.toString();
    date_delete = jsondata['date_delete']?.toString();
    dateCreate = jsondata['date_create']?.toString();
    typePay = jsondata['type_pay']?.toString();
    renewYear = jsondata['renew_year']?.toString();
    typeInstallation = jsondata['type_installation']?.toString();
    currency_name = jsondata['currency_name']?.toString();

    imageRecord = jsondata['image_record'].toString().trim().isEmpty ||
            jsondata['image_record'] == null
        ? jsondata['image_record']
        : EndPoints.baseUrls.urlfile + jsondata['image_record'];

    imagelogo = jsondata['imagelogo'].toString().trim().isEmpty ||
            jsondata['imagelogo'] == null
        ? jsondata['imagelogo']
        : EndPoints.baseUrls.urlfilelogo + jsondata['imagelogo'];

    fkIdClient = jsondata['fk_idClient']?.toString();
    fkIdUser = jsondata['fk_idUser']?.toString();
    amountPaid = jsondata['amount_paid']?.toString();
    notes = jsondata['notes']?.toString();
    nameUser = jsondata['nameUser']?.toString();
    nameClient = jsondata['name_client']?.toString();
    total = jsondata['total']?.toString();
    name_enterprise = jsondata['name_enterprise']?.toString();
    fk_regoin = jsondata['fk_regoin']?.toString();
    name_regoin = jsondata['name_regoin']?.toString();
    type_client = jsondata['type_client']?.toString();
    lastuserupdate = jsondata['lastuserupdate']?.toString();
    lastuserupdateName = jsondata['lastuserupdateName']?.toString();

    nameuserinstall = jsondata['nameuserinstall']?.toString();
    dateinstall_done = jsondata['dateinstall_done']?.toString();
    isdoneinstall = jsondata['isdoneinstall']?.toString();
    userinstall = jsondata['userinstall']?.toString();
    dateinstall_task = jsondata['dateinstall_task']?.toString();
    fkusertask = jsondata['fkusertask']?.toString();
    date_lastuserupdate = jsondata['date_lastuserupdate']?.toString();
    path = jsondata['path']?.toString();
    fk_country = jsondata['fk_country']?.toString();
    reason_date = jsondata['reason_date']?.toString();
    stateclient = jsondata['stateclient']?.toString();
    value_back = jsondata['value_back']?.toString();
    desc_reason_back = jsondata['desc_reason_back']?.toString();
    reason_back = jsondata['reason_back']?.toString();
    fkuser_back = jsondata['fkuser_back']?.toString();
    date_change_back = jsondata['date_change_back']?.toString();
    nameuserback = jsondata['nameuserback']?.toString();
    nameuserreplay = jsondata['nameuserreplay']?.toString();
    nameusertask = jsondata['nameusertask']?.toString();

    daterepaly = jsondata['daterepaly']?.toString();
    fkuserdatareplay = jsondata['fkuserdatareplay']?.toString();

    iduser_approve = jsondata['iduser_approve']?.toString();
    isApprove = jsondata['isApprove']?.toString();
    nameuserApprove = jsondata['nameuserApprove']?.toString();
    date_approve = jsondata['date_approve']?.toString();
    mobile = jsondata['mobile']?.toString();
    ismarketing = jsondata['ismarketing']?.toString();
    city = jsondata['city']?.toString();
    name_city = jsondata['name_city']?.toString();
    namemaincity = jsondata['namemaincity']?.toString();
    id_maincity = jsondata['id_maincity']?.toString();
    numbarnch = jsondata['numbarnch']?.toString();
    renewPlus = jsondata['renew_pluse']?.toString();
    numusers = jsondata['numusers']?.toString();
    nummostda = jsondata['nummostda']?.toString();
    numTax = jsondata['numTax']?.toString();
    hoursdelaytabel = jsondata['hoursdelaytabel']?.toString();
    hoursdelayinstall = jsondata['hoursdelayinstall']?.toString();
    clientusername = jsondata['clientusername']?.toString();
    address_invoice = jsondata['address_invoice']?.toString();
    ready_install = jsondata['ready_install']?.toString();
    date_readyinstall = jsondata['date_readyinstall']?.toString();
    user_ready_install = jsondata['user_ready_install']?.toString();
    date_not_readyinstall = jsondata['date_not_readyinstall']?.toString();
    user_not_ready_install = jsondata['user_not_ready_install']?.toString();
    nameuser_ready_install = jsondata['nameuser_ready_install']?.toString();
    nameuser_notready_install =
        jsondata['nameuser_notready_install']?.toString();
    count_delay_ready = jsondata['count_delay_ready']?.toString();
    isApproveFinance = jsondata['isApproveFinance']?.toString();
    iduser_FApprove = jsondata['iduser_FApprove']?.toString();
    Date_FApprove = jsondata['Date_FApprove']?.toString();
    renew2year = jsondata['renew2year']?.toString();
    rate_participate = jsondata['rate_participate']?.toString();
    participate_fk = jsondata['participate_fk']?.toString();
    fk_agent = jsondata['fk_agent']?.toString();
    type_seller = jsondata['type_seller']?.toString();
    fk_regoin_invoice = jsondata['fk_regoin_invoice']?.toString();
    name_regoin_invoice = jsondata['name_regoin_invoice']?.toString();
    renew_agent = jsondata['renew_agent']?.toString();

    participal = jsondata['participal_info'] == null
        ? null
        : getParticipateModel(jsondata['participal_info']);
    agent_distibutor = jsondata['agent_distibutor_info'] == null
        ? null
        : getAgentDistributorModel(jsondata['agent_distibutor_info']);
    products = getproud(jsondata['products']);
    datesInstallationClient = List.from(jsondata['dates_install_client'] ?? [])
        .map((e) => DateInstallationClient.fromJson(e))
        .toList();
    filesAttach = List.from(jsondata['files_attach'] ?? [])
        .map((e) => FileAttach.fromMap(e))
        .toList();
    fileAttach = jsondata['file_attach']?.toString();
    file_reject = jsondata['file_reject']?.toString();
    approveBackDone = jsondata['approve_back_done']?.toString();
    TypeReadyClient = jsondata['TypeReadyClient']?.toString();

    notes_ready = jsondata['notes_ready']?.toString();
    reason_suspend = jsondata['reason_suspend']?.toString();
    reason_notReady = jsondata['reason_notReady']?.toString();
    tag = jsondata['tag'] == "true" ? true : false;

    attachFileStatus = AttachFileStatus.init;
    deleteAttachFileStatus = AttachFileStatus.init;
    invoice_source = jsondata['invoice_source']?.toString();
    dateBackNow = jsondata['date_back_now']?.toString();
    //  json.decode(
    // jsondata['products']
    // )//  jsondata['products']
    // .map(
    //     (e) {

    //      ProductsInvoice.fromJson(e);

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
    _data['currency_name'] = currency_name;
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
    _data['userinstall'] = userinstall; //id user
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
    _data['isApprove'] = isApprove;

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
    _data['renew_pluse'] = renewPlus;
    _data['hoursdelaytabel'] = hoursdelaytabel;
    _data['hoursdelayinstall'] = hoursdelayinstall;
    _data['clientusername'] = clientusername;
    _data['address_invoice'] = address_invoice;
    _data['ready_install'] = ready_install;
    _data['date_readyinstall'] = date_readyinstall;
    _data['user_ready_install'] = user_ready_install;
    _data['user_not_ready_install'] = user_not_ready_install;
    _data['date_not_readyinstall'] = date_not_readyinstall;
    _data['nameuser_ready_install'] = nameuser_ready_install;
    _data['nameuser_notready_install'] = nameuser_notready_install;
    _data['count_delay_ready'] = count_delay_ready;
    _data['isApproveFinance'] = isApproveFinance;
    _data['iduser_FApprove'] = iduser_FApprove;
    _data['Date_FApprove'] = Date_FApprove;
    _data['renew2year'] = renew2year;
    _data['fk_regoin_invoice'] = fk_regoin_invoice;
    _data['name_regoin_invoice'] = name_regoin_invoice;
    _data['rate_participate'] = rate_participate;
    _data['renew_agent'] = renew_agent;

    _data['products'] = products!.map((e) => e.toJson()).toList();
    _data['invoice_source'] = invoice_source;
    _data['date_back_now'] = dateBackNow;
    return _data;
  }

  //endregion

  //region Methods
  List<ProductsInvoice> getproud(data) {
    List<ProductsInvoice> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(ProductsInvoice.fromJson(data[i]));
      }
    }
    return prodlist;
  }

  ParticipateModel getParticipateModel(data) {
    List<ParticipateModel> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(ParticipateModel.fromJson(data[i]));
      }
    }
    return prodlist[0];
  }

  AgentDistributorModel getAgentDistributorModel(data) {
    List<AgentDistributorModel> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(AgentDistributorModel.fromJson(data[i]));
      }
    }
    return prodlist[0];
  }

  InvoiceModel copyWith({
    String? idInvoice,
    String? dateCreate,
    String? typePay,
    String? currency_name,
    String? renewYear,
    String? typeInstallation,
    String? imageRecord,
    String? imagelogo,
    String? imagelogopath,
    String? fkIdClient,
    String? fkIdUser,
    String? amountPaid,
    String? notes,
    String? nameUser,
    String? nameClient,
    String? total,
    String? name_enterprise,
    String? fk_regoin,
    String? name_regoin,
    String? type_client,
    String? lastuserupdate,
    String? lastuserupdateName,
    String? nameuserinstall,
    String? dateinstall_done,
    String? isdoneinstall,
    String? userinstall,
    String? dateinstall_task,
    String? fkusertask,
    String? date_lastuserupdate,
    String? path,
    String? fk_country,
    String? reason_date,
    String? stateclient,
    String? value_back,
    String? desc_reason_back,
    String? reason_back,
    String? fkuser_back,
    String? date_change_back,
    String? nameuserback,
    String? nameuserreplay,
    String? nameusertask,
    String? daterepaly,
    String? fkuserdatareplay,
    String? iduser_approve,
    String? isApprove,
    String? nameuserApprove,
    String? date_approve,
    String? mobile,
    String? ismarketing,
    String? numbarnch,
    String? renewPlus,
    String? numusers,
    String? nummostda,
    String? numTax,
    String? hoursdelaytabel,
    String? hoursdelayinstall,
    String? clientusername,
    String? address_invoice,
    String? ready_install,
    String? date_readyinstall,
    String? user_ready_install,
    String? date_not_readyinstall,
    String? user_not_ready_install,
    String? nameuser_ready_install,
    String? nameuser_notready_install,
    String? count_delay_ready,
    String? isApproveFinance,
    String? iduser_FApprove,
    String? Date_FApprove,
    String? renew2year,
    String? participate_fk,
    String? rate_participate,
    String? type_seller,
    String? fk_agent,
    String? fk_regoin_invoice,
    String? name_regoin_invoice,
    String? date_delete,
    String? user_delete,
    String? city,
    String? name_city,
    String? namemaincity,
    String? id_maincity,
    List<ProductsInvoice>? products,
    ParticipateModel? participal,
    AgentDistributorModel? agent_distibutor,
    List<DateInstallationClient>? datesInstallationClient,
    List<FileAttach>? filesAttach,
    String? fileAttach,
    String? rejectFile,
    AttachFileStatus? attachFileStatus,
    AttachFileStatus? deleteAttachFileStatus,
    String? approveBackDone,
    bool deleteImage = false,
    bool deleteRejectImage = false,
    String? dateBackNow,
  }) {
    return InvoiceModel(
      idInvoice: idInvoice ?? this.idInvoice,
      dateCreate: dateCreate ?? this.dateCreate,
      typePay: typePay ?? this.typePay,
      currency_name: currency_name ?? this.currency_name,
      renewYear: renewYear ?? this.renewYear,
      typeInstallation: typeInstallation ?? this.typeInstallation,
      imageRecord: imageRecord ?? this.imageRecord,
      imagelogo: imagelogo ?? this.imagelogo,
      imagelogopath: imagelogopath ?? this.imagelogopath,
      fkIdClient: fkIdClient ?? this.fkIdClient,
      fkIdUser: fkIdUser ?? this.fkIdUser,
      amountPaid: amountPaid ?? this.amountPaid,
      notes: notes ?? this.notes,
      nameUser: nameUser ?? this.nameUser,
      nameClient: nameClient ?? this.nameClient,
      total: total ?? this.total,
      name_enterprise: name_enterprise ?? this.name_enterprise,
      fk_regoin: fk_regoin ?? this.fk_regoin,
      name_regoin: name_regoin ?? this.name_regoin,
      type_client: type_client ?? this.type_client,
      lastuserupdate: lastuserupdate ?? this.lastuserupdate,
      lastuserupdateName: lastuserupdateName ?? this.lastuserupdateName,
      nameuserinstall: nameuserinstall ?? this.nameuserinstall,
      dateinstall_done: dateinstall_done ?? this.dateinstall_done,
      isdoneinstall: isdoneinstall ?? this.isdoneinstall,
      userinstall: userinstall ?? this.userinstall,
      dateinstall_task: dateinstall_task ?? this.dateinstall_task,
      fkusertask: fkusertask ?? this.fkusertask,
      date_lastuserupdate: date_lastuserupdate ?? this.date_lastuserupdate,
      path: path ?? this.path,
      fk_country: fk_country ?? this.fk_country,
      reason_date: reason_date ?? this.reason_date,
      stateclient: stateclient ?? this.stateclient,
      value_back: value_back ?? this.value_back,
      desc_reason_back: desc_reason_back ?? this.desc_reason_back,
      reason_back: reason_back ?? this.reason_back,
      fkuser_back: fkuser_back ?? this.fkuser_back,
      date_change_back: date_change_back ?? this.date_change_back,
      nameuserback: nameuserback ?? this.nameuserback,
      nameuserreplay: nameuserreplay ?? this.nameuserreplay,
      nameusertask: nameusertask ?? this.nameusertask,
      daterepaly: daterepaly ?? this.daterepaly,
      fkuserdatareplay: fkuserdatareplay ?? this.fkuserdatareplay,
      iduser_approve: iduser_approve ?? this.iduser_approve,
      isApprove: isApprove ?? this.isApprove,
      nameuserApprove: nameuserApprove ?? this.nameuserApprove,
      date_approve: date_approve ?? this.date_approve,
      mobile: mobile ?? this.mobile,
      ismarketing: ismarketing ?? this.ismarketing,
      numbarnch: numbarnch ?? this.numbarnch,
      renewPlus: renewPlus ?? this.renewPlus,
      numusers: numusers ?? this.numusers,
      nummostda: nummostda ?? this.nummostda,
      numTax: numTax ?? this.numTax,
      hoursdelaytabel: hoursdelaytabel ?? this.hoursdelaytabel,
      hoursdelayinstall: hoursdelayinstall ?? this.hoursdelayinstall,
      clientusername: clientusername ?? this.clientusername,
      address_invoice: address_invoice ?? this.address_invoice,
      ready_install: ready_install ?? this.ready_install,
      date_readyinstall: date_readyinstall ?? this.date_readyinstall,
      user_ready_install: user_ready_install ?? this.user_ready_install,
      date_not_readyinstall:
          date_not_readyinstall ?? this.date_not_readyinstall,
      user_not_ready_install:
          user_not_ready_install ?? this.user_not_ready_install,
      nameuser_ready_install:
          nameuser_ready_install ?? this.nameuser_ready_install,
      nameuser_notready_install:
          nameuser_notready_install ?? this.nameuser_notready_install,
      count_delay_ready: count_delay_ready ?? this.count_delay_ready,
      isApproveFinance: isApproveFinance ?? this.isApproveFinance,
      iduser_FApprove: iduser_FApprove ?? this.iduser_FApprove,
      Date_FApprove: Date_FApprove ?? this.Date_FApprove,
      renew2year: renew2year ?? this.renew2year,
      participate_fk: participate_fk ?? this.participate_fk,
      rate_participate: rate_participate ?? this.rate_participate,
      type_seller: type_seller ?? this.type_seller,
      fk_agent: fk_agent ?? this.fk_agent,
      fk_regoin_invoice: fk_regoin_invoice ?? this.fk_regoin_invoice,
      name_regoin_invoice: name_regoin_invoice ?? this.name_regoin_invoice,
      date_delete: date_delete ?? this.date_delete,
      user_delete: user_delete ?? this.user_delete,
      city: city ?? this.city,
      name_city: name_city ?? this.name_city,
      namemaincity: namemaincity ?? this.namemaincity,
      id_maincity: id_maincity ?? this.id_maincity,
      products: products ?? this.products,
      participal: participal ?? this.participal,
      agent_distibutor: agent_distibutor ?? this.agent_distibutor,
      datesInstallationClient:
          datesInstallationClient ?? this.datesInstallationClient,
      fileAttach: deleteImage ? null : fileAttach ?? this.fileAttach,
      file_reject: deleteRejectImage ? null : file_reject ?? this.file_reject,
      attachFileStatus: attachFileStatus ?? this.attachFileStatus,
      deleteAttachFileStatus:
          deleteAttachFileStatus ?? this.deleteAttachFileStatus,
      filesAttach: filesAttach ?? this.filesAttach,
      renew_agent: renew_agent ?? this.renew_agent,
      approveBackDone: approveBackDone ?? this.approveBackDone,
      dateBackNow: dateBackNow ?? this.dateBackNow,
    );
  }
//endregion
}

class ProductsInvoice extends CacheRepository {
  //region Variables
  late String? idInvoiceProduct;
  late String? fkIdInvoice;
  late String? fkProduct;
  late String? amount;
  late String? price;
  late String? taxtotal;
  late String? rateAdmin;
  late String? rateUser;
  String? idProduct;
  String? nameProduct;
  late final String? priceProduct;
  String? type;
  late final String? fkCountry;
  String? fkConfig;
  bool? isdeleted = false;
  String? fkuser;
  String? fkclient;
  String? typeProdRenew;

  //endregion

  //region Constructor
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
    this.fkuser,
    this.typeProdRenew,
  });

  //endregion

  //region Json converters
  ProductsInvoice.fromJson(Map<String, dynamic> json) {
    idInvoiceProduct = json['id_invoice_product'];
    fkIdInvoice = json['fk_id_invoice'];
    fkProduct = json['fk_product'];
    amount = json['amount'];
    price = json['price'];
    taxtotal = json['taxtotal'];
    ;
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
    _data['fk_config'] = fkConfig == null ? "null" : fkConfig;
    return _data;
  }
//endregion
}

enum DownloadFileStatus {
  loading,
  downloaded,
  unDownloaded,
}

class FileAttach {
  final String? fileAttach;
  final String? id;
  final XFile? file;
  final DownloadFileStatus fileStatus;

  FileAttach(
      {this.fileAttach,
      this.id,
      this.file,
      this.fileStatus = DownloadFileStatus.unDownloaded});

  Map<String, dynamic> toMap() {
    return {
      'file_attach_invoice': this.fileAttach,
      'id': this.id,
    };
  }

  factory FileAttach.fromMap(Map<String, dynamic> map) {
    return FileAttach(
      fileAttach: map['file_attach_invoice'] as String,
      id: map['id'] as String,
    );
  }

  FileAttach copyWith({
    String? fileAttach,
    String? id,
    XFile? file,
    DownloadFileStatus? fileStatus,
  }) {
    return FileAttach(
      fileAttach: fileAttach ?? this.fileAttach,
      id: id ?? this.id,
      file: file ?? this.file,
      fileStatus: fileStatus ?? this.fileStatus,
    );
  }

  @override
  String toString() {
    return 'FileAttach{fileAttach: $fileAttach, id: $id, file: $file, fileStatus: $fileStatus}';
  }
}

class DateInstallationClient {
  final String? idClientsDate;
  final DateTime? dateClientVisit;
  final String? fkUser;
  final String? isDone;
  final String? fkClient;
  final String? fkInvoice;
  final InstallationTypeEnum? typeDate;
  final String? processReason;
  final String? userIdProcess;
  final String? fkAgent;
  final DateTime? dateEnd;
  final String? nameAgent;

  DateInstallationClient({
    this.idClientsDate,
    this.dateClientVisit,
    this.fkUser,
    this.isDone,
    this.fkClient,
    this.fkInvoice,
    this.typeDate,
    this.processReason,
    this.userIdProcess,
    this.fkAgent,
    this.dateEnd,
    this.nameAgent,
  });

  factory DateInstallationClient.fromJson(Map<String, dynamic> map) {
    return DateInstallationClient(
      idClientsDate: map['idclients_date']?.toString(),
      dateClientVisit: DateTime.tryParse(map['date_client_visit'] ?? ''),
      fkUser: map['fk_user']?.toString(),
      isDone: map['is_done']?.toString(),
      fkClient: map['fk_client'] ?? '',
      fkInvoice: map['fk_invoice'] ?? '',
      typeDate: map['type_date'] == InstallationTypeEnum.field.name
          ? InstallationTypeEnum.field
          : InstallationTypeEnum.online,
      processReason: map['processReason'] ?? '',
      userIdProcess: map['user_id_process'] ?? '',
      fkAgent: map['fk_agent']?.toString(),
      dateEnd: DateTime.tryParse(map['date_end'] ?? ''),
      nameAgent: map['name_agent'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idclients_date': idClientsDate,
      'date_client_visit': dateClientVisit?.toIso8601String(),
      'fk_user': fkUser,
      'is_done': isDone,
      'fk_client': fkClient,
      'fk_invoice': fkInvoice,
      'type_date': typeDate?.name,
      'processReason': processReason,
      'user_id_process': userIdProcess,
      'fk_agent': fkAgent,
      'date_end': dateEnd,
      'name_agent': nameAgent,
    };
  }

  DateInstallationClient copyWith({
    String? idClientsDate,
    DateTime? dateClientVisit,
    String? fkUser,
    String? isDone,
    String? fkClient,
    String? fkInvoice,
    InstallationTypeEnum? typeDate,
    String? processReason,
    String? userIdProcess,
    String? fkAgent,
    DateTime? dateEnd,
    String? nameAgent,
  }) {
    return DateInstallationClient(
      idClientsDate: idClientsDate ?? this.idClientsDate,
      dateClientVisit: dateClientVisit ?? this.dateClientVisit,
      fkUser: fkUser ?? this.fkUser,
      isDone: isDone ?? this.isDone,
      fkClient: fkClient ?? this.fkClient,
      fkInvoice: fkInvoice ?? this.fkInvoice,
      typeDate: typeDate ?? this.typeDate,
      processReason: processReason ?? this.processReason,
      userIdProcess: userIdProcess ?? this.userIdProcess,
      fkAgent: fkAgent ?? this.fkAgent,
      dateEnd: dateEnd ?? this.dateEnd,
      nameAgent: nameAgent ?? this.nameAgent,
    );
  }
}
