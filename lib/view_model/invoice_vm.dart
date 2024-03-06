import 'dart:io';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart'
    as pageState;
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';

import '../core/api/api_services.dart';
import '../core/common/helpers/checkSoragePermission.dart';
import '../core/di/di_container.dart';
import '../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../model/agent_distributor_model.dart';
import '../model/calendar/event_model.dart';
import '../model/participatModel.dart';

const CACHE_InvoiceClient_KEY = "CACHE_InvoiceClient_KEY";
const CACHE_InvoiceClient_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_Invoice_Deleted_KEY = "CACHE_Invoice_Deleted_KEY";
const CACHE_Invoice_Deleted_INTERVAL = 60 * 1000; // 30s in millis

enum SellerType { distributor, agent, collaborator, employee }

enum SellerStatus { init, loading, loaded, failed }

class invoice_vm extends ChangeNotifier {
  String total = '0';

  InvoiceModel? currentInvoice;

  setCurrentInvoice(InvoiceModel invoice, {bool needRefresh = false}) {
    currentInvoice = invoice;
    if (needRefresh) {
      notifyListeners();
    }
  }

  void set_total(val) {
    total = val;
    notifyListeners();
  }

  bool isloading = false;
  bool isloading_marketing = false;
  UserModel? usercurrent;
  String? typeClientValue;

