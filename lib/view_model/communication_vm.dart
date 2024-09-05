import 'package:collection/collection.dart';
import 'package:crm_smart/model/communication_withdrawal_reason_model.dart';
import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/communication_modle.dart';
import '../model/usermodel.dart';

class CommunicationVm extends ChangeNotifier {
  List<CommunicationModel> listCommunication = [];
  List<CommunicationModel> list_wrong_number = [];
  List<CommunicationModel> list_not_use = [];
  List<CommunicationModel> listCommunicationrepeat = [];
  List<CommunicationModel> listCommunicationInstall = [];
  List<CommunicationModel> listCommunicationWelcome = [];
  List<CommunicationModel> listCommunicationClient = [];

  List<CommunicationModel> listCommunicationFilterSearch = [];
  List<CommunicationModel> listCommunicationrepeatTemp = [];

  List<CommunicationWithdrawalReasonModel> withdrawalReasons = [];

  void onSearchClientsNotUsingSys(String query) {
    final list = List.of(list_not_use);

    listCommunicationFilterSearch = list.where((element) {
      return element.nameEnterprise
              .toLowerCase()
              .contains(query.toLowerCase()) ||
          (element.mobile?.toLowerCase().contains(query.toLowerCase()) ??
              false) ||
          (element.nameClient?.toLowerCase().contains(query.toLowerCase()) ??
              false);
    }).toList();

    notifyListeners();
  }

  UserModel? usercurrent;

  void setvalue(user) {
    usercurrent = user;
    // param=get_privilgelist();
    notifyListeners();
  }

  bool isloading = false;

  Map<String, List<CommunicationModel>> careClientState = Map();
  bool isLoadingCareClient = false;

