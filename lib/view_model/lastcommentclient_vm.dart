

import 'package:flutter/cupertino.dart';

import '../api/api.dart';
import '../constants.dart';
import '../model/ActivityModel.dart';
import '../model/lastCommentClientModel.dart';
import '../services/configService.dart';

class lastcommentclient_vm extends ChangeNotifier {
  List<LastcommentClientModel> list_LastcommentClientModel=[];

  Future<void> getLastcommentClientModel( ) async {
    final response = await Api().get(url: url + 'reports/get_lastcomment.php');
    final list = List<LastcommentClientModel>.from(
        (response ?? []).map((x) => LastcommentClientModel.fromJson(x)));
    list_LastcommentClientModel=list;
    notifyListeners();
  }



}