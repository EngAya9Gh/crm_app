


import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class privilge_vm extends ChangeNotifier{

List<PrivilgeModel> privilgelist=[];
List<PrivilgeModel> privilgelistpage=[];
UserModel? usercurrent;
 
void setvalue(user){
  print('in set usercurrent in privilge vm');
  usercurrent=user;
  notifyListeners();
}

Future< List<PrivilgeModel> > getPrivilge(String level) async {
  List<dynamic> data =[];
  data=await Api()
      .get(url:url+
      'privilge/privGet.php?fk_level=$level');
  List<PrivilgeModel> list=[];
  for (int i = 0; i < data.length; i++) {
    list.add(PrivilgeModel.fromJson(data[i]));
    print(data[i]);
  }
  privilgelist=list;

  notifyListeners();
return list;
}Future< List<PrivilgeModel> > getPrivilgepage(String level) async {
  List<dynamic> data =[];
  data=await Api()
      .get(url:url+
      'privilge/privGet.php?fk_level=$level');
  List<PrivilgeModel> list=[];
  for (int i = 0; i < data.length; i++) {
    list.add(PrivilgeModel.fromJson(data[i]));
    print(data[i]);
  }
  privilgelistpage=list;

  notifyListeners();
return list;
}


Future<String> updatepriv_vm(
    String? fk_privileg,String is_check) async {
  String res = await Api( ).post(
      url: url+'privilge/privUpdate.php?id_privg_user=$fk_privileg',
      body: {'is_check':is_check});
  //if (res) {
    int index=privilgelistpage.indexWhere((element)
    => element.isCheck==is_check);
    // body.addAll({
    //
    // });
    //privilgelist[index]=PrivilgeModel.fromJson(body);
    //listProduct.insert(0, ProductModel.fromJson(body));
    notifyListeners();
  //}
  return res;
}

   Future<void> getprivlg_usercurrent() async{
   privilgelist=await  getPrivilge(usercurrent!.typeLevel.toString());
   notifyListeners();
}

 bool checkprivlge(String id_privilge)  {
   if(privilgelist.isNotEmpty) {
     bool res = privilgelist
         .firstWhere(
             (element) => element.fkPrivileg == id_privilge)
         .isCheck == '1' ? true : false;
     return res;
   }
   //notifyListeners();
   return false;
}


}
