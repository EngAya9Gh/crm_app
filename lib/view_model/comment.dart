


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../constants.dart';

class comment_vm extends ChangeNotifier{
List<CommentModel> listComments=[];
bool isloadadd=false;
  Future<void> getComment(String fk_client)async {
    listComments=[];
    //isloadadd=true;
    notifyListeners();
   // if(listComments.isEmpty){
      List<dynamic> data=[];
      data= await Api()
          .get(url:url+ 'care/viewcomment.php?fk_client=$fk_client');
      print(data);
      if(data !=null) {
        for (int i = 0; i < data.length; i++) {
          listComments.add(CommentModel.fromJson(data[i]));
        }

    }
    //isloadadd=false;
    notifyListeners();
  }
  Future<String> addComment_vm(Map<String, dynamic?> body,String? imageurl) async {
    isloadadd=true;
    final DateFormat formatter = DateFormat('yyyy-MM-dd h-m-s');
    notifyListeners();
    String res = await Api().post(
        url: url+'care/addcomment.php',
        body: body);
    if (res!="error") {
      body.addAll({
        'id_comment':res,
        'date_comment':DateTime.now().toString(),//formatter.format(DateTime.now())
      });
      //listComments=[];
      listComments.insert(0,CommentModel.fromJson(body));
      final index=listComments.indexWhere((element) => element.idComment==res);
      listComments[index].imgImage=imageurl.toString();
      isloadadd=false;
      notifyListeners();
    }
    return res;
  }
}