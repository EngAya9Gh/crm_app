import 'package:image_picker/image_picker.dart';

import '../core/common/enums/installation_type_enum.dart';
import '../core/common/helpers/api_helper.dart';
import '../core/common/helpers/helper_functions.dart';
import '../core/common/models/participate_model.dart';
import '../core/utils/end_points.dart';
import '../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';

// enum AttachFileStatus { empty, network, picked, uploading, deleting, failedUpload, failedDelete, success }

enum AttachFileStatus { init, loading, failed, success }

class InvoiceModel {
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

  String? rateProduct;
  String? rateSupport;
  String? rateSales;
  String? deviceState;
  String? cancel_approvment;
  bool? hasDevices;
  bool? isCanceledWithdraw;
  bool?  isDeleted;

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
    this.rateProduct,
    this.rateSupport,
    this.rateSales,
    this.deviceState,
    this.hasDevices,
    this.cancel_approvment,
    this.isCanceledWithdraw,
    this.tag,
    this.isDeleted,
  });

  bool searchString(String query) {
    String searchIn = "";
    if (name_enterprise != null) searchIn += name_enterprise!;
    if (nameClient != null) searchIn += nameClient!;
    if (mobile != null) searchIn += mobile!;
    if (name_regoin_invoice != null) searchIn += name_regoin_invoice!;

    return searchIn.toLowerCase().contains(query.toLowerCase());
  }

  factory InvoiceModel.fromJson(Map<String, dynamic> jsondata) {
    return InvoiceModel(
        tag: ApiHelper.handleString(jsondata['tag']) == "true" ? true : false,
        idInvoice: ApiHelper.handleString(jsondata['id_invoice']),
        user_delete: ApiHelper.handleString(jsondata['user_delete']),
        date_delete: ApiHelper.handleString(jsondata['date_delete']),
        dateCreate: ApiHelper.handleString(jsondata['date_create']),
        typePay: ApiHelper.handleString(jsondata['type_pay']),
        renewYear: ApiHelper.handleString(jsondata['renew_year']),
        typeInstallation: ApiHelper.handleString(jsondata['type_installation']),
        currency_name: ApiHelper.handleString(jsondata['currency_name']),
        imageRecord: ApiHelper.handleString(
          jsondata['image_record'].toString().trim().isEmpty ||
                  jsondata['image_record'] == null
              ? jsondata['image_record']
              : EndPoints.baseUrls.laravelFilesUrl + jsondata['image_record'],
        ),
        imagelogo: ApiHelper.handleString(
          jsondata['imagelogo'].toString().trim().isEmpty ||
                  jsondata['imagelogo'] == null
              ? jsondata['imagelogo']
              : EndPoints.baseUrls.laravelFilesUrl + jsondata['imagelogo'],
        ),
        fkIdClient: ApiHelper.handleString(jsondata['fk_idClient']),
        fkIdUser: ApiHelper.handleString(jsondata['fk_idUser']),
        amountPaid: ApiHelper.handleString(jsondata['amount_paid']),
        notes: ApiHelper.handleString(jsondata['notes']),
        nameUser: ApiHelper.handleString(jsondata['nameUser']),
        nameClient: ApiHelper.handleString(jsondata['name_client']),
        total: ApiHelper.handleString(jsondata['total']),
        name_enterprise: ApiHelper.handleString(jsondata['name_enterprise']),
        fk_regoin: ApiHelper.handleString(jsondata['fk_regoin']),
        name_regoin: ApiHelper.handleString(jsondata['name_regoin']),
        type_client: ApiHelper.handleString(jsondata['type_client']),
        lastuserupdate: ApiHelper.handleString(jsondata['lastuserupdate']),
        lastuserupdateName:
            ApiHelper.handleString(jsondata['lastuserupdateName']),
        nameuserinstall: ApiHelper.handleString(jsondata['nameuserinstall']),
        dateinstall_done: ApiHelper.handleString(jsondata['dateinstall_done']),
        isdoneinstall: ApiHelper.handleString(jsondata['isdoneinstall']),
        userinstall: ApiHelper.handleString(jsondata['userinstall']),
        dateinstall_task: ApiHelper.handleString(jsondata['dateinstall_task']),
        fkusertask: ApiHelper.handleString(jsondata['fkusertask']),
        date_lastuserupdate:
            ApiHelper.handleString(jsondata['date_lastuserupdate']),
        path: ApiHelper.handleString(jsondata['path']),
        fk_country: ApiHelper.handleString(jsondata['fk_country']),
        reason_date: ApiHelper.handleString(jsondata['reason_date']),
        stateclient: ApiHelper.handleString(jsondata['stateclient']),
        value_back: ApiHelper.handleString(jsondata['value_back']),
        desc_reason_back: ApiHelper.handleString(jsondata['desc_reason_back']),
        reason_back: ApiHelper.handleString(jsondata['reason_back']),
        fkuser_back: ApiHelper.handleString(jsondata['fkuser_back']),
        date_change_back: ApiHelper.handleString(jsondata['date_change_back']),
        nameuserback: ApiHelper.handleString(jsondata['nameuserback']),
        nameuserreplay: ApiHelper.handleString(jsondata['nameuserreplay']),
        nameusertask: ApiHelper.handleString(jsondata['nameusertask']),
        daterepaly: ApiHelper.handleString(jsondata['daterepaly']),
        fkuserdatareplay: ApiHelper.handleString(jsondata['fkuserdatareplay']),
        iduser_approve: ApiHelper.handleString(jsondata['iduser_approve']),
        isApprove: ApiHelper.handleString(jsondata['isApprove']),
        nameuserApprove: ApiHelper.handleString(jsondata['nameuserApprove']),
        date_approve: ApiHelper.handleString(jsondata['date_approve']),
        mobile: ApiHelper.handleString(jsondata['mobile']),
        ismarketing: ApiHelper.handleString(jsondata['ismarketing']),
        city: ApiHelper.handleString(jsondata['city']),
        name_city: ApiHelper.handleString(jsondata['name_city']),
        namemaincity: ApiHelper.handleString(jsondata['namemaincity']),
        id_maincity: ApiHelper.handleString(jsondata['id_maincity']),
        numbarnch: ApiHelper.handleString(jsondata['numbarnch']),
        renewPlus: ApiHelper.handleString(jsondata['renew_pluse']),
        numusers: ApiHelper.handleString(jsondata['numusers']),
        nummostda: ApiHelper.handleString(jsondata['nummostda']),
        numTax: ApiHelper.handleString(jsondata['numTax']),
        hoursdelaytabel: ApiHelper.handleString(jsondata['hoursdelaytabel']),
        hoursdelayinstall:
            ApiHelper.handleString(jsondata['hoursdelayinstall']),
        clientusername: ApiHelper.handleString(jsondata['clientusername']),
        address_invoice: ApiHelper.handleString(jsondata['address_invoice']),
        ready_install: ApiHelper.handleString(jsondata['ready_install']),
        date_readyinstall:
            ApiHelper.handleString(jsondata['date_readyinstall']),
        user_ready_install:
            ApiHelper.handleString(jsondata['user_ready_install']),
        date_not_readyinstall:
            ApiHelper.handleString(jsondata['date_not_readyinstall']),
        user_not_ready_install:
            ApiHelper.handleString(jsondata['user_not_ready_install']),
        nameuser_ready_install:
            ApiHelper.handleString(jsondata['nameuser_ready_install']),
        nameuser_notready_install:
            ApiHelper.handleString(jsondata['nameuser_notready_install']),
        count_delay_ready:
            ApiHelper.handleString(jsondata['count_delay_ready']),
        isApproveFinance: ApiHelper.handleString(jsondata['isApproveFinance']),
        iduser_FApprove: ApiHelper.handleString(jsondata['iduser_FApprove']),
        Date_FApprove: ApiHelper.handleString(jsondata['Date_FApprove']),
        renew2year: ApiHelper.handleString(jsondata['renew2year']),
        rate_participate: ApiHelper.handleString(jsondata['rate_participate']),
        participate_fk: ApiHelper.handleString(jsondata['participate_fk']),
        fk_agent: ApiHelper.handleString(jsondata['fk_agent']),
        type_seller: ApiHelper.handleString(jsondata['type_seller']),
        fk_regoin_invoice:
            ApiHelper.handleString(jsondata['fk_regoin_invoice']),
        name_regoin_invoice:
            ApiHelper.handleString(jsondata['name_regoin_invoice']),
        renew_agent: ApiHelper.handleString(jsondata['renew_agent']),
        participal: _getParticipateModel(jsondata['participal_info']),
        agent_distibutor:
            _getAgentDistributorModel(jsondata['agent_distibutor_info']),
        products: _getProduct(jsondata['products']),
        fileAttach: ApiHelper.handleString(jsondata['file_attach']),
        file_reject: ApiHelper.handleString(jsondata['file_reject']),
        approveBackDone: ApiHelper.handleString(jsondata['approve_back_done']),
        TypeReadyClient: ApiHelper.handleString(jsondata['TypeReadyClient']),
        notes_ready: ApiHelper.handleString(jsondata['notes_ready']),
        reason_suspend: ApiHelper.handleString(jsondata['reason_suspend']),
        reason_notReady: ApiHelper.handleString(jsondata['reason_notReady']),
        attachFileStatus: AttachFileStatus.init,
        deleteAttachFileStatus: AttachFileStatus.init,
        invoice_source: ApiHelper.handleString(jsondata['invoice_source']),
        dateBackNow: ApiHelper.handleString(jsondata['date_back_now']),
        datesInstallationClient: ApiHelper.listFromJson<DateInstallationClient>(
          json: jsondata['dates_install_client'],
          fromJson: (e) => DateInstallationClient.fromJson(e),
        ),
        filesAttach: List.from(jsondata['files_attach'] ?? [])
            .map((e) => FileAttach.fromMap(e))
            .toList(),
        rateProduct: jsondata['rate_product'],
        rateSupport: jsondata['rate_support'],
        rateSales: jsondata['rate_sales'],
        deviceState: jsondata['device_state'],
        hasDevices: jsondata['has_devices'],
        cancel_approvment:
            ApiHelper.handleString(jsondata['cancel_approvement']),
        isCanceledWithdraw:
            ApiHelper.handleString(jsondata['is_canceled_withdraw']) == '1'
                ? true
                : false,
        isDeleted: (ApiHelper.handleString(jsondata['isdelete'])) == '1'? true
            : false);
  }

  //region Methods
  static List<ProductsInvoice> _getProduct(data) {
    List<ProductsInvoice> prodlist = [];
    if (data != null) {
      for (int i = 0; i < data.length; i++) {
        prodlist.add(ProductsInvoice.fromJson(data[i]));
      }
    }
    return prodlist;
  }

  static ParticipateModel? _getParticipateModel(data) {
    if (data == null) return null;
    return ParticipateModel.fromJson(data[0]);
  }

  static AgentDistributorModel? _getAgentDistributorModel(data) {
    if (data == null) return null;
    return AgentDistributorModel.fromJson(data[0]);
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
    String? rateProduct,
    String? rateSupport,
    String? rateSales,
    String? deviceState,
    bool? hasDevices,
    bool? isCanceledWithdraw,
    bool? isDeleted,
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
      rateProduct: rateProduct ?? this.rateProduct,
      rateSupport: rateSupport ?? this.rateSupport,
      rateSales: rateSales ?? this.rateSales,
      deviceState: deviceState ?? this.deviceState,
      hasDevices: hasDevices ?? this.hasDevices,
      isCanceledWithdraw: isCanceledWithdraw ?? this.isCanceledWithdraw,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
//endregion
}

