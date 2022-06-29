

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/managmodel.dart';
import 'package:flutter/cupertino.dart';

import '../constants.dart';

class manage_provider extends ChangeNotifier{
   List<ManageModel> listtext=[];
    // 'مشرف مبيعات',
    // 'موظف مبيعات',
    // 'إدارة عناية بالعملاء',
    // 'موظف دعم',
    // 'مدير دعم',
    // 'إدارة عليا',
    // 'الإدارة المالية',
    // 'ادارة التحصيل',
    // 'إدارة العمليات'];

   late String? selectedValuemanag=null;

   void changevalue(String s){
     selectedValuemanag=s;
     notifyListeners();
   }

   Future<void> getmanage()async {
     //listoflevel=[];
     if(listtext.isEmpty){
       List<dynamic> data=[];
       data= await Api()
           .get(url:url+ 'users/getmanagment.php');
       print(data);
       if(data !=null) {
         for (int i = 0; i < data.length; i++) {
           listtext.add(ManageModel.fromJson(data[i]));
         }}
       selectedValuemanag='1';
       notifyListeners();
       //return data;
     }
   }
   Future<String> addmanage_vm(Map<String, dynamic?> body) async {
     //name_mange
     String res = await Api().post(
         url: url+'users/addmangemt.php',//users/addmangemt.php
         body: body);
       if (res!="error") {
       body.addAll({
         'idmange':res,
       });
       //listoflevel=[];
       listtext.add(ManageModel.fromJson(body));
       notifyListeners();
     }
     return res;
   }
   Future<String> update_manage(Map<String, dynamic?> body,String idmanag) async {
     //name_mange
     String res = await Api().post(
         url: url+'users/update_manage.php?idmange=${idmanag}',//users/addmangemt.php
         body: body);
       body.addAll({
         'idmange':idmanag,

       });
       listtext.add(ManageModel.fromJson(body));
       notifyListeners();

     return res;
   }

}