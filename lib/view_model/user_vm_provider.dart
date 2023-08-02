import 'package:crm_smart/model/privilgemodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';

// import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

import '../api/api.dart';
import '../constants.dart';

class user_vm_provider extends ChangeNotifier {
  List<UserModel> userall = [];
  List<UserModel> listuserfilter = [];
  var isLoading = true;
  bool isupdate = false;
  late UserModel? selecteduser = null;

  void changevalueuser(UserModel? s , [bool isInit = false]) {
    selecteduser = s;
    if(isInit){
      return ;
    }
    notifyListeners();
  }

  late String? selectedValueUser = null;

  void changeValUserID(String? val) {
    print('inside regoin vm');
    print(val);
    if (val == null || val == "null") {
      selectedValueUser = null;
      print('regoin vm');
    } else {
      selectedValueUser = val;
      print('regoin in vm');
    }
    changevalueuser(userall.firstWhere((element) => element.idUser == val));
    notifyListeners();
  }

  late SharedPreferences prefs;

  late UserModel currentUser = UserModel(
      nameUser: "aya",
      fkCountry: "1",
      fkRegoin: "1",
      idUser: "1",
      email: "aya.ghoury@gmail.com",
      nameuserAdd: '',
      created_at: '',
      nameuserupdate: '',
      fkuserupdate: '',
      updated_at: '',
      isActive: '',
      fkuserAdd: '');

  Future<void> getuser_vm() async {
    isLoading = true;
    notifyListeners();
    if (userall.isEmpty) userall = await UserService().usersServices();
    isLoading = false;
    listuserfilter = List.from(userall);
    notifyListeners();
  }

  void setpath(String path) {
    currentUser.path = path;
    notifyListeners();
  }

  Future<void> updateuser_vm(Map<String, String?> body, String? iduser, File? file) async {
    isupdate = true;
    notifyListeners();
    int index = userall.indexWhere((element) => element.idUser == iduser);
    UserModel ustemp = await UserService().UpdateUser(body: body, idUser: iduser, file: file);
    //if(ustemp.idUser!='0'){
    userall[index] = ustemp;
    getcurrentuser();
    userall[index].path = "";
    //}
    listuserfilter = List.from(userall);
    isupdate = false;
    notifyListeners();

    // return result;
  }

  Future<String> adduser_vm(Map<String, String?> body) async {
    UserModel us = await UserService().addUser(body);
    String result = '';
    if (us.idUser == '0') {
      result = 'repeat';
    } else {
      userall.insert(0, us);
      listuserfilter.insert(0, us);
      notifyListeners();
      result = 'done';
    }
    return result;
  }

  Future<void> searchProducts(String productName) async {
    listuserfilter = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    print(productName);
    if (productName.isNotEmpty) {
      if (userall.isNotEmpty) {
        userall.forEach((element) {
          if (element.nameUser!.contains(searchKey, 0)
              // || element.mobile!.contains(searchKey,0)
              ) listuserfilter.add(element);
        });
      }
    } else {
      print('useeeeeeeeeeeeeeer');
      listuserfilter = List.from(userall);
    }
    notifyListeners();
  }

  bool getfilteruser(String filter) {
    UserModel? user;
    userall.map((e) {
      e.nameUser!.contains(filter);
      return true;
    });
    return false;
  }

  Future<bool> tryAutoLogin() async {
    // prefs=await SharedPreferences.getInstance();
    if (!prefs.containsKey('id_user')) {
      return false;
    }
    final extractedUserData = prefs.getString('id_user');
    notifyListeners();
    return true;
  }


  Future<SharedPreferences> getcurrentuser() async {
    prefs = await SharedPreferences.getInstance();
    try {
      print('user id neeeeeeeewwww  ');
      if (userall.isEmpty) userall = await UserService().usersServices();
      String? id = prefs.getString('id_user');
      print('user id sss  ');
      print(id);
      //print("in get user" + userall[0].nameUser.toString());
      if (id != null) {
        // currentUser=await UserService().userByIdServices(idUser: id.toString());

        final index = userall.indexWhere((element) => element.idUser == id && element.isActive == '1');
        if (index >= 0) {
        // if (currentUser.isActive=='1') {
          currentUser = userall[index];
          currentUser.path = "";
          notifyListeners();
          print("preferences");
          print(prefs.containsKey('id_user'));
          prefs.setString("id_user1", '-1');
          return prefs;
        }
        else {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          //preferences.setBool(kKeepMeLoggedIn, true);
          preferences.setString("id_user1", '0');
          return preferences;
        }
      } else {
        return prefs;
      }
    } catch (e) {
      print('exp error is ' + e.toString());
    }
    notifyListeners();
    return prefs;
  }

  bool isDeletingAccount = false;

  deleteAccount({required VoidCallback onDeleteSucceed, VoidCallback? onDeleteFailed}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userId = preferences.getString('id_user');

    if (userId?.isEmpty ?? true) {
      return;
    }
    isDeletingAccount = true;
    notifyListeners();
    try {
      var data = await Api().post(
        url: url + "users/delete_user.php?id_user=$userId",
        token: null,
        body: null,
      );

      await preferences.clear();
      isDeletingAccount = false;
      notifyListeners();
      onDeleteSucceed.call();
    } catch (e) {
      print("eeeeeeeeeeee $e");
      isDeletingAccount = false;
      notifyListeners();
      onDeleteFailed?.call();
    }
  }
}
