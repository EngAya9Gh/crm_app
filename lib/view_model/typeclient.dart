import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/common/enums/client/type_client_enum.dart';
import '../core/common/models/client_model.dart';
import '../core/utils/end_points.dart';
import '../model/reasonmodel.dart';
import '../services/configService.dart';

class ClientTypeProvider extends ChangeNotifier {
  List<String> type_of_client = [];
  List<String> type_record_client = ['صحيح', 'خاطئ'];
  List<String> type_of_install_iso = [
    'الكل',
    'تم التأكد من الجودة',
    'انتظار الجودة'
  ];

  List<String> get typeOfClientFilter {
    return TypeClientEnum.values.map((e) => e.value).toList();
  }

  List<String> typeOfLinks = [
    'فيديوهات تعريفية',
    'ملفات تعريفية',
    'مواقع جغرافية',
    'مواقع ويب',
    'روابط الأنظمة',
    'صفحات سوشيال ميديا',
    'أرقام تواصل'
  ];

  // List<String> type_of_client=['تفاوض','عرض سعر','مستبعد','منسحب'];
  List<ReasonModel> type_of_out = []; //أسباب الانسحاب
  List<String> listtype_install = ['الكل', 'بالإنتظار', 'تم التركيب', 'معلق'];
  List<String> listtype_care = ['تم التواصل', 'بالإنتظار'];
  late String? selectedValuemanag = null;

  void changevalue(String? s) {
    selectedValuemanag = s;
    notifyListeners();
  }

  late String? selectedValufilter = null;

  void changevaluefilter(String? s) {
    selectedValufilter = s;
    notifyListeners();
  } //listtype_install

  late String? selectedlisttype_install = null;

  void changelisttype_install(String? s) {
    selectedlisttype_install = s;
    notifyListeners();
  }

  ///////////////////////////////////////////////

  late String? selectedValueOut = null;

  void changevalueOut(String s) {
    selectedValueOut = s;
    notifyListeners();
  }

  //
  Future<void> getreasons(String type) async {
    selectedValueOut = null;
    notifyListeners();
    //if(type_of_out.isEmpty)
    type_of_out = await config_service().getreason(type);
    notifyListeners();
  }

  bool isloading = false;

  Future<String> addReson_vm(Map<String, dynamic> body) async {
    isloading = true;
    notifyListeners();
    String res = await Api().post(
        url: EndPoints.baseUrls.url +
            'config/addreson.php', //users/addmangemt.php
        body: body);
    if (res != "error") {
      body.addAll({
        'id_reason': res,
      });
      type_of_out.insert(0, ReasonModel.fromJson(body));
      isloading = false;
      notifyListeners();
    }
    return res;
  }

  Future<String> update_resoan(
      Map<String, dynamic> body, String idmanag) async {
    //name_mange
    isloading = true;
    notifyListeners();
    String res = await Api().post(
        url: EndPoints.baseUrls.url +
            'users/update_resoan.php?id_reason=${idmanag}',
        //users/addmangemt.php
        body: body);
    body.addAll({
      'id_reason': idmanag,
    });
    final index =
        type_of_out.indexWhere((element) => element.idReason == idmanag);
    type_of_out[index] = ReasonModel.fromJson(body);
    isloading = false;
    notifyListeners();

    return res;
  }

  void prepareSelectedManage(ClientModel? client) {
    bool isFullList() {
      return client?.typeClient == TypeClientEnum.negotiation.value ||
          client?.typeClient == TypeClientEnum.offer.value ||
          client?.typeClient == TypeClientEnum.suspendedExclusion.value ||
          client?.typeClient == TypeClientEnum.excluded.value;
    }

    bool isSubscriber() {
      return client?.typeClient == TypeClientEnum.subscriber.value;
    }

    if (isFullList()) {
      selectedValuemanag = client?.typeClient.toString();
    } else if (isSubscriber()) {
      selectedValuemanag = null;
    }

    changevalue(selectedValuemanag);
  }

  List<String> prepareTypesList(ClientModel? client) {
    bool isFullList() {
      return client?.typeClient == TypeClientEnum.negotiation.value ||
          client?.typeClient == TypeClientEnum.offer.value;
    }

    bool isSuspendedExclusion() {
      return client?.typeClient == TypeClientEnum.suspendedExclusion.value;
    }

    if (isFullList()) {
      return type_of_client = [
        TypeClientEnum.negotiation.value,
        TypeClientEnum.offer.value,
        TypeClientEnum.excluded.value,
      ];
    } else if (isSuspendedExclusion()) {
      return type_of_client = [
        TypeClientEnum.suspendedExclusion.value,
      ];
    } else {
      return type_of_client = [
        TypeClientEnum.excluded.value,
      ];
    }
  }
//update_resoan
}