class ProductsInvoice {
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
  String? localId;

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
    this.localId,
  });

  ProductsInvoice copyWith({
    String? idInvoiceProduct,
    String? fkIdInvoice,
    String? fkProduct,
    String? amount,
    String? price,
    String? taxtotal,
    String? rateAdmin,
    String? rateUser,
    String? idProduct,
    String? nameProduct,
    String? priceProduct,
    String? type,
    String? fkCountry,
    String? fkConfig,
    bool? isdeleted,
    String? fkuser,
    String? fkclient,
    String? typeProdRenew,
    String? localId,
  }) {
    return ProductsInvoice(
      idInvoiceProduct: idInvoiceProduct ?? this.idInvoiceProduct,
      fkIdInvoice: fkIdInvoice ?? this.fkIdInvoice,
      fkProduct: fkProduct ?? this.fkProduct,
      amount: amount ?? this.amount,
      price: price ?? this.price,
      taxtotal: taxtotal ?? this.taxtotal,
      rateAdmin: rateAdmin ?? this.rateAdmin,
      rateUser: rateUser ?? this.rateUser,
      idProduct: idProduct ?? this.idProduct,
      nameProduct: nameProduct ?? this.nameProduct,
      priceProduct: priceProduct ?? this.priceProduct,
      type: type ?? this.type,
      fkCountry: fkCountry ?? this.fkCountry,
      fkConfig: fkConfig ?? this.fkConfig,
      isdeleted: isdeleted ?? this.isdeleted,
      fkuser: fkuser ?? this.fkuser,
      fkclient: fkclient ?? this.fkclient,
      typeProdRenew: typeProdRenew ?? this.typeProdRenew,
      localId: localId ?? this.localId,
    );
  }

  //region Json converters

  factory ProductsInvoice.fromJson(Map<String, dynamic> json) {
    return ProductsInvoice(
      idInvoiceProduct: json['id_invoice_product'].toString(),
      fkIdInvoice: json['fk_id_invoice'].toString(),
      fkProduct: json['fk_product'].toString(),
      amount: json['amount'].toString(),
      price: json['price'].toString(),
      taxtotal: json['taxtotal'].toString(),
      rateAdmin: json['rate_admin'].toString(),
      rateUser: json['rateUser'].toString(),
      idProduct: json['id_product'].toString(),
      nameProduct: json['nameProduct'].toString(),
      priceProduct: json['priceProduct'].toString(),
      type: HelperFunctions.JsonStringNullHandler(json['type']),
      fkCountry: json['fk_country'].toString(),
      fkConfig: json['fk_config'].toString(),
    );
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

// bool
extension DownloadFileStatusExtension on DownloadFileStatus {
  bool get isDownloaded => this == DownloadFileStatus.downloaded;

  bool get isLoading => this == DownloadFileStatus.loading;

  bool get isUnDownloaded => this == DownloadFileStatus.unDownloaded;
}

class FileAttach {
  final String? fileAttach;
  final String? id;
  final XFile? file;
  final DownloadFileStatus fileStatus;
  final dynamic type;
  FileAttach({
    this.fileAttach,
    this.id,
    this.file,
    this.type,
    this.fileStatus = DownloadFileStatus.unDownloaded,
  });

  factory FileAttach.fromMap(Map<String, dynamic> map) {
    return FileAttach(
      fileAttach:
          HelperFunctions.JsonStringNullHandler(map['file_attach_invoice']),
      id: HelperFunctions.JsonStringNullHandler(map['id']),
      type: HelperFunctions.JsonStringNullHandler(map['type']),
    );
  }
  Map<String,dynamic> convertAddedFileToAttachedPostFile(){
    return  {
      'file': this.file,
      'file_type': this.type,
    };
  }

  FileAttach copyWith({
    String? fileAttach,
    String? id,
    dynamic type,
    XFile? file,
    DownloadFileStatus? fileStatus,
  }) {
    return FileAttach(
      fileAttach: fileAttach ?? this.fileAttach,
      id: id ?? this.id,
      type: type ?? this.type,
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
  final int? force;

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
    this.force,
  });

  factory DateInstallationClient.fromJson(Map<String, dynamic> map) {
    return DateInstallationClient(
      idClientsDate: map['idclients_date']?.toString(),
      dateClientVisit: DateTime.tryParse(map['date_client_visit'] ?? ''),
      fkUser: map['fk_user']?.toString(),
      isDone: map['is_done']?.toString(),
      fkClient: HelperFunctions.JsonStringNullHandler(map['fk_client']),
      fkInvoice: HelperFunctions.JsonStringNullHandler(map['fk_invoice']),
      typeDate: map['type_date'] == InstallationTypeEnum.field.value
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
      'type_date': typeDate?.value,
      'processReason': processReason,
      'user_id_process': userIdProcess,
      'fk_agent': fkAgent,
      'date_end': dateEnd,
      'name_agent': nameAgent,
      if (force != null) 'force': force,
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
    int? force,
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
      force: force,
    );
  }
}
