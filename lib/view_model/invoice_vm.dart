import 'dart:io';

import 'package:async/async.dart';
import 'package:collection/collection.dart';
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/core/common/enums/enums.dart';
import 'package:crm_smart/core/common/enums/seller_type_enum.dart';
import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/common/helpers/calculate_page.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart'
    as pageState;
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/presentation/manager/invoices_tab_cubit/invoices_tab_cubit.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/Invoice_Service.dart';
import 'package:crm_smart/ui/screen/invoice/invoice_images_file.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

import '../core/common/helpers/check_sorage_permission.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../helper/invoice_filter.dart';
import '../model/agent_distributor_model.dart';
import '../model/calendar/event_model.dart';
import '../model/participatModel.dart';

const CACHE_InvoiceClient_KEY = "CACHE_InvoiceClient_KEY";
const CACHE_InvoiceClient_INTERVAL = 60 * 1000; // 1 MINUTE IN MILLIS

const CACHE_Invoice_Deleted_KEY = "CACHE_Invoice_Deleted_KEY";
const CACHE_Invoice_Deleted_INTERVAL = 60 * 1000; // 30s in millis

enum SellerStatus { init, loading, loaded, failed }

class InvoiceVm extends ChangeNotifier {
  String total = '0';

  InvoiceModel? currentInvoice;
  final TextEditingController searchController = TextEditingController();

  setCurrentInvoice(InvoiceModel invoice, {bool needRefresh = false}) {
    currentInvoice = invoice;
    if (needRefresh) {
      notifyListeners();
    }
  }

  void set_total(val) {
    if (val == null || val == "null") return;
    total = val;
    notifyListeners();
  }

  bool _isloading = false;

  bool get isloading => _isloading;

  set isloading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  void changeIsLoading() {
    _isloading = !_isloading;
    notifyListeners();
  }

  bool isloading_marketing = false;
  UserModel? usercurrent;
  String? typeClientValue;

  InvoiceVm() {
    //get_invoicesbyRegoin("");
  }

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  PageState<List<AgentDistributorModel>> agentDistributorsState = PageState();
  PageState<List<ParticipateModel>> collaboratorsState = PageState();
  ParticipateModel? selectedCollaborator;
  AgentDistributorModel? selectedAgent;
  AgentDistributorModel? selectedDistributor;
  SellerTypeEnum? selectedSellerType = SellerTypeEnum.employee;

  bool isLoadingInvoicesClientParticipateLocal = false;
  bool isLoadingInvoicesClientLocal = false;
  List<InvoiceModel> listinvoiceClient = [];
  List<InvoiceModel> listinvoiceClientSupport = [];
  List<InvoiceModel> listforme = [];
  List<InvoiceModel> listdeletedinvoice = [];
  List<ProductsInvoice> productsInvoiceList = [];
  List<ProductsInvoice> addedProductsInvoice = [];
  List<ProductsInvoice> editProductsInvoiceRemote = [];
  List<String> deleteProductsInvoice = [];
  List<DeletedinvoiceModel> listdeleted = [];
  List<InvoiceModel> listinvoicebyregoin = [];
  List<InvoiceModel> listinvoices = [];
  List<InvoiceModel> listinvoicesMarketing = [];
  List<InvoiceModel> listinvoicesApproved = [];
  List<InvoiceModel> listInvoicesAccept = []; //مشتركين
  int listInvoicesAcceptTotalCount = 0;
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

