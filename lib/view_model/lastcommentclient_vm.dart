import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../core/utils/end_points.dart';
import '../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../model/lastCommentClientModel.dart';
import '../model/usermodel.dart';

class lastcommentclient_vm extends ChangeNotifier {
  List<LastcommentClientModel> list_LastcommentClientModel = [];
  List<LastcommentClientModel> list_LastcommentClientModel_temp = [];
  bool isload = false;
  String order = 'ASC';
  UserModel? usercurrent;
  String param = '';

  void setvalue(user) {
    usercurrent = user;
    notifyListeners();
  }

  void setvaluepriv(PrivilegeCubit privilegeCubit, bool ismarketing) {
    param = get_privilgelist(ismarketing, privilegeCubit);

    notifyListeners();
  }

  String get_privilgelist(bool ismarketing, PrivilegeCubit privilegeCubit) {
    // if(listClient.isEmpty)
    //main list
    String param = '';
    bool res = privilegeCubit.checkPrivilege('155');
    if (res)
      param =
          'fk_country=' + usercurrent!.fkCountry.toString() + '&ismarketing=1';
    else {
      res = privilegeCubit.checkPrivilege('138');
      if (res) {
        param = 'fk_country=' + usercurrent!.fkCountry.toString();
      } else {
        res = privilegeCubit.checkPrivilege('139');
        if (res) {
          param = 'fk_regoin=' + usercurrent!.fkRegoin.toString();
        } else {
          res = privilegeCubit.checkPrivilege('140');
          if (res) {
            param = 'fk_user=' + usercurrent!.idUser.toString();
          }
        }
      }
      if (ismarketing) param = param + '&ismarketing=1';
    }
    return param;
  }

  Future<void> getLastcommentClientModel() async {
    isload = true;
    notifyListeners();

    final response = await Api().get(
        url: EndPoints.baseUrls.url + 'reports/get_lastcomment.php?$param');

    var list = List<LastcommentClientModel>.from(
        (response ?? []).map((x) => LastcommentClientModel.fromJson(x)))
      ..sort(
        (a, b) => (num.tryParse(b.hoursLastComment ?? '0') ?? 0)
            .compareTo(int.tryParse(a.hoursLastComment ?? '0') ?? 0),
      );
    if (order != 'ASC') list = list.reversed.toList();
    final noCommentList = <LastcommentClientModel>[];
    list.removeWhere((element) {
      final isNoComment = num.parse(element.hoursLastComment.toString()) < 0;
      if (isNoComment) {
        noCommentList.add(element);
      }

      return isNoComment;
    });

    list.insertAll(0, noCommentList);

    list_LastcommentClientModel = List.from(list);
    list_LastcommentClientModel_temp = List.from(list);
    isload = false;

    if (order == 'ASC')
      order = 'desc';
    else
      order = 'ASC';
    notifyListeners();
  }

  Future<void> getData(String filterType, String? idUser) async {
    isload = true;
    notifyListeners();
    List<LastcommentClientModel> list_temp = [];

    list_LastcommentClientModel = List.from(list_LastcommentClientModel_temp);

    if (idUser == '')
      list_LastcommentClientModel.forEach((element) {
        if (element.client_obj.typeClient == filterType) {
          list_temp.add(element);
        }
      });
    else
      list_LastcommentClientModel.forEach((element) {
        if (element.client_obj.typeClient == filterType &&
            element.client_obj.fkUser == idUser) {
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