  invoice_vm() {
    //get_invoicesbyRegoin("");
  }

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  bool isLoadingInvoicesClientParticipateLocal = false;
  bool isLoadingInvoicesClientLocal = false;
  List<InvoiceModel> listinvoiceClient = [];
  List<InvoiceModel> listinvoiceClientSupport = [];
  List<InvoiceModel> listforme = [];
  List<InvoiceModel> listdeletedinvoice = [];
  List<ProductsInvoice> listproductinvoic = [];
  List<DeletedinvoiceModel> listdeleted = [];
  List<InvoiceModel> listinvoicebyregoin = [];
  List<InvoiceModel> listinvoices = [];
  List<InvoiceModel> listinvoicesMarketing = [];
  List<InvoiceModel> listinvoicesApproved = [];
  List<InvoiceModel> listInvoicesAccept = []; //مشتركين
  List<InvoiceModel> listInvoicesAccept_admin = []; //مشتركين
  Future<void> searchProducts(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
      }
      listInvoicesAccept = _listInvoicesAccept;
    }
    //else listInvoicesAccept=userall;
    notifyListeners();
  }

  Future<void> searchwait(
      String productName, PrivilegeCubit privilegeCubit) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else {
      if (privilegeCubit.state.userPrivilegesState.data
              .firstWhereOrNull((element) => element.fkPrivilege == '2')
              ?.isCheck! ??
          false)
        getinvoice_Local('مشترك', 'not approved', 'country');
      else {
        if (privilegeCubit.state.userPrivilegesState.data
                .firstWhereOrNull((element) => element.fkPrivilege == '7')
                ?.isCheck! ??
            false) getinvoice_Local('مشترك', 'not approved', 'regoin');
      }
    }
    //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  List<InvoiceModel> temp_listInvoicesAccept = [];

  Future<void> searchwaitsupport(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // temp_listInvoicesAccept=List.from(listInvoicesAccept);
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else
      listInvoicesAccept = List.from(temp_listInvoicesAccept);
    //getinvoice_Local("مشترك", 'approved only', null);
    notifyListeners();
  }

  Future<void> search_accept_invoice_admin(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // temp_listInvoicesAccept=List.from(listInvoicesAccept);
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept_admin.isNotEmpty) {
        listInvoicesAccept_admin.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listInvoicesAccept_admin = _listInvoicesAccept;
      }
    } else
      listInvoicesAccept_admin = List.from(listinvoicebyregoin);
    //getinvoice_Local("مشترك", 'approved only', null);
    notifyListeners();
  }

  Future<void> searchwaitout(String productName) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else
      getinvoice_Local("منسحب", 'out', null);
    notifyListeners();
  }

  Future<void> searchwaitwithprev(
      String productName, PrivilegeCubit privilegeCubit) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listInvoicesAccept.isNotEmpty) {
        listInvoicesAccept.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listInvoicesAccept = _listInvoicesAccept;
      }
    } else
      getinvoice_Localwithprev(privilegeCubit);
    notifyListeners();
  }

  Future<void> searchmarketing(
      String productName, PrivilegeCubit privilegeCubit) async {
    List<InvoiceModel> _listInvoicesAccept = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    if (productName.isNotEmpty) {
      if (listinvoicesMarketing.isNotEmpty) {
        listinvoicesMarketing.forEach((element) {
          if (element.name_enterprise!.contains(searchKey, 0) ||
              element.mobile.toString().contains(searchKey, 0) ||
              element.nameClient.toString().contains(searchKey, 0))
            _listInvoicesAccept.add(element);
        });
        listinvoicesMarketing = _listInvoicesAccept;
      }
    } else
      getinvoice_marketing(
          privilegeCubit); //getinvoice_Local("مشترك",'approved client',null);
    notifyListeners();
  }

  void getinvoice_marketing(PrivilegeCubit privilegeCubit) async {
    listinvoicesMarketing = [];
    isloading_marketing = true;
    notifyListeners();
    await getinvoiceswithprev_marketing(privilegeCubit);
    list_temp = List.from(listInvoicesAccept);
    listinvoicesMarketing = List.from(list_temp);
    isloading_marketing = false;
    notifyListeners();
  }

  void getfilterinvoice(String? regoin) {
    listInvoicesAccept = [];
    if (regoin != null) {
      if (regoin != '0') {
        listinvoices.forEach((element) {
          if (element.fk_regoin == regoin) listInvoicesAccept.add(element);
        });
      } else {
        //الكل لفلتر المنطقة
        listinvoices.forEach((element) {
          if (element.fk_country == usercurrent!.fkCountry)
            listInvoicesAccept.add(element);
        });
      }
    }
    notifyListeners();
  }

  Future<void> getfilterinvoicesclient(
      String? filter, String? regoin, DateTime from, DateTime to) async {
    List<InvoiceModel> _listInvoicesAccept = [];

    if (regoin == null) {
      if (listforme.isNotEmpty) {
        if (filter == 'الكل') {
          //_listInvoicesAccept = List.from(listforme);
          listforme.forEach((element) {
            if (DateTime.parse(element.date_approve.toString()).isAfter(from) &&
                DateTime.parse(element.date_approve.toString()).isBefore(to)) {
              _listInvoicesAccept.add(element);
            }
          });
        }
        if (filter == 'بالإنتظار')
          listforme.forEach((element) {
            if (element.isdoneinstall == null &&
                DateTime.parse(element.date_approve.toString()).isAfter(from) &&
                DateTime.parse(element.date_approve.toString()).isBefore(to)) {
              _listInvoicesAccept.add(element);
            }
          });
        if (filter == 'تم التركيب')
          listforme.forEach((element) {
            if (element.isdoneinstall == '1' &&
                DateTime.parse(element.date_approve.toString()).isAfter(from) &&
                DateTime.parse(element.date_approve.toString()).isBefore(to)) {
              _listInvoicesAccept.add(element);
            }
          });
        if (filter == 'معلق')
          listforme.forEach((element) {
            if (element.isdoneinstall != '1' &&
                element.ready_install == '0' &&
                DateTime.parse(element.date_approve.toString()).isAfter(from) &&
                DateTime.parse(element.date_approve.toString()).isBefore(to)) {
              _listInvoicesAccept.add(element);
            }
          });
      }
    } else {
      if (listforme.isNotEmpty) {
        if (filter == 'الكل' || filter == null) {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.fk_regoin == regoin &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listforme.forEach((element) {
              if (DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
            //_listInvoicesAccept = List.from(listforme);
          }
        }
        if (filter == 'بالإنتظار') {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.isdoneinstall.toString() == null &&
                  element.fk_regoin == regoin &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listforme.forEach((element) {
              if (element.isdoneinstall.toString() == null &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          }
        }
        if (filter == 'تم التركيب') {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.isdoneinstall == '1' &&
                  element.fk_regoin == regoin &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listforme.forEach((element) {
              if (element.isdoneinstall == '1' &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          }
        }
        if (filter == 'معلق') {
          if (regoin != '0') {
            listforme.forEach((element) {
              if (element.isdoneinstall != '1' &&
                  element.ready_install == '0' &&
                  element.fk_regoin == regoin &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listforme.forEach((element) {
              if (element.isdoneinstall != '1' &&
                  element.ready_install == '0' &&
                  DateTime.parse(element.date_approve.toString())
                      .isAfter(from) &&
                  DateTime.parse(element.date_approve.toString())
                      .isBefore(to)) {
                _listInvoicesAccept.add(element);
              }
            });
          }
        }
      }
    }
    if (regoin == null && filter == null) {
      listforme.forEach((element) {
        if (DateTime.parse(element.date_approve.toString()).isAfter(from) &&
            DateTime.parse(element.date_approve.toString()).isBefore(to)) {
          _listInvoicesAccept.add(element);
        }
      });
    }
    listInvoicesAccept = List.from(_listInvoicesAccept);
    notifyListeners();
  }

  Future<void> getinvoice_waiting() async {
    isloading = true;
    notifyListeners();
    String? state = null;
    listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
        'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}&state=${state.toString()}',
        {'allmaincity': 'allmaincity'});
    isloading = false;
    notifyListeners();
  }

  void setisload({bool isLoading = false}) {
    isloadingdone = isLoading;
    notifyListeners();
  }

  CancelableOperation<List<InvoiceModel>>? _cancelableFuture;

  Future<void> filterInvoices({
    List<MainCityModel>? listSelectedRegions,
    List<CityModel> selectedCities = const [],
  }) async {
    isloading = true;
    notifyListeners();
    await _cancelableFuture?.cancel();
    _cancelableFuture = await InvoiceFilter.execute(
      listSelectedRegions: listSelectedRegions,
      selectedCities: selectedCities,
      state: typeClientValue,
      url:
          'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}',
    );
    listInvoicesAccept = await _cancelableFuture?.value ?? [];
    temp_listInvoicesAccept = List.from(listInvoicesAccept);
    isloading = false;
    notifyListeners();
  }

  Future<void> getclienttype_filter(
      String? filter, String? regoin, String tyype) async {
    // listInvoicesAccept=[];
    if (tyype == 'only') await getinvoice_Local("مشترك", 'approved only', null);
    if (tyype == 'client')
      await getinvoice_Local("مشترك", 'approved client', null);
    if (tyype == 'not') await getinvoice_Local("مشترك", 'not approved', null);
    if (tyype == 'out') await getinvoice_Local("مستبعد", 'out', null);

    List<InvoiceModel> _listInvoicesAccept = [];
    if (regoin == null) {
      if (listInvoicesAccept.isNotEmpty) {
        if (filter == 'الكل') {
          _listInvoicesAccept = listInvoicesAccept;
        }
        if (filter == 'بالإنتظار')
          listInvoicesAccept.forEach((element) {
            if (element.isdoneinstall == null) {
              _listInvoicesAccept.add(element);
            }
          });
        if (filter == 'تم التركيب')
          listInvoicesAccept.forEach((element) {
            if (element.isdoneinstall == '1') {
              _listInvoicesAccept.add(element);
            }
          });
      }
    } else {
      if (listInvoicesAccept.isNotEmpty) {
        if (filter == 'الكل') {
          if (regoin != '0') {
            listInvoicesAccept.forEach((element) {
              if (element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            _listInvoicesAccept = listInvoicesAccept;
          }
        }

        if (filter == 'بالإنتظار') {
          if (regoin != '0') {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall.toString() == null &&
                  element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall.toString() == null) {
                _listInvoicesAccept.add(element);
              }
            });
          }
        }
        if (filter == 'تم التركيب') {
          if (regoin != '0') {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall == '1' &&
                  element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall == '1') {
                _listInvoicesAccept.add(element);
              }
            });
          }
        }
      }
    }
    listInvoicesAccept = _listInvoicesAccept;
    notifyListeners();
  }

  List<InvoiceModel> list_temp = [];

  Future<void> onFilterInvoice(
      String? invoiceStatus, String? region, String? query) async {
    final list = List<InvoiceModel>.from(list_temp);

    listinvoicesMarketing = list.where((element) {
      if ((region == null || region == '0') &&
          (invoiceStatus == null || invoiceStatus == 'الكل')) {
        return true && filterQuery(element, query);
      } else if ((region != null && region != '0') &&
          (invoiceStatus == null || invoiceStatus == 'الكل')) {
        return element.fk_regoin == region && filterQuery(element, query);
      } else if ((region == null || region == '0') &&
          (invoiceStatus != null && invoiceStatus != 'الكل')) {
        if (invoiceStatus == "بالإنتظار") {
          return isWaitingInvoice(element) && filterQuery(element, query);
        } else if (invoiceStatus == "تم التركيب") {
          return isInstallingInvoice(element) && filterQuery(element, query);
        } else {
          return isPendingInvoice(element) && filterQuery(element, query);
        }
      } else {
        final typeCondition;

        if (invoiceStatus == "بالإنتظار") {
          typeCondition = isWaitingInvoice(element);
        } else if (invoiceStatus == "تم التركيب") {
          typeCondition = isInstallingInvoice(element);
        } else {
          typeCondition = isPendingInvoice(element);
        }

        return typeCondition &&
            region == element.fk_regoin &&
            filterQuery(element, query);
      }
    }).toList();

    notifyListeners();

    // List<InvoiceModel> _listInvoicesAccept = [];
    // if (regoin == null) {
    //
    //   if (listinvoicesMarketing.isNotEmpty) {
    //     if (filter == 'الكل') {
    //       _listInvoicesAccept =List.from( listinvoicesMarketing);
    //
    //     }
    //     if (filter == 'بالإنتظار')
    //       listinvoicesMarketing.forEach((element) {
    //
    //         if (element.isdoneinstall == null) {
    //           _listInvoicesAccept.add(element);
    //
    //         }
    //       });
    //     if (filter == 'تم التركيب')
    //       listinvoicesMarketing.forEach((element) {
    //         if (element.isdoneinstall == '1') {
    //           _listInvoicesAccept.add(element);
    //
    //         }
    //       });
    //     if (filter == 'معلق')
    //       listinvoicesMarketing.forEach((element) {
    //         if (element.isdoneinstall != '1' && element.ready_install == '0') {
    //           _listInvoicesAccept.add(element);
    //
    //         }
    //       });
    //   }
    // } else {
    //   if (listinvoicesMarketing.isNotEmpty) {
    //     if (filter == 'الكل')
    //       listinvoicesMarketing.forEach((element) {
    //         if (element.fk_regoin_invoice == regoin) {
    //           _listInvoicesAccept.add(element);
    //
    //         }
    //       });
    //
    //     if (filter == 'بالإنتظار')
    //       listinvoicesMarketing.forEach((element) {
    //         if (element.isdoneinstall.toString() == null && element.fk_regoin_invoice == regoin) {
    //           _listInvoicesAccept.add(element);
    //
    //         }
    //       });
    //     if (filter == 'تم التركيب')
    //       listinvoicesMarketing.forEach((element) {
    //         if (element.isdoneinstall == '1' && element.fk_regoin_invoice == regoin) {
    //           _listInvoicesAccept.add(element);
    //
    //         }
    //       });
    //     if (filter == 'معلق') {
    //       if (regoin != '0') {
    //         listinvoicesMarketing.forEach((element) {
    //           if (element.isdoneinstall != '1' && element.ready_install == '0'
    //               && element.fk_regoin_invoice == regoin) {
    //             _listInvoicesAccept.add(element);
    //
    //           }
    //         });
    //       } else {
    //         listinvoicesMarketing.forEach((element) {
    //           if (element.isdoneinstall != '1' && element.ready_install == '0') {
    //             _listInvoicesAccept.add(element);
    //
    //           }
    //         });
    //       }
    //     }
    //   }
    // }
    // listinvoicesMarketing =List.from(_listInvoicesAccept) ;
  }

  bool isWaitingInvoice(InvoiceModel invoiceModel) =>
      invoiceModel.isdoneinstall == null;

  bool isPendingInvoice(InvoiceModel invoiceModel) =>
      invoiceModel.isdoneinstall != '1' && invoiceModel.ready_install == '0';

  bool isInstallingInvoice(InvoiceModel invoiceModel) =>
      invoiceModel.isdoneinstall == '1';

  bool filterQuery(InvoiceModel element, String? query) {
    if (query?.isEmpty ?? true) {
      return true;
    }

    return (element.address_invoice!
            .toLowerCase()
            .contains(query!.toLowerCase()))
        // ||
        // (element.mobile!.toLowerCase().contains(query.toLowerCase())) ||
        // (element.nameClient!.toLowerCase().contains(query.toLowerCase()) )
        ;
  }

  Future<void> getfilterview(String? regoin, String tyype) async {
    listInvoicesAccept_admin = [];
    notifyListeners();
    if (tyype == 'only') await getinvoice_Local("مشترك", 'approved only', null);
    if (tyype == 'client')
      await getinvoice_Local("مشترك", 'approved client', null);
    if (tyype == 'not')
      await getinvoice_Local(
          "مشترك", 'not approved', null); //طلبات الموافقة الفلتر
    List<InvoiceModel> _listInvoicesAccept = [];
    if (regoin != '0')
      listInvoicesAccept_admin.forEach((element) {
        if (element.fk_regoin_invoice == regoin) {
          _listInvoicesAccept.add(element);
        }
      });
    else {
      listInvoicesAccept_admin.forEach((element) {
        if (element.fk_country == usercurrent!.fkCountry) {
          _listInvoicesAccept.add(element);
        }
      });
    }
    listInvoicesAccept_admin = _listInvoicesAccept;
    notifyListeners();
  }

  Future<void> getinvoice_Localwithprev(PrivilegeCubit privilegeCubit) async {
    // Stopwatch stopwatch = Stopwatch();
    // stopwatch.start();
    listInvoicesAccept = [];
    isloading = true;
    notifyListeners();
    await getinvoiceswithprev(privilegeCubit);
    listInvoicesAccept = listInvoicesAccept
        .where((element) =>
            element.stateclient == 'مشترك' && element.isApprove == "1")
        .toList();
    listforme = List.from(listInvoicesAccept);
    isloading = false;
    // stopwatch.stop();
    // stopwatch.elapsed.inSeconds;
    notifyListeners();
  }

  Future<void> getinvoice_Debt(PrivilegeCubit privilegeCubit) async {
    List<InvoiceModel> list = [];
    listInvoicesAccept = [];
    isloading = true;
    notifyListeners();
    bool res = privilegeCubit.checkPrivilege('94');
    if (res) {
      listinvoices = await Invoice_Service()
          .getinvoice_debt(usercurrent!.fkCountry.toString(), "all", '');
    } else {
      res = privilegeCubit.checkPrivilege('93');
      if (res) {
        listinvoices = await Invoice_Service().getinvoice_debt(
            usercurrent!.fkCountry.toString(),
            "regoin",
            usercurrent!.fkRegoin!.toString());
      } else {
        res = privilegeCubit.checkPrivilege('92');
        if (res) {
          listinvoices = await Invoice_Service().getinvoice_debt(
              usercurrent!.fkCountry.toString(),
              'users',
              usercurrent!.idUser.toString());
        }
      }
    }
    listInvoicesAccept = List.from(listinvoices);
    temp_listInvoicesAccept = List.from(listinvoices);
    // listInvoicesAccept.forEach((element) {
    //   if (element.stateclient == 'مشترك' &&
    //       element.isApprove == "1" &&
    //       ((num.tryParse(element.total?.toString() ?? '0') ?? 0) -
    //               (num.tryParse(element.amountPaid?.toString() ?? '0') ?? 0)) >
    //           0) list.add(element);
    // });
    // listInvoicesAccept = list;
    listforme = List.from(listInvoicesAccept);
    isloading = false;
    // if(listInvoicesAccept.isEmpty)listInvoicesAccept=listinvoices;
    notifyListeners();
  }

  // Future<void> getClientWaiting()async{
  //   // element.stateclient == searchfilter
  //   //     && element.isApprove == "1"
  //   listInvoicesAccept = await Invoice_Service()
  //       .getinvoicemaincity(
  //       'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}'
  //       ,{'all':'all'});
  //   notifyListeners();
  // }
  Future<void> getinvoice_Local(
      String searchfilter, String type, String? approvetype
      // , List<ClientModel> list
      ) async {
    List<InvoiceModel> list = [];
    isloading = true;
    listInvoicesAccept = [];
    notifyListeners();

    if (approvetype == null) {
      await getinvoices();
      if (listinvoices.isNotEmpty) {
        if (type == 'approved only')
          listinvoices.forEach((element) {
            if (element.stateclient == searchfilter && element.isApprove == "1")
              list.add(element);
          });
        if (type == 'approved client')
          listinvoices.forEach((element) {
            if (element.type_client == searchfilter && element.isApprove == "1")
              list.add(element);
          });
        if (type == 'not approved')
          listinvoices.forEach((element) {
            if (element.stateclient == searchfilter &&
                element.isApprove == null) list.add(element);
          });
        if (type == 'out')
          listinvoices.forEach((element) {
            if (element.stateclient == searchfilter) list.add(element);
          });
        listInvoicesAccept = list;
      }
    } else {
      if (approvetype == 'country')
        await get_invoicesbyRegoin_accept_requst('c');
      if (approvetype == 'regoin')
        await get_invoicesbyRegoin_accept_requst('r');
      if (approvetype == 'finance')
        await get_invoicesbyRegoin_accept_requst('f');
    }

    isloading = false;
    // if(listInvoicesAccept.isEmpty)listInvoicesAccept=listinvoices;
    notifyListeners();
  }

  void addlistproductinvoic(value) {
    listproductinvoic.add(value);
    notifyListeners();
  }

  void removelistproductinvoic(index) {
    listproductinvoic.removeAt(index);
    notifyListeners();
  }

  void updatelistproducetInvoice() {
    notifyListeners();
  }

  void addlistinvoicedeleted(value) {
    listdeletedinvoice.add(value);
    notifyListeners();
  }

  void removeinvoicedeleted(index) {
    listdeletedinvoice.removeAt(index);
    notifyListeners();
  }

  bool isapproved = false;

  Future<bool> setApproveclient_vm(
      Map<String, dynamic?> body, String? idInvoice) async {
    isapproved = true;
    notifyListeners();
    InvoiceModel? data =
        await Invoice_Service().setApproveClient(body, idInvoice!);
    int index =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    int iindex = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    int iindexadmin = listInvoicesAccept_admin
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) {
      if (data != null) {
        listinvoices[index] = data;
      } else {
        listinvoices.removeAt(index);
      }
    }
    if (iindex != -1) listInvoicesAccept.removeAt(iindex);
    if (iindexadmin != -1) listInvoicesAccept_admin.removeAt(iindexadmin);
    isapproved = false;
    notifyListeners();

    return true;
  }

  Future<bool> setApproveFclient_vm(
      Map<String, dynamic?> body, String? idInvoice) async {
    isapproved = true;
    notifyListeners();
    InvoiceModel? data =
        await Invoice_Service().setApproveFClient(body, idInvoice!);
    int index =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    int iindex = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    int iindex_ff = listInvoicesAccept_admin
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index != -1) {
      if (data != null) {
        listinvoices[index] = data;
      } else {
        listinvoices.removeAt(index);
      }
    }
    if (iindex != -1) listInvoicesAccept.removeAt(iindex);
    if (iindex_ff != -1) listInvoicesAccept_admin.removeAt(iindex_ff);
    isapproved = false;
    notifyListeners();

    return true;
  }

  Future<void> get_byIdClient(String fkclient) async {
    // InvoiceModel? inv;
    // bool res=true;
    //
    // inv= listinvoices.firstWhere((element) =>element.fkIdClient==fkclient
    //     ,orElse:null);
    // if(inv==null) inv=
    // listinvoices.add(inv!);
    // notifyListeners();
  }

  List<InvoiceModel> list = [];

  Future<void> get_invoiceclientlocal2(String? fk_client) async {
    list = await Invoice_Service().getinvoicebyclient(fk_client!);
    notifyListeners();
  }

  updateListInvoiceAfterMarkEventIsDone(EventModel event) {
    final invoice = listinvoiceClientSupport
        .firstWhereOrNull((element) => element.idInvoice == event.idinvoice);
    if (invoice == null) {
      return;
    }
    List<DateInstallationClient> list = invoice.datesInstallationClient ?? [];
    list = list
        .map((e) => e.idClientsDate == event.idClientsDate
            ? e.copyWith(isDone: '1')
            : e)
        .toList();

    invoice.datesInstallationClient = list;
    listinvoiceClientSupport = listinvoiceClientSupport
        .map((e) => e.idInvoice == invoice.idInvoice ? invoice : e)
        .toList();
    notifyListeners();
  }

  Future<void> get_invoiceclientlocal(String? fk_client, String type) async {
    bool isParticipate = type == 'مشترك';

    try {
      if (isParticipate) {
        listinvoiceClientSupport = [];
        isLoadingInvoicesClientParticipateLocal = true;
        notifyListeners();
      } else {
        listinvoiceClient = [];
        isLoadingInvoicesClientLocal = true;
        notifyListeners();
      }
      List<InvoiceModel> list = [];
      listinvoiceClient = [];
      notifyListeners();
      list = await Invoice_Service().getinvoicebyclient(fk_client!);
      if (list.isNotEmpty) {
        if (isParticipate) {
          listinvoiceClientSupport = [];
          list.forEach((element) {
            if (element.fkIdClient == fk_client && element.isApprove != null)
              listinvoiceClientSupport.add(element);
          });
        } else {
          listinvoiceClient = [];
          list.forEach((element) {
            if (element.fkIdClient == fk_client) listinvoiceClient.add(element);
          });
        }
      }

      if (isParticipate) {
        isLoadingInvoicesClientParticipateLocal = false;
      } else {
        isLoadingInvoicesClientLocal = false;
      }
      notifyListeners();
    } catch (e) {
      if (isParticipate) {
        isLoadingInvoicesClientParticipateLocal = false;
      } else {
        isLoadingInvoicesClientLocal = false;
      }
      notifyListeners();
    }
  }

  Future<void> getinvoices() async {
    listinvoices =
        await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<void> getinvoiceswithprev_marketing(
      PrivilegeCubit privilegeCubit) async {
    //main list
    bool res = privilegeCubit.checkPrivilege('130');
    if (res) {
      listinvoices = await Invoice_Service()
          .getinvoiceMarketing(usercurrent!.fkCountry.toString());
    } else {
      res = privilegeCubit.checkPrivilege('131');
      if (res) {
        listinvoices = await Invoice_Service()
            .getinvoicebyregoin_marketing(usercurrent!.fkRegoin!);
      } else {
        res = privilegeCubit.checkPrivilege('132');
        if (res) {
          listinvoices = await Invoice_Service()
              .getinvoicebyiduser_marketing(usercurrent!.idUser.toString());
        }
      }
    }
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<void> getinvoiceswithprev(PrivilegeCubit privilegeCubit) async {
    // if(listClient.isEmpty)
    //main list
    bool res = privilegeCubit.checkPrivilege('1');
    if (res) {
      listinvoices =
          await Invoice_Service().getinvoice(usercurrent!.fkCountry.toString());
    } else {
      if (privilegeCubit.checkPrivilege('38') &&
          privilegeCubit.checkPrivilege('6'))
        listinvoices = await Invoice_Service().getmyinvoice_myregoin(
            usercurrent!.fkRegoin!, usercurrent!.idUser.toString());
      else {
        res = privilegeCubit.checkPrivilege('38');
        if (res) {
          listinvoices = await Invoice_Service()
              .getinvoicebyregoin(usercurrent!.fkRegoin!);
        } else {
          res = privilegeCubit.checkPrivilege('6');
          if (res) {
            listinvoices = await Invoice_Service()
                .getinvoicebyiduser(usercurrent!.idUser.toString());
          }
        }
      }
    }
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<void> get_invoicesbyIduser(List<InvoiceModel> list) async {
    listinvoicebyregoin = [];
    //cahe_data_source_invoice().clearCache();
    if (list.isNotEmpty) {
      list.forEach((element) {
        if (element.fkIdUser == usercurrent!.idUser)
          listinvoicebyregoin.add(element);
      });
    } else {
      listinvoices =
          await Invoice_Service().getinvoicebyiduser(usercurrent!.idUser!);
      listinvoices = listinvoicebyregoin;
    }

    notifyListeners();
  }

  InvoiceModel? get_byIdInvoice(String id_invoice) {
    InvoiceModel? inv;
    listinvoices.forEach((element) {
      if (element.idInvoice == id_invoice) inv = element;
    });
    if (inv == null) getinvoices();

    return inv; //InvoiceModel(products: []);
    // else{
    //   listinvoices = await Invoice_Service()
    //       .getinvoicebyiduser(usercurrent!.idUser!);
    //   listinvoices=listinvoicebyregoin;
    // }

    //notifyListeners();
  }

  //getinvoaicebyregoin_accept_requst
  Future<void> get_invoicesbyRegoin_accept_requst(String type) async {
    switch (type) {
      case 'r':
        listinvoicebyregoin = await Invoice_Service()
            .getinvoaicebyregoin_accept_requst(
                {'fk_regoin': usercurrent!.fkRegoin.toString()});
        break;

      // else
      case 'c':
        listinvoicebyregoin = await Invoice_Service()
            .getinvoaicebyregoin_accept_requst(
                {'fk_country': usercurrent!.fkCountry.toString()});
        break;
      case 'f':
        listinvoicebyregoin = await Invoice_Service()
            .getinvoaicebyregoin_accept_requst({'FApprove': 'f'});
    }
    listInvoicesAccept_admin = List.from(listinvoicebyregoin);
    notifyListeners();
  }

  Future<void> get_invoicesbyRegoin(List<InvoiceModel> list) async {
    listinvoicebyregoin = [];
    //cahe_data_source_invoice().clearCache();
    if (list.isNotEmpty) {
      list.forEach((element) {
        if (element.fk_regoin == usercurrent!.fkRegoin)
          listinvoicebyregoin.add(element);
      });
    } else {
      listinvoicebyregoin =
          await Invoice_Service().getinvoicebyregoin(usercurrent!.fkRegoin!);
      listinvoices = listinvoicebyregoin;
    }
    // listinvoicesApproved=listinvoices;
    listInvoicesAccept = List.from(listinvoices);
    notifyListeners();
  }

  Future<String> add_invoiceclient_vm(
    Map<String, dynamic?> body,
    File? file,
    File? myfilelogo,
    List<File> files, {
    required ValueChanged<InvoiceModel> onAddInvoiceSuccess,
  }) async {
    String res = 'done';
    // upload logo
    InvoiceModel data =
        await Invoice_Service().addInvoice(body, file, myfilelogo, []);

    // upload files and record image
    final res1 = await _uploadFiles(
      invoiceId: data.idInvoice!,
      body: body,
      file: file,
      files: files,
    );

    // fetch updated invoice
    final InvoiceModel newInvoice = await Invoice_Service()
        .getinvoicebyidInvoice(data.idInvoice.toString());

    listinvoices.insert(0, newInvoice);
    listinvoiceClient.insert(0, newInvoice);
    listInvoicesAccept.insert(0, newInvoice);
    res = newInvoice.idInvoice.toString();
    onAddInvoiceSuccess(newInvoice);
    // } else res='false';
    notifyListeners();
    return res;
  }

  Future<dynamic> _uploadFiles({
    required String invoiceId,
    required Map<String, dynamic> body,
    required File? file,
    required List<File> files,
  }) async {
    final endPoint = EndPoints.invoice.crudFilesInvoice;

    return await Api().postCrudInvoiceFile(
      'array',
      "$url$endPoint$invoiceId",
      body,
      file,
      files: files,
    );
  }

  openFile(FileAttach attachFile) async {
    try {
      if (attachFile.file != null) {
        if (!(await checkStoragePermission())) return;
        final result = await OpenFile.open(attachFile.file!.path);

        return;
      }
      final filename = attachFile.fileAttach!.name;
      if (!(await checkStoragePermission())) return;
      final checkFile = await Api().checkExist(filename);
      if (checkFile != null) {
        final result = await OpenFile.open(checkFile.path);
        return;
      }

      filesAttach = filesAttach
          .map((e) => e.id == attachFile.id
              ? e.copyWith(fileStatus: DownloadFileStatus.loading)
              : e)
          .toList();
      notifyListeners();

      File file;
      file =
          await Api().downloadFile(urlfile + attachFile.fileAttach!, filename);

      if (file.existsSync()) {
        filesAttach = filesAttach
            .map((e) => e.id == attachFile.id
                ? e.copyWith(fileStatus: DownloadFileStatus.downloaded)
                : e)
            .toList();
        await OpenFile.open(file.path);
      } else {
        filesAttach = filesAttach
            .map((e) => e.id == attachFile.id
                ? e.copyWith(fileStatus: DownloadFileStatus.unDownloaded)
                : e)
            .toList();
      }

      notifyListeners();
    } catch (e) {
      filesAttach = filesAttach
          .map((e) => e.id == attachFile.id
              ? e.copyWith(fileStatus: DownloadFileStatus.unDownloaded)
              : e)
          .toList();
      notifyListeners();
    }
  }

  Future<String> add_invoiceProduct_vm(Map<String, dynamic?>? body) async {
    String res = await Invoice_Service().addInvoiceProduct(body!);

    if (res != "false") {
      body.addAll({
        'idInvoiceProduct': res,
      });
      //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
      notifyListeners();
    }
    return res;
  }

  Future<bool> update_invoiceProduct_vm(
      Map<String, dynamic?>? body, String idInvoiceProduct) async {
    bool res =
        await Invoice_Service().updateProductInvoice(body!, idInvoiceProduct);
    //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
    notifyListeners();

    return res;
  }

  Future<bool> update_invoiceclient_vm(Map<String, dynamic?> body,
      String? idInvoice, File? file, File? myfilelogo, List<File> files) async {
    isloadingdone = true;
    notifyListeners();

    // upload files
    await _uploadFiles(
      invoiceId: idInvoice!,
      body: body,
      file: null,
      files: files,
    );

    final endPoint = EndPoints.invoice.clientUpdateInvoice;
    ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.phpUrl);

    final response = await apiServices.postRequestWithFile(
      endPoint,
      body,
      file,
      myfilelogo,
      files: [], // empty to avoid duplicate
    );

    final invoicesList = response["message"];
    final invoice = InvoiceModel.fromJson(invoicesList[0]);

    final index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);
    // body.addAll({
    //   "id_invoice":idInvoice,
    //   "date_create":listinvoiceClient[index].dateCreate.toString(),
    //
    //   "products":listproductinvoic.map((e)=>e.toJson()).toList()
    // });
    if (index != -1)
      listinvoiceClient[index] = invoice; //InvoiceModel.fromJson(body);
    final index1 =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoices[index1] = invoice;

    int index2 = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index2 != -1) listInvoicesAccept[index2] = invoice;

    //InvoiceModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    isloadingdone = false;
    currentInvoice = invoice;
    notifyListeners();

    return true;
  }

  Future<bool> edit_invoice(
      Map<String, dynamic?> body, String? idInvoice) async {
    isloadingdone = true;
    notifyListeners();
    InvoiceModel data =
        await Invoice_Service().editinvoice(body, idInvoice.toString());
    final index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);
    // body.addAll({
    //   "id_invoice":idInvoice,
    //   "date_create":listinvoiceClient[index].dateCreate.toString(),
    //
    //   "products":listproductinvoic.map((e)=>e.toJson()).toList()
    // });
    if (index != -1)
      listinvoiceClient[index] = data; //InvoiceModel.fromJson(body);
    final index1 =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoices[index1] = data;

    int index2 = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index2 != -1) listInvoicesAccept[index2] = data;

    //InvoiceModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    isloadingdone = false;
    currentInvoice = data;
    notifyListeners();

    return true;
  }

  Future<bool> add_payment(
      Map<String, dynamic?> body, String? idInvoice) async {
    isloadingdone = true;
    notifyListeners();
    InvoiceModel data =
        await Invoice_Service().addPayment(body, idInvoice.toString());
    final index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);
    // body.addAll({
    //   "id_invoice":idInvoice,
    //   "date_create":listinvoiceClient[index].dateCreate.toString(),
    //
    //   "products":listproductinvoic.map((e)=>e.toJson()).toList()
    // });
    if (index != -1)
      listinvoiceClient[index] = data; //InvoiceModel.fromJson(body);
    final index1 =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoices[index1] = data;

    int index2 = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index2 != -1) listInvoicesAccept[index2] = data;

    //InvoiceModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    isloadingdone = false;
    currentInvoice = data;
    notifyListeners();

    return true;
  }

  Future<String> delete_invoice(
      Map<String, dynamic> body, String? id_invoice) async {
    int index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == id_invoice);
    listinvoiceClient.removeAt(index);
    notifyListeners();
    String res = await Invoice_Service().deleteInvoiceById(body);

    //if(res=="done"){
    index =
        listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    listinvoices.removeAt(index);

    index = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == id_invoice);
    listInvoicesAccept.removeAt(index);
    notifyListeners();
    //}
    return res;
  }

  Future<String> deleteProductInInvoice(String? idInvoiceProduct) async {
    String res =
        await Invoice_Service().deleteProductInInvoice(idInvoiceProduct!);

    if (res == "done") {
      int index = listproductinvoic.indexWhere(
          (element) => element.idInvoiceProduct == idInvoiceProduct);
      if (index != -1) listproductinvoic.removeAt(index);

      notifyListeners();
    }
    return res;
  }

  Future<void> setdate_vm({
    required String id_invoice,
    required String date_client_visit,
    required String date_end,
    required String fk_user,
    required String fk_client,
    required String type_date,
    required ValueChanged<String> onSuccess,
  }) async {
    isloadingdone = true;
    notifyListeners();
    // int index = listinvoices.indexWhere((element) => element.idInvoice == id_invoice);

    // int index1 = listinvoiceClientSupport.indexWhere((element) => element.idInvoice == id_invoice);
    // InvoiceModel te = await Invoice_Service().setdate(body, id_invoice!);

    final data = await Invoice_Service().addDateInstall(
      id_invoice: id_invoice,
      date_client_visit: date_client_visit,
      date_end: date_end,
      fk_user: fk_user,
      fk_client: fk_client,
      type_date: type_date,
    );

    onSuccess.call(data);
    // if (index != -1) listinvoices[index] = te;
    // //
    // listinvoiceClientSupport[index1] = te;

    // listinvoiceClientSupport
    // body.addAll(
    //     InvoiceModel.fromJson(listinvoices[index]));
    // listinvoices[index]= InvoiceModel.fromJson(body);
    // //listClient.removeAt(index);
    isloadingdone = false;
    notifyListeners();
  }

  Future<void> editSchedule_vm({
    required String scheduleId,
    required String dateClientVisit,
    required String date_end,
    required String processReason,
    required String typeDate,
    required ValueChanged<String> onSuccess,
  }) async {
    isloadingRescheduleOrCancel = true;
    notifyListeners();

    final data = await Invoice_Service().editScheduleInstallation(
      scheduleId: scheduleId,
      dateClientVisit: dateClientVisit,
      date_end: date_end,
      typeSchedule: typeDate,
      processReason: processReason,
      fk_user: iduser,
    );

    onSuccess.call(data);
    isloadingRescheduleOrCancel = false;
    notifyListeners();
  }

  Future<void> cancelSchedule_vm({
    required String scheduleId,
    required ValueChanged<String> onSuccess,
  }) async {
    isloadingRescheduleOrCancel = true;
    notifyListeners();
    final data = await Invoice_Service()
        .cancelScheduleInstallation(scheduleId: scheduleId);
    onSuccess.call(data);
    isloadingRescheduleOrCancel = false;
    notifyListeners();
  }

  Future<void> set_state_back(
      Map<String, dynamic> body, String? id_invoice, File? file) async {
    try {
      isloading = true;
      notifyListeners();
      InvoiceModel data =
          await Invoice_Service().setstate(body, id_invoice!, file);
      int index =
          listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
      if (index != -1) {
        listinvoices[index] = data;
      }
      index = listinvoiceClient
          .indexWhere((element) => element.idInvoice == id_invoice);
      if (index != -1) {
        listinvoiceClient[index] = data;
      }
      currentInvoice = data;
      index = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == id_invoice);
      if (index != -1) {
        listInvoicesAccept[index] = data;
      }

      // listinvoiceClient
      // body.addAll(
      //     InvoiceModel.fromJson(listinvoices[index]));
      // listinvoices[index]= InvoiceModel.fromJson(body);
      // //listClient.removeAt(index);
      isloading = false;
      notifyListeners();
    } catch (e) {
      isloading = false;
      notifyListeners();
    }
  }

  Future<void> deleteBack(String id_invoice, String file_reject) async {
    isloading = true;
    notifyListeners();
    InvoiceModel data =
        await Invoice_Service().deleteBack(id_invoice, file_reject);
    int index =
        listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    if (index != -1) {
      listinvoices[index] = data;
    }
    index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == id_invoice);
    if (index != -1) {
      listinvoiceClient[index] = data;
    }
    currentInvoice = data;
    index = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == id_invoice);
    if (index != -1) {
      listInvoicesAccept[index] = data;
    }

    isloading = false;
    notifyListeners();
  }

  bool isloadingdone = false;
  bool isloadingRescheduleOrCancel = false;

  Future<bool> setdatedone_vm(
      Map<String, dynamic?> body, String? id_invoice) async {
    try {
      isloadingdone = true;
      notifyListeners();
      int index =
          listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
      int index1 = listinvoiceClientSupport
          .indexWhere((element) => element.idInvoice == id_invoice);
      InvoiceModel inv = await Invoice_Service().setdatedone(body, id_invoice!);
      if (index != -1) listinvoices[index] = inv;
      if (index1 != -1) listinvoiceClientSupport[index1] = inv;
      isloadingdone = false;
      notifyListeners();
      return true;
    } catch (e) {
      isloadingdone = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> set_ready_install(
      Map<String, dynamic?> body, String? id_invoice) async {
    isloadingdone = true;
    notifyListeners();
    int index =
        listinvoices.indexWhere((element) => element.idInvoice == id_invoice);
    int index1 = listinvoiceClientSupport
        .indexWhere((element) => element.idInvoice == id_invoice);
    InvoiceModel inv =
        await Invoice_Service().set_ready_install(body, id_invoice!);
    if (index != -1) listinvoices[index] = inv;
    if (index1 != -1) listinvoiceClientSupport[index1] = inv;
    isloadingdone = false;
    notifyListeners();
  }

  Future<void> get_invoice_deleted() async {
    if (listdeletedinvoice.isEmpty)
      listdeletedinvoice = await Invoice_Service()
          .getinvoice_deleted(usercurrent!.fkRegoin.toString());
    notifyListeners();
  }

  void disposValue(index) {
    if (index != -1)
      listinvoiceClient.removeAt(index);
    else {
      listinvoiceClient = [];
    }
    listproductinvoic = [];
    notifyListeners();
  }

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getAgentsAndDistributors();
      agentDistributorsState = agentDistributorsState.changeToLoaded(list!);
      notifyListeners();
      return;
    } catch (e) {
      agentDistributorsState = agentDistributorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  PageState<List<ParticipateModel>> collaboratorsState = PageState();

  ParticipateModel? selectedCollaborator;
  AgentDistributorModel? selectedAgent;
  AgentDistributorModel? selectedDistributor;

  Future<void> getCollaborators() async {
    try {
      if (!collaboratorsState.isLoading) {
        collaboratorsState = collaboratorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getCollaborators();
      collaboratorsState = collaboratorsState.changeToLoaded(list);
      notifyListeners();
      return;
    } catch (e) {
      collaboratorsState = collaboratorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  SellerType? selectedSellerType = SellerType.employee;
  SellerStatus sellerStatus = SellerStatus.init;

  Future<void> onChangeSellerType(SellerType sellerType,
      {InvoiceModel? invoice}) async {
    selectedSellerType = sellerType;
    notifyListeners();
    if (selectedSellerType == SellerType.employee) {
      return;
    }

    if (selectedSellerType != SellerType.collaborator) {
      if (agentDistributorsState.data != null) {
        if (invoice != null) {
          if (selectedSellerType == SellerType.agent) {
            selectedAgent = agentDistributorsState.data?.firstWhereOrNull(
                (element) => element.idAgent == invoice.fk_agent);
          } else {
            selectedDistributor = agentDistributorsState.data?.firstWhereOrNull(
                (element) => element.idAgent == invoice.fk_agent);
          }
          notifyListeners();
        }
        return;
      }

      sellerStatus = SellerStatus.loading;
      notifyListeners();

      final result = await getAgentsAndDistributors();
      if (agentDistributorsState.isSuccess) {
        sellerStatus = SellerStatus.loaded;

        if (invoice != null) {
          if (selectedSellerType == SellerType.agent) {
            selectedAgent = agentDistributorsState.data?.firstWhereOrNull(
                (element) => element.idAgent == invoice.fk_agent);
          } else {
            selectedDistributor = agentDistributorsState.data?.firstWhereOrNull(
                (element) => element.idAgent == invoice.fk_agent);
          }
          notifyListeners();
        }
      } else {
        sellerStatus = SellerStatus.failed;
      }
      notifyListeners();
      return;
    }

    if (collaboratorsState.data != null) {
      if (invoice != null) {
        selectedCollaborator = collaboratorsState.data?.firstWhereOrNull(
            (element) => element.id_participate == invoice.participate_fk);
        notifyListeners();
      }
      return;
    }

    sellerStatus = SellerStatus.loading;
    notifyListeners();

    final result = await getCollaborators();
    if (collaboratorsState.isSuccess) {
      sellerStatus = SellerStatus.loaded;
      if (invoice != null) {
        selectedCollaborator = collaboratorsState.data?.firstWhereOrNull(
            (element) => element.id_participate == invoice.participate_fk);
        notifyListeners();
      }
    } else {
      sellerStatus = SellerStatus.failed;
    }
    notifyListeners();

    return;
  }

  onChangeSelectedCollaborator(ParticipateModel collaborator) {
    selectedCollaborator = collaborator;
    notifyListeners();
  }

  onChangeSelectedAgent(AgentDistributorModel agentDistributorModel) {
    if (selectedSellerType == SellerType.agent) {
      selectedAgent = agentDistributorModel;
    } else {
      selectedDistributor = agentDistributorModel;
    }
    notifyListeners();
  }

  initAdditionalInformation(InvoiceModel invoiceModel) {
    // if (invoiceModel.type_seller == "3") {
    //   return;
    // }

    final sellerType =
        SellerType.values[int.parse(invoiceModel.type_seller ?? '0')];
    onChangeSellerType(sellerType, invoice: invoiceModel);
  }

  resetAdditionalInformation() {
    selectedCollaborator = null;
    selectedAgent = null;
    selectedDistributor = null;
    selectedSellerType = SellerType.employee;
    agentDistributorsState = PageState();
    collaboratorsState = PageState();
  }

  uploadAttachedFile({
    required String idInvoice,
    required File file,
    required VoidCallback onLoading,
    required ValueChanged<String> onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      onLoading();
      var data = await Api().postRequestWithFile(
          'array',
          url + "client/invoice/add_attach_invoice.php",
          {"id_invoice": idInvoice},
          file,
          null);

      final invoice = InvoiceModel.fromJson(data[0]);
      onSuccess(invoice.fileAttach ?? "");
    } catch (e) {
      onFailure();
      notifyListeners();
    }
  }

  deleteFile({
    required String idInvoice,
    required VoidCallback onLoading,
    required VoidCallback onSuccess,
    required VoidCallback onFailure,
  }) async {
    try {
      onLoading();
      var data = await Api().post(
        url: url + "FilesInvoice/delete_file_attach.php",
        body: {'id_invoice': idInvoice},
      );

      onSuccess();
    } catch (e) {
      onFailure();
      notifyListeners();
    }
  }

  List<InvoiceModel> listApproveFinanceFilter = [];
  List<InvoiceModel> listdeletedFilterSearch = [];

  void onSearch(String query) {
    final list = List.of(listInvoicesAccept);

    listApproveFinanceFilter = list.where((element) {
      return (element.name_enterprise
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false) ||
          (element.name_regoin_invoice
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false);
    }).toList();

    notifyListeners();
  }

  void onSearch_finance(String query) {
    final list = List.of(listInvoicesAccept_admin);

    listApproveFinanceFilter = list.where((element) {
      return (element.name_enterprise
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false) ||
          (element.name_regoin_invoice
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false);
    }).toList();

    notifyListeners();
  }

  void onSearch_deleted(String query) {
    final list = List.of(listdeletedinvoice);

    listdeletedFilterSearch = list.where((element) {
      return (element.name_enterprise
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false) ||
          (element.name_regoin_invoice
                  ?.toLowerCase()
                  .contains(query.toLowerCase()) ??
              false);
    }).toList();

    notifyListeners();
  }

  List<FileAttach> filesAttach = [];

  initAttachFiles(List<FileAttach> filesAttach) {
    this.filesAttach = List.of(filesAttach);
  }

  addOnFilesAttach(List<FileAttach> files, VoidCallback onLimitExceeded) {
    final count = maxFilesAttach - filesAttach.length;
    if (count <= 0) {
      onLimitExceeded();
      return;
    } else {
      final attaches = files.take(count);
      filesAttach.addAll(attaches);
      notifyListeners();
    }
  }

  deleteFileAttach(int index) {
    filesAttach.removeAt(index);
    notifyListeners();
  }

  final int maxFilesAttach = 20;

  bool isLoadingCrudFiles = false;

  curdInvoiceFiles({
    required Map<String, dynamic> body,
    required List<File> files,
    File? file,
    required String invoiceId,
    VoidCallback? onSucess,
    required Function(dynamic value) onFail,
  }) async {
    try {
      isLoadingCrudFiles = true;
      notifyListeners();
      final data = await Invoice_Service().crudFilesInvoice(
          files: files, body: body, invoiceId: invoiceId, file: file);
      print('data.error ' + data.error);
      if (data.error == '') {
        final invoice = currentInvoice!.copyWith(
          filesAttach: data.filesAttach,
          imageRecord: (data.imageRecord?.isNotEmpty ?? false)
              ? urlfile + data.imageRecord!
              : null,
        );

        final index = listinvoiceClient
            .indexWhere((element) => element.idInvoice == invoiceId);
        if (index != -1) listinvoiceClient[index] = invoice;
        final index1 = listinvoices
            .indexWhere((element) => element.idInvoice == invoiceId);
        if (index1 != -1) listinvoices[index1] = invoice;
        int index2 = listInvoicesAccept
            .indexWhere((element) => element.idInvoice == invoiceId);
        if (index2 != -1) listInvoicesAccept[index2] = invoice;

        currentInvoice = invoice;
        isLoadingCrudFiles = false;
        notifyListeners();
        onSucess?.call();
      } else {
        currentInvoice =
            await Invoice_Service().getinvoicebyidInvoice(invoiceId);
        isLoadingCrudFiles = false;
        notifyListeners();
        onFail?.call('error from backend  ' + data.error);
      }
    } on Exception catch (e) {
      currentInvoice = await Invoice_Service().getinvoicebyidInvoice(invoiceId);

      isLoadingCrudFiles = false;
      notifyListeners();
      print('exp  ' + e.runtimeType.toString());

      onFail?.call('error from app  ' + e.runtimeType.toString());
    }
  }
}

// todo: move this class to a separate file while refactoring
class InvoiceFilter {
  static Future<CancelableOperation<List<InvoiceModel>>?> execute({
    List<MainCityModel>? listSelectedRegions,
    List<CityModel> selectedCities = const [],
    String? state,
    String url = '',
  }) async {
    String type = '';
    bool isAllRegions = false;
    String params = '';
    Map<String, String> data = {};

    if (listSelectedRegions!.isNotEmpty) {
      // handle if all main cities selected
      isAllRegions = _checkIfAllRegions(listSelectedRegions);
      // prepare params
      params = _prepareQueryParams(
        listSelectedMainCity: listSelectedRegions,
        selectedCities: selectedCities,
      );
      print("params => $params");
    }

    // handle state and type
    type = _handleRequestBody(
      isAllRegions: isAllRegions,
      selectedCities: selectedCities,
      type: type,
      state: state,
    );
    print("type => $type");

    state = _handleState(state);
    print("state => $state");

    // prepare url
    url = _prepareUrl(
      params: params,
      url: url,
      state: state,
    );
    print("url => $url");

    // prepare data
    data = _prepareData(
      isFilterByCities: selectedCities.isNotEmpty,
      type: type,
    );
    print("data => $data");

    return CancelableOperation.fromFuture(
        Invoice_Service().getinvoicemaincity(url, data));
  }

  static bool _checkIfAllRegions(List<MainCityModel> listSelectedMainCity) =>
      listSelectedMainCity.any((element) => element.id_maincity == '0');

  static String _prepareQueryParams({
    required List<MainCityModel> listSelectedMainCity,
    required List<CityModel> selectedCities,
  }) {
    if (selectedCities.isNotEmpty) {
      final ids = selectedCities.map((val) => val.id_city).join(', ');
      return '&city_fks=($ids)';
    }
    return listSelectedMainCity.map((val) {
      return '&maincity_fks[]=${val.id_maincity}';
    }).join('');
  }

  static String _handleRequestBody({
    required List<CityModel> selectedCities,
    required String type,
    required bool isAllRegions,
    String? state,
  }) {
    if (selectedCities.isNotEmpty) {
      return _handleBodyTypeForCities();
    }
    return _handleBodyTypeForRegions(isAllRegions, state);
  }

  static String _handleBodyTypeForCities() {
    return 'allmixCity';
  }

  static String _handleBodyTypeForRegions(bool isAllRegions, String? state) {
    if (isAllRegions && state == 'الكل')
      return 'all';
    else if (isAllRegions && state != 'الكل')
      return 'allmaincity';
    else if (!isAllRegions && state == 'الكل')
      return 'allstate';
    else if (!isAllRegions && state != 'الكل') return 'allmix';
    return 'allmaincity';
  }

  static Map<String, String> _prepareData({
    required String type,
    required bool isFilterByCities,
  }) {
    if (isFilterByCities) {
      return _prepareDataForCities(type);
    }
    return _prepareDataForRegions(type);
  }

  static Map<String, String> _prepareDataForCities(String type) {
    if (type == 'allmixCity') {
      return {'allmixCity': 'allmixCity'};
    }
    return {'allmixCity': 'allmixCity'};
  }

  static Map<String, String> _prepareDataForRegions(String type) {
    if (type == 'all') {
      return {};
    } else if (type == 'allmaincity') {
      return {'allmaincity': 'allmaincity'};
    } else if (type == 'allstate') {
      return {'allstate': 'allstate'};
    } else if (type == 'allmix') {
      return {'allmix': 'allmix'};
    }
    return {'allmaincity': 'allmaincity'};
  }

  static String _prepareUrl({
    required String url,
    required String params,
    String? state,
  }) {
    return url + params + '&state=${state.toString()}';
  }

  static String? _handleState(String? state) {
    switch (state) {
      case 'بالإنتظار':
        return null;
      case 'تم التركيب':
        return '1';
      case 'معلق':
        return 'suspend';
      case 'غير جاهز':
        return 'notReady';
      default:
        return state;
    }
  }
}
