import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/ActivityModel.dart';
import '../model/lastCommentClientModel.dart';
import '../services/configService.dart';

class lastcommentclient_vm extends ChangeNotifier {
  List<LastcommentClientModel> list_LastcommentClientModel = [];
  List<LastcommentClientModel> list_LastcommentClientModel_temp = [];
  bool isload = false;

  Future<void> getLastcommentClientModel() async {
    isload = true;
    notifyListeners();
    final response = await Api().get(url: url + 'reports/get_lastcomment.php');
    final list = List<LastcommentClientModel>.from((response ?? []).map((x) => LastcommentClientModel.fromJson(x)))
      ..sort(
        (a, b) =>
            (num.tryParse(b.hoursLastComment ?? '0') ?? 0).compareTo(int.tryParse(a.hoursLastComment ?? '0') ?? 0),
      );
    final noCommentList = <LastcommentClientModel>[];
    list.removeWhere((element) {
      final isNoComment = num.parse(element.hoursLastComment.toString()) < 0;
      if(isNoComment){
        noCommentList.add(element);
      }

      return isNoComment;
    });

    list.insertAll(0, noCommentList);

    list_LastcommentClientModel = List.from(list);
    list_LastcommentClientModel_temp = List.from(list);
    isload = false;
    notifyListeners();
  }

  Future<void> getData(String filterType, String? idUser) async {
    isload = true;
    notifyListeners();
    List<LastcommentClientModel> list_temp = [];

    list_LastcommentClientModel = List.from(list_LastcommentClientModel_temp);

    print('idUser' + idUser.toString());
    if (idUser == '')
      list_LastcommentClientModel.forEach((element) {
        print(element.client_obj.typeClient.toString());
        if (element.client_obj.typeClient == filterType) {
          list_temp.add(element);
        }
      });
    else
      list_LastcommentClientModel.forEach((element) {
        print(element.client_obj.typeClient.toString());
        if (element.client_obj.typeClient == filterType && element.client_obj.fkUser == idUser) {
          list_temp.add(element);
        }
      });
    list_LastcommentClientModel = List.from(list_temp);
    isload = false;
    notifyListeners();
  }

  onSearch(String? query) {
    if (query?.trim().isEmpty ?? true) {
      list_LastcommentClientModel = list_LastcommentClientModel_temp;
      notifyListeners();
      return;
    }

    list_LastcommentClientModel = list_LastcommentClientModel_temp
        .where((element) =>
            (element.client_obj.nameClient?.contains(query!) ?? false) ||
            (element.client_obj.nameEnterprise?.contains(query!) ?? false) ||
            (element.client_obj.name_regoin?.contains(query!) ?? false) ||
            (element.client_obj.nameCountry?.contains(query!) ?? false) ||
            (element.client_obj.mobile?.contains(query!) ?? false) ||
            (element.client_obj.mobileuser?.contains(query!) ?? false) ||
            (element.client_obj.name_regoin?.contains(query!) ?? false) ||
            (element.client_obj.phone?.contains(query!) ?? false))
        .toList();

    notifyListeners();
  }
}
