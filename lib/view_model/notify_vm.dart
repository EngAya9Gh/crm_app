import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/notificationModel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class notifyvm extends ChangeNotifier {
  List<NotificationModel> listnotify=[];
  int countnotify=0;

  void setcount(int val){
    countnotify=val;
    notifyListeners();
  }
  void addcounter(){
    countnotify++;
    notifyListeners();
  }
  void getcounter()async{
    //
   await getNotification();
    countnotify=0;
    print('get counter');
    listnotify.forEach((element) {
     if(element.isread=="0")
      countnotify++;
    });
    notifyListeners();
  }
  void clearcounter(){
    countnotify=0;
    notifyListeners();
  }
  UserModel? usercurrent;
  void setvalue(user){
    usercurrent=user;
    notifyListeners();
  }

  Future<void> getNotification() async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+ 'notification/getnotifybyIdUser.php?to_user=${usercurrent!.idUser}');
    List<NotificationModel> list=[];
    for (int i = 0; i < data.length; i++) {
      list.add(NotificationModel.fromJson(data[i]));
      print(data[i]);
    }
    listnotify=list;
    print(listnotify.length);
    notifyListeners();
  }
  Future<String> setRead_notify_vm() async {
    print('in setRead_notify_vm ');
    String res="";
    bool b=false;
    listnotify.forEach((element) {
      if(element.isread=="0"){
        print("element foreach");
        print(element.isread);
        //element.isread = "1";
        b=true;//set read
         }
    });
    if(b){
      print('inside if setRead_notify_vm ');
      res = await Api().post(
        body: {
    },url: url+'notification/set_read_notify.php?to_user=${usercurrent!.idUser}');
    if (res=="done") {
      Map<String,dynamic> body={
        '':''
      };
      for(int i=0; i<listnotify.length;i++){
        if(listnotify[i].isread=="0"){
        body= {
          'id_notify': listnotify[i].idNotify.toString(),
          'message' : listnotify[i].message,
          'from_user':listnotify[i].fromUser,
          'to_user' :listnotify[i].toUser,
          'type_notify': listnotify[i].typeNotify,
          'isread' : "1",
          'tonameuser' : listnotify[i].tonameuser,
          'fromNameuser' : listnotify[i].fromNameuser,
          'data': listnotify[i].data,
          "dateNotify":listnotify[i].dateNotify
        };
        listnotify[i]=NotificationModel.fromJson(body);
      }
      }
      clearcounter();

    }
    }
      // body.addAll({
      //   'isApprove':listClientbyCurrentUser[index].isApprove,
      //   'iduser_approve':listClientbyCurrentUser[index].iduser_approve,
      // });
     // listClientbyCurrentUser[index]=ClientModel.fromJson(body);
      //listProduct.insert(0, ProductModel.fromJson(body));
      notifyListeners();

    return res;

  }
  Future<String> addNotification( Map<String,dynamic?> body) async {

      String result = await Api()
          .post( url:url+"notification/insertNotification.php",
          body: body);
      print(result);
      if (result!="error") {
        body.addAll({
          'id_notify': result,
        });
        //
        // listnotify.insert(0, NotificationModel.fromJson(body));
        // notifyListeners();
      }
        return result !="error"? result:"false";
  }

}