  Future<void> searchwait(BuildContext context, String productName,
      PrivilegeCubit privilegeCubit) async {
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
        getinvoice_Local(context, 'مشترك', 'not approved', 'country');
      else {
        if (privilegeCubit.state.userPrivilegesState.data
                .firstWhereOrNull((element) => element.fkPrivilege == '7')
                ?.isCheck! ??
            false) getinvoice_Local(context, 'مشترك', 'not approved', 'regoin');
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

  Future<void> searchwaitout(BuildContext context, String productName) async {
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
      getinvoice_Local(context, "منسحب", 'out', null);
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
              if (element.isdoneinstall == null &&
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
              if (element.isdoneinstall == null &&
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

  // Future<void> getinvoice_waiting() async {
  //   isloading = true;
  //   listInvoicesAccept = await Invoice_Service().getinvoicemaincity(
  //       'client/invoice/getinvoicemaincity.php?fk_country=${usercurrent!.fkCountry.toString()}',
  //       {'allmaincity': 'allmaincity'});
  //   isloading = false;
  // }

  void setisload({bool isLoading = false}) {
    isloadingdone = isLoading;
    notifyListeners();
  }

  CancelableOperation<List<InvoiceModel>>? _cancelableFuture;

  Future<void> filterInvoices({
    List<MainCityModel>? listSelectedRegions,
    List<CityModel> selectedCities = const [],
    bool isNewFilter = false,
    bool isInit = false,
  }) async {
    try {
      if (_shouldReturnEarly(isInit)) return;

      isloading = true;

      if (isNewFilter) listInvoicesAccept.clear();

      await _cancelableFuture?.cancel();

      final apiServices = _initializeApiServices();
      final invoiceFilter =
          _createInvoiceFilter(listSelectedRegions, selectedCities);

      final response = await _fetchInvoices(
        apiServices,
        invoiceFilter,
        searchController.text,
      );

      _processResponse(response);

      isloading = false;
    } catch (e) {
      isloading = false;
      debugPrint("error in filterInvoices => $e");
      throw e;
    }
  }

  bool _shouldReturnEarly(bool isInit) => isloading && !isInit;

  ApiServices _initializeApiServices() {
    final apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    return apiServices;
  }

  InvoiceFilter _createInvoiceFilter(
    List<MainCityModel>? listSelectedRegions,
    List<CityModel> selectedCities,
  ) {
    return InvoiceFilter(
      listSelectedRegions: listSelectedRegions,
      selectedCities: selectedCities,
      state: typeClientValue,
    );
  }

  Future<Map<String, dynamic>> _fetchInvoices(
    ApiServices apiServices,
    InvoiceFilter invoiceFilter,
    String? searchQuery,
  ) async {
    int limit = 15;
    return await apiServices.post(
      endPoint: EndPoints.invoice.getInvoiceMainCity,
      queryParameters: invoiceFilter.prepareQueryParams(
        limit: limit,
        page: calculatePage(skip: listInvoicesAccept.length, limit: limit),
        fkCountry: usercurrent!.fkCountry!,
        searchQuery: searchQuery,
      ),
      data: invoiceFilter.prepareData(),
    );
  }

  void _processResponse(Map<String, dynamic> response) {
    listInvoicesAcceptTotalCount = response['count'] ?? 0;
    final data = apiDataHandler(response);
    final invoices =
        List<InvoiceModel>.from(data.map((e) => InvoiceModel.fromJson(e)));

    _cancelableFuture = CancelableOperation.fromValue(invoices);
    listInvoicesAccept.addAll(invoices);
    temp_listInvoicesAccept = List.from(listInvoicesAccept);
  }

  Future<void> getclienttype_filter(BuildContext context, String? filter,
      String? regoin, String tyype) async {
    // listInvoicesAccept=[];
    if (tyype == 'only')
      await getinvoice_Local(context, "مشترك", 'approved only', null);
    if (tyype == 'client')
      await getinvoice_Local(context, "مشترك", 'approved client', null);
    if (tyype == 'not')
      await getinvoice_Local(context, "مشترك", 'not approved', null);
    if (tyype == 'out') await getinvoice_Local(context, "مستبعد", 'out', null);

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
              if (element.isdoneinstall == null &&
                  element.id_maincity == regoin) {
                _listInvoicesAccept.add(element);
              }
            });
          } else {
            listInvoicesAccept.forEach((element) {
              if (element.isdoneinstall == null) {
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

  Future<void> getfilterview(
      BuildContext context, String? regoin, String tyype) async {
    listInvoicesAccept_admin = [];
    notifyListeners();
    if (tyype == 'only')
      await getinvoice_Local(context, "مشترك", 'approved only', null);
    if (tyype == 'client')
      await getinvoice_Local(context, "مشترك", 'approved client', null);
    if (tyype == 'not')
      await getinvoice_Local(
          context, "مشترك", 'not approved', null); //طلبات الموافقة الفلتر
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
    listInvoicesAccept = [];
    isloading = true;
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

  Future<void> getinvoice_Local(BuildContext context, String searchfilter,
      String type, String? approvetype
      // , List<ClientModel> list
      ) async {
    List<InvoiceModel> list = [];
    isloading = true;
    listInvoicesAccept = [];
    notifyListeners();

    if (approvetype == null) {
      await context
          .read<InvoicesTabCubit>()
          .getInvoicesByPrivileges(isNewFilter: true);
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

  void addNewProductInvoice(value) {
    productsInvoiceList.add(value);
    addedProductsInvoice.add(value);
    notifyListeners();
  }

  void removeProduct({
    String? idInvoiceProduct,
    String? localId,
  }) {
    if (idInvoiceProduct != null) {
      _removeRemoteProduct(idInvoiceProduct);
    } else {
      _removeLocalProduct(localId!);
    }
    notifyListeners();
  }

  void _removeRemoteProduct(String idInvoiceProduct) {
    productsInvoiceList.removeWhere((element) {
      return element.idInvoiceProduct == idInvoiceProduct;
    });

    editProductsInvoiceRemote.removeWhere((element) {
      return element.idInvoiceProduct == idInvoiceProduct;
    });

    deleteProductsInvoice.add(idInvoiceProduct);
  }

  void _removeLocalProduct(String localId) {
    productsInvoiceList.removeWhere((element) {
      return element.localId == localId;
    });

    addedProductsInvoice.removeWhere((element) {
      return element.localId == localId;
    });
  }

  void editProduct(ProductsInvoice product) {
    if (product.idInvoiceProduct != null) {
      _editRemoteProduct(product);
    } else {
      _editLocalProduct(product);
    }
    notifyListeners();
  }

  void _editRemoteProduct(ProductsInvoice product) {
    // edit in productsInvoiceList
    int index = productsInvoiceList.indexWhere((element) {
      return element.idInvoiceProduct == product.idInvoiceProduct;
    });

    if (index != -1) {
      productsInvoiceList[index] = product;
    }

    // edit in editProductsInvoiceRemote
    index = editProductsInvoiceRemote.indexWhere((element) {
      return element.idInvoiceProduct == product.idInvoiceProduct;
    });

    if (index == -1) {
      editProductsInvoiceRemote.add(product);
    } else {
      editProductsInvoiceRemote[index] = product;
    }
  }

  void _editLocalProduct(ProductsInvoice product) {
    // edit in productsInvoiceList
    int index = productsInvoiceList.indexWhere((element) {
      return element.localId == product.localId;
    });

    if (index != -1) {
      productsInvoiceList[index] = product;
    }

    // edit in addEdProductsInvoice
    index = addedProductsInvoice.indexWhere((element) {
      return element.localId == product.localId;
    });

    if (index != -1) {
      addedProductsInvoice[index] = product;
    }
  }

  double calculateTotal() {
    double total = 0;

    productsInvoiceList.forEach((element) {
      total += double.parse(
        element.price.toString(),
      );
    });

    set_total(total.toString());

    return total;
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
      Map<String, dynamic> body, String? idInvoice) async {
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
      Map<String, dynamic> body, String? idInvoice) async {
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
    list
        .map((date) => date.idClientsDate == event.idClientsDate
            ? date.copyWith(isDone: IsDoneDateEnum.done.index.toString())
            : date)
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

  Future<void> getinvoices(BuildContext context,
      [GetInvoicesByPrivilegesParams? filters]) async {
    // usercurrent!.fkCountry.toString()
    listinvoices = context.read<InvoicesTabCubit>().invoicesList;
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
          await Invoice_Service().getInvoices(GetInvoicesByPrivilegesParams());
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

  Future<String> AddInvoiceClientVm(
    Map<String, dynamic> body,
    File? file,
    File? myfilelogo,
    List<File> files, {
    required ValueChanged<InvoiceModel> onAddInvoiceSuccess,
  }) async {
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    final response = await apiServices.postRequestWithFile(
      url: EndPoints.invoice.addInvoice,
      data: body,
      file: file,
      fileLogo: myfilelogo,
      files: files,
    );
    final data = apiDataHandler(response);

    final InvoiceModel newInvoice = InvoiceModel.fromJson(data);

    listinvoices.insert(0, newInvoice);
    listinvoiceClient.insert(0, newInvoice);
    listInvoicesAccept.insert(0, newInvoice);

    onAddInvoiceSuccess(newInvoice);
    notifyListeners();

    return newInvoice.idInvoice.toString();
  }

  openFile({
    required FileAttach attachFile,
    String? baseUrl,
    required BuildContext context,
  }) async {
    baseUrl ??= EndPoints.baseUrls.laravelFilesUrl;
    try {
      if (attachFile.file != null) {
        if (!(await checkStoragePermission())) return;
      }
      final filename = attachFile.fileAttach!.name;
      if (!(await checkStoragePermission())) return;

      filesAttach = filesAttach
          .map((e) => e.id == attachFile.id
              ? e.copyWith(fileStatus: DownloadFileStatus.loading)
              : e)
          .toList();
      notifyListeners();

      File file;
      // if url then download file but take care we we have separated base url so we can't check using http or https
      file = File(attachFile.fileAttach!);
      if (!file.existsSync()) {
        file = await Api()
            .downloadFile(baseUrl + attachFile.fileAttach!, filename);
      }

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
      debugPrint("error in open file $e");
      AppConstants.showSnakeBar(
        context,
        "Error in open file $e",
        maxLines: 5,
      );
      filesAttach = filesAttach
          .map((e) => e.id == attachFile.id
              ? e.copyWith(fileStatus: DownloadFileStatus.unDownloaded)
              : e)
          .toList();
      notifyListeners();
    }
  }

  Future<String> add_invoiceProduct_vm(Map<String, dynamic>? body) async {
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
      Map<String, dynamic>? body, String idInvoiceProduct) async {
    bool res =
        await Invoice_Service().updateProductInvoice(body!, idInvoiceProduct);
    //listproductinvoic.insert(0, ProductsInvoice.fromJson(body));
    notifyListeners();

    return res;
  }

  Future<bool> updateInvoiceClientVm({
    required Map<String, dynamic> body,
    String? idInvoice,
    File? file,
    File? fileLogo,
    List<File> files = const [],
    bool isDeleteFile = false,
    bool isDeleteLogo = false,
  }) async {
    try {
      isloadingdone = true;
      notifyListeners();

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.postRequestWithFile(
        url: "${EndPoints.invoice.updateInvoice}${idInvoice}",
        data: body,
        file: file,
        fileLogo: fileLogo,
        files: files,
        isDeleteFile: isDeleteFile,
        isDeleteLogo: isDeleteLogo,
      );

      final data = apiDataHandler(response);

      final invoice = InvoiceModel.fromJson(data);

      int index = listinvoiceClient
          .indexWhere((element) => element.idInvoice == idInvoice);
      if (index != -1) listinvoiceClient[index] = invoice;

      index =
          listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
      if (index != -1) listinvoices[index] = invoice;

      index = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == idInvoice);
      if (index != -1) listInvoicesAccept[index] = invoice;

      isloadingdone = false;
      currentInvoice = invoice;
      notifyListeners();

      return true;
    } on BaseAppException catch (e) {
      debugPrint("error in updateInvoiceClientVm => ${e.message}");
      return false;
    } catch (e) {
      debugPrint("error in updateInvoiceClientVm => $e");
      rethrow;
    }
  }

  Future<bool> edit_invoice(
      Map<String, dynamic> body, String? idInvoice) async {
    isloadingdone = true;
    notifyListeners();
    InvoiceModel data =
        await Invoice_Service().editinvoice(body, idInvoice.toString());
    final index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);

    if (index != -1)
      listinvoiceClient[index] = data; //InvoiceModel.fromJson(body);
    final index1 =
        listinvoices.indexWhere((element) => element.idInvoice == idInvoice);
    if (index1 != -1) listinvoices[index1] = data;

    int index2 = listInvoicesAccept
        .indexWhere((element) => element.idInvoice == idInvoice);
    if (index2 != -1) listInvoicesAccept[index2] = data;

    isloadingdone = false;
    currentInvoice = data;
    notifyListeners();

    return true;
  }

  Future<bool> add_payment(Map<String, dynamic> body, String? idInvoice) async {
    isloadingdone = true;
    notifyListeners();
    InvoiceModel data =
        await Invoice_Service().addPayment(body, idInvoice.toString());
    final index = listinvoiceClient
        .indexWhere((element) => element.idInvoice == idInvoice);

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

  Future<String> deleteInvoice(String idInvoice) async {
    listinvoiceClient.removeWhere((element) => element.idInvoice == idInvoice);
    notifyListeners();
    String res = await Invoice_Service().deleteInvoiceById(idInvoice);
    return res;
  }

  Future<String> deleteProductInInvoice(String? idInvoiceProduct) async {
    String res =
        await Invoice_Service().deleteProductInInvoice(idInvoiceProduct!);

    if (res == "done") {
      int index = productsInvoiceList.indexWhere(
          (element) => element.idInvoiceProduct == idInvoiceProduct);
      if (index != -1) productsInvoiceList.removeAt(index);

      notifyListeners();
    }
    return res;
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
  }

  bool isloadingdone = false;
  bool isloadingRescheduleOrCancel = false;

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
    productsInvoiceList = [];
    notifyListeners();
  }

  SellerStatus sellerStatus = SellerStatus.init;

  Future<void> getAgentsAndDistributors() async {
    try {
      if (!agentDistributorsState.isLoading) {
        agentDistributorsState = agentDistributorsState.changeToLoading;
        notifyListeners();
      }

      final list = await Invoice_Service.getAgentsAndDistributors();
      agentDistributorsState = agentDistributorsState.changeToLoaded(list);
      sellerStatus = SellerStatus.loaded;
      notifyListeners();
      return;
    } catch (e) {
      debugPrint("error in getAgentsAndDistributors $e");
      agentDistributorsState = agentDistributorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> getCollaborators() async {
    try {
      if (!collaboratorsState.isLoading) {
        collaboratorsState = collaboratorsState.changeToLoading;
        notifyListeners();
      }

      final collaborators = await Invoice_Service.getCollaborators();

      collaboratorsState = collaboratorsState.changeToLoaded(collaborators);
      sellerStatus = SellerStatus.loaded;
      notifyListeners();
      return;
    } catch (e) {
      debugPrint("error in getCollaborators $e");
      collaboratorsState = collaboratorsState.changeToFailed;
      notifyListeners();
      return;
    }
  }

  Future<void> onChangeSelectedSeller({
    InvoiceModel? invoice,
  }) async {
    if (invoice == null) return;

    final sellerType = SellerTypeEnumExtension.fromValue(invoice.type_seller);

    selectedSellerType = sellerType;
    notifyListeners();

    if (selectedSellerType == SellerTypeEnum.employee) return;

    if (selectedSellerType == SellerTypeEnum.collaborator) {
      _handleCollaboratorsState(invoice);
    }

    _handleAgentDistributors(invoice);
  }

  void _handleAgentDistributors(InvoiceModel invoice) {
    final agent = agentDistributorsState.data?.firstWhereOrNull((element) {
      return element.idAgent == invoice.fk_agent &&
          element.typeAgent == SellerTypeEnum.agent.value;
    });
    final distributor = agentDistributorsState.data
        ?.firstWhereOrNull((element) => element.idAgent == invoice.fk_agent);

    if (agent != null) {
      selectedSellerType = SellerTypeEnum.agent;
      selectedAgent = agent;
    } else if (distributor != null) {
      selectedSellerType = SellerTypeEnum.distributor;
      selectedDistributor = distributor;
    }
    notifyListeners();
  }

  void _handleCollaboratorsState(InvoiceModel invoice) {
    final participate = collaboratorsState.data?.firstWhereOrNull(
        (element) => element.id_participate == invoice.participate_fk);

    if (participate != null) {
      selectedSellerType = SellerTypeEnum.collaborator;
      selectedCollaborator = participate;
      notifyListeners();
    }
  }

  onChangeSellerType(SellerTypeEnum sellerType) {
    selectedSellerType = sellerType;
    notifyListeners();
  }

  onChangeSelectedCollaborator(ParticipateModel collaborator) {
    selectedCollaborator = collaborator;
    notifyListeners();
  }

  onChangeSelectedAgent(AgentDistributorModel agentDistributorModel) {
    if (selectedSellerType == SellerTypeEnum.agent) {
      selectedAgent = agentDistributorModel;
    } else {
      selectedDistributor = agentDistributorModel;
    }
    notifyListeners();
  }

  resetAdditionalInformation() {
    selectedCollaborator = null;
    selectedAgent = null;
    selectedDistributor = null;
    selectedSellerType = SellerTypeEnum.employee;
    agentDistributorsState = PageState();
    collaboratorsState = PageState();
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

  Future<InvoiceModel> curdInvoiceFiles({
    required Map<String, dynamic> body,
    required List<File> files,
    File? file,
    required String invoiceId,
    bool isDeleteFile = false,
    VoidCallback? onSucess,
    required Function(dynamic value) onFail,
  }) async {
    try {
      isLoadingCrudFiles = true;
      notifyListeners();

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.postRequestWithFile(
        url: "${EndPoints.invoice.crudFileInvoice}${invoiceId}",
        data: body,
        isDeleteFile: isDeleteFile,
        files: files,
        file: file,
      );

      final data = apiDataHandler(response);
      final invoice = InvoiceModel.fromJson(data);
      currentInvoice = invoice;

      int index = listinvoiceClient
          .indexWhere((element) => element.idInvoice == invoiceId);
      if (index != -1) listinvoiceClient[index] = currentInvoice!;

      index =
          listinvoices.indexWhere((element) => element.idInvoice == invoiceId);
      if (index != -1) listinvoices[index] = currentInvoice!;

      index = listInvoicesAccept
          .indexWhere((element) => element.idInvoice == invoiceId);
      if (index != -1) listInvoicesAccept[index] = currentInvoice!;

      isLoadingCrudFiles = false;
      notifyListeners();

      onSucess?.call();
      return invoice;
    } on BaseAppException catch (e) {
      debugPrint('error in crudFilesInvoice => ' + e.message);
      currentInvoice = await Invoice_Service().getInvoiceByIdInvoice(invoiceId);
      isLoadingCrudFiles = false;
      notifyListeners();
      onFail.call(e.message);
      rethrow;
    } catch (e) {
      debugPrint("error in crudFilesInvoice => $e");
      rethrow;
    }
  }

  void clearProducts() {
    addedProductsInvoice = [];
    deleteProductsInvoice = [];
    editProductsInvoiceRemote = [];
  }
}