  void getCommunicationclient(String fk_client, String idCommunication) async {
    try {
      listCommunicationClient = [];
      isLoadingCareClient = true;
      notifyListeners();

      List<dynamic> data = [];
      data = await Api().get(
          url: EndPoints.baseUrls.url +
              'care/getCommunicationClient.php?fk_client=$fk_client&id_communication=$idCommunication');

      print("data is => ${data}");
      if (data.length.toString().isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          listCommunicationClient.add(CommunicationModel.fromJson(data[i]));
        }
      }
      final listWelcome = listCommunicationClient
          .where((element) => element.typeCommuncation == "ترحيب")
          .toList();
      final listInstallation = listCommunicationClient
          .where((element) => element.typeCommuncation == "تركيب")
          .toList();
      final listRepeat = listCommunicationClient
          .where((element) => element.typeCommuncation == "دوري")
          .toList();

      CommunicationModel? communicationSelected = listWelcome.firstWhereOrNull(
          (element) => element.idCommunication == idCommunication);

      if (communicationSelected != null) {
        listWelcome.removeWhere((element) =>
            element.idCommunication == communicationSelected!.idCommunication);
        listWelcome.insert(0, communicationSelected);
      } else {
        communicationSelected = listInstallation.firstWhereOrNull(
            (element) => element.idCommunication == idCommunication);

        if (communicationSelected != null) {
          listInstallation.removeWhere((element) =>
              element.idCommunication ==
              communicationSelected!.idCommunication);
          listInstallation.insert(0, communicationSelected);
        } else {
          communicationSelected = listRepeat.firstWhereOrNull(
              (element) => element.idCommunication == idCommunication);
          if (communicationSelected != null) {
            listRepeat.removeWhere((element) =>
                element.idCommunication ==
                communicationSelected!.idCommunication);
            listRepeat.insert(0, communicationSelected);
          }
        }
      }
      careClientState['ترحيب'] = listWelcome;
      careClientState['تركيب'] = listInstallation;
      careClientState['دوري'] = listRepeat;

      careClientState.removeWhere((key, value) => value.isEmpty);

      isLoadingCareClient = false;
      notifyListeners();
    } on BaseAppException catch (e) {
      debugPrint("error in getCommunicationclient => ${e.message}");
      isLoadingCareClient = false;
      notifyListeners();
      throw e.message;
    } catch (e) {
      debugPrint("error in getCommunicationclient => $e");
      isLoadingCareClient = false;
      notifyListeners();
    }
  }

  void isloadval(bool val) {
    isload = val;
    notifyListeners();
  }

  Future<void> getCommunicationclientrepeat(String fk_client) async {
    listCommunicationClient = [];
    List<CommunicationModel> list = [];
    isloading = true;
    notifyListeners();
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'care/view_communcation.php?fk_client=${fk_client}');

    if (data.length.toString().isNotEmpty) {
      for (int i = 0; i < data.length; i++) {
        listCommunicationClient.add(CommunicationModel.fromJson(data[i]));
      }
      if (listCommunicationClient.isNotEmpty) {
        listCommunicationClient.forEach((element) {
          if (element.fkClient == fk_client &&
                  element.dateCommunication != null &&
                  element.typeCommuncation == 'دوري'
              //&&element.fkUser==null
              ) list.add(element);
        });
      }
      listCommunicationClient = List.from(list);
      isloading = false;
      notifyListeners();
    }
  }

  List<CommunicationModel> listCommunicationWelcome_temp = [];

  List<CommunicationModel> listCommunicationInstall_temp = [];
  List<CommunicationModel> listCommunicationInstall2_temp = [];

  bool isload = false;

  void setIsLoad(bool val) {
    isload = val;
    notifyListeners();
  }

  bool valuebutton = false;

  Future<void> updateCareCommunication({
    required Map<String, dynamic> body,
    required String id_communication,
    VoidCallback? onSuccess,
  }) async {
    try {
      setIsLoad(true);
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.post(
        endPoint: EndPoints.invoice.updateCommunication,
        queryParameters: {'id_communication': id_communication},
        data: body,
      );

      final result = apiDataHandler(response);

      if (listCommunicationrepeat.isNotEmpty) {
        int index = listCommunicationrepeat.indexWhere(
            (element) => element.idCommunication == id_communication);
        if (index != -1) {
          listCommunicationrepeat.removeAt(index);
        }
      }

      if (listCommunicationrepeatTemp.isNotEmpty) {
        int index = listCommunicationrepeatTemp.indexWhere(
            (element) => element.idCommunication == id_communication);
        if (index != -1) {
          listCommunicationrepeatTemp.removeAt(index);
        }
      }
      isload = false;
      final communication = CommunicationModel.fromJson(result);
      var list = careClientState['دوري'] ?? [];
      list = list
          .map((e) => communication.idCommunication == e.idCommunication
              ? communication
              : e)
          .toList();
      careClientState['دوري'] = list;
      notifyListeners();
      onSuccess?.call();
    } catch (e, s) {
      debugPrintStack(stackTrace: s);
      debugPrint("error in updateCareCommunication => $e");
      isload = false;
      notifyListeners();
    }
  }

  Future<void> getCommunicationWithdrawalReasons() async {
    try {
      final apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.care.getCommunicationWithdrawalReasons,
      );
      final data = apiDataHandler(response);
      withdrawalReasons = data.map<CommunicationWithdrawalReasonModel>((e) {
        return CommunicationWithdrawalReasonModel.fromJson(e);
      }).toList();
      notifyListeners();
    } on BaseAppException catch (e) {
      debugPrint("error in getCommunicationWithdrawalReasons => ${e.message}");
      throw e.message;
    } catch (e) {
      debugPrint("error in getCommunicationWithdrawalReasons => $e");
      throw e;
    }
  }

  Future<CommunicationModel?> addCommunication(
    Map<String, dynamic> body,
    String id_communication,
    int type, {
    VoidCallback? onSuccess,
  }) async {
    setIsLoad(true);
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.post(
        endPoint: EndPoints.invoice.updateCommunication,
        queryParameters: {'id_communication': id_communication},
        data: body,
      );

      final result = apiDataHandler(response);

      CommunicationModel data = CommunicationModel.fromJson(result);
      if (listCommunication.isNotEmpty) {
        int i = listCommunication.indexWhere(
            (element) => element.idCommunication == id_communication);
        if (i != -1) {
          listCommunication[i] = data;
        }
      }

      int index;
      String value = data.typeCommuncation.toString();
      switch (value) {
        case 'تركيب':
          if (type == 1) {
            if (listCommunicationInstall_temp.isNotEmpty) {
              index = listCommunicationInstall_temp.indexWhere(
                  (element) => element.idCommunication == id_communication);
              if (index != -1) listCommunicationInstall_temp[index] = data;
            }

            if (listCommunicationInstall.isNotEmpty) {
              index = listCommunicationInstall.indexWhere(
                  (element) => element.idCommunication == id_communication);
              if (index != -1) listCommunicationInstall.removeAt(index);
            }
          }
          if (type == 2) {
            if (listCommunicationInstall2_temp.isNotEmpty) {
              index = listCommunicationInstall2_temp.indexWhere(
                  (element) => element.idCommunication == id_communication);
              if (index != -1) listCommunicationInstall2_temp[index] = data;
            }

            if (listCommunicationInstall.isNotEmpty) {
              index = listCommunicationInstall.indexWhere(
                  (element) => element.idCommunication == id_communication);
              if (index != -1) listCommunicationInstall.removeAt(index);
            }
            // listCommunicationInstall[index]= data;
          }
          var list = careClientState['تركيب'] ?? [];
          list = list
              .map((e) => data.idCommunication == e.idCommunication ? data : e)
              .toList();
          careClientState['تركيب'] = list;
          break;
        case 'ترحيب':
          if (listCommunicationWelcome_temp.isNotEmpty) {
            index = listCommunicationWelcome_temp.indexWhere(
                (element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationWelcome_temp[index] = data;
          }

          if (listCommunicationWelcome.isNotEmpty) {
            index = listCommunicationWelcome.indexWhere(
                (element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationWelcome.removeAt(index);
          }

          var list = careClientState['ترحيب'] ?? [];
          list = list
              .map((e) => data.idCommunication == e.idCommunication ? data : e)
              .toList();
          careClientState['ترحيب'] = list;
          break;
        case 'دوري':
          getCommunicationclientrepeat(data.fkClient);
          if (listCommunicationrepeat.isNotEmpty) {
            index = listCommunicationrepeat.indexWhere(
                (element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationrepeat.removeAt(index);

            // listCommunicationrepeat[index] = data;
          }
          if (listCommunicationrepeatTemp.isNotEmpty) {
            index = listCommunicationrepeatTemp.indexWhere(
                (element) => element.idCommunication == id_communication);
            if (index != -1) listCommunicationrepeatTemp.removeAt(index);
          }

          var list = careClientState['دوري'] ?? [];
          list = list
              .map((e) => data.idCommunication == e.idCommunication ? data : e)
              .toList();
          careClientState['دوري'] = list;

          valuebutton = true;
          notifyListeners();
          break;
      }
      isload = false;
      notifyListeners();
      onSuccess?.call();
      return data;
    } on BaseAppException catch (e) {
      debugPrint("error in addCommunication => ${e.message}");
      isload = false;
      notifyListeners();
    } catch (e) {
      debugPrint("error in addCommunication => $e");
      isload = false;
      notifyListeners();
    }
    return null;
  }
}
