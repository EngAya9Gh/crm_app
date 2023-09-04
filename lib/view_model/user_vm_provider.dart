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

enum UserType {
  HigherManagement,
  SalesManagement,
  SupportManagement,
  CareManagement,
  FinanceManagement,
  AchievementManagement,
  ProcessesManagement,
  ProgrammingManagement,
  MarketingManagement,
}

extension UserTypeExt on UserType {
  int get type {
    switch (this) {
      case UserType.HigherManagement:
        return 1;
      case UserType.SalesManagement:
        return 2;
      case UserType.SupportManagement:
        return 3;
      case UserType.CareManagement:
        return 4;
      case UserType.FinanceManagement:
        return 5;
      case UserType.AchievementManagement:
        return 6;
      case UserType.ProcessesManagement:
        return 7;
      case UserType.ProgrammingManagement:
        return 8;
      case UserType.MarketingManagement:
        return 9;
    }
  }
}

class user_vm_provider extends ChangeNotifier {
  List<UserModel> userall = [];
  List<UserModel> listuserfilter = [];
  var isLoading = true;
  bool isupdate = false;
  late UserModel? selecteduser = null;

  List<UserModel> usersHigherManagement = [];
  List<UserModel> usersSalesManagement = [];
  List<UserModel> usersSupportManagement = [];
  List<UserModel> usersCareManagement = [];
  List<UserModel> usersFinanceManagement = [];
  List<UserModel> usersAchievementManagement = [];
  List<UserModel> usersProcessesManagement = [];
  List<UserModel> usersProgrammingManagement = [];
  List<UserModel> usersMarketingManagement = [];

  void changevalueuser(UserModel? s, [bool isInit = false]) {
    selecteduser = s;
    if (isInit) {
      return;
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
      nameUser: "user test",
      fkCountry: "1",
      fkRegoin: "1",
      idUser: "1",
      email: "user.test@gmail.com",
      nameuserAdd: '',
      created_at: '',
      nameuserupdate: '',
      fkuserupdate: '',
      updated_at: '',
      isActive: '1',
      fkuserAdd: '');

  Future<void> getuser_vm() async {
    isLoading = true;
    notifyListeners();
    await getUsersVm();
    isLoading = false;
    listuserfilter = List.from(userall);
    notifyListeners();
  }

  void setpath(String path) {
    currentUser.path = path;
    notifyListeners();
  }

  Future<void> updateuser_vm(Map<String, dynamic> body, String? iduser, File? file,
      [List<UserRegion> mainCityList = const [], String params = '']) async {
    isupdate = true;
    notifyListeners();
    int index = userall.indexWhere((element) => element.idUser == iduser);
    UserModel ustemp = await UserService().UpdateUser(body: body, idUser: iduser, file: file, params: params);
    //if(ustemp.idUser!='0'){

    ustemp.maincitylist_user = mainCityList;
    userall[index] = ustemp;
    updateUserList(ustemp);
    getcurrentuser();
    userall[index].path = "";
    //}
    listuserfilter = List.from(userall);
    isupdate = false;
    notifyListeners();

    // return result;
  }

  Future<String> adduser_vm(Map<String, String?> body, String params, List<UserRegion> mainCityList) async {
    try {
      UserModel us = await UserService().addUser(body, params);
      String result = '';
      if (us.idUser == '0') {
        result = 'repeat';
      } else {
        us.maincitylist_user = mainCityList;
        userall.insert(0, us);
        addUserList(us);
        listuserfilter.insert(0, us);
        notifyListeners();
        result = 'done';
      }
      return result;
    } catch (e) {
      return "repeat";
    }
  }

  Future<void> searchProducts(String productName) async {
    listuserfilter = [];
    // code to convert the first character to uppercase
    String searchKey = productName; //
    print(productName);
    if (productName.isNotEmpty) {
      if (userall.isNotEmpty) {
        userall.forEach((element) {
          if (element.nameUser!.toLowerCase().contains(searchKey.toLowerCase(), 0)
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

      await getUsersVm();

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
        } else {
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

  Future<void> getUsersVm() async {
    if (userall.isNotEmpty) {
      return;
    }

    userall = await UserService().usersServices();

    final List<UserModel> activeUsers =
        List<UserModel>.of(userall).where((element) => element.isActive == '1').toList();

    usersHigherManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.HigherManagement.type.toString())
        .toList();
    usersSalesManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.SalesManagement.type.toString())
        .toList();
    usersSupportManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.SupportManagement.type.toString())
        .toList();
    usersCareManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.CareManagement.type.toString())
        .toList();
    usersFinanceManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.FinanceManagement.type.toString())
        .toList();
    usersAchievementManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.AchievementManagement.type.toString())
        .toList();
    usersProcessesManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.ProcessesManagement.type.toString())
        .toList();
    usersProgrammingManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.ProgrammingManagement.type.toString())
        .toList();
    usersMarketingManagement = List.of(activeUsers)
        .where((element) => element.typeAdministration == UserType.MarketingManagement.type.toString())
        .toList();
  }

  void updateUserList(UserModel user) {
    if (user.typeAdministration == UserType.HigherManagement.type.toString()) {
      usersHigherManagement = usersHigherManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.SalesManagement.type.toString()) {
      usersSalesManagement = usersSalesManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.SupportManagement.type.toString()) {
      usersSupportManagement = usersSupportManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.CareManagement.type.toString()) {
      usersCareManagement = usersCareManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.FinanceManagement.type.toString()) {
      usersFinanceManagement = usersFinanceManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.AchievementManagement.type.toString()) {
      usersAchievementManagement = usersAchievementManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.ProcessesManagement.type.toString()) {
      usersProcessesManagement = usersProcessesManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.ProgrammingManagement.type.toString()) {
      usersProgrammingManagement = usersProgrammingManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    } else if (user.typeAdministration == UserType.MarketingManagement.type.toString()) {
      usersMarketingManagement = usersMarketingManagement.map((e) => e.idUser == user.idUser ? user : e).toList();
    }
  }

  void addUserList(UserModel user) {
    if (user.typeAdministration == UserType.HigherManagement.type.toString()) {
      usersHigherManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.SalesManagement.type.toString()) {
      usersSalesManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.SupportManagement.type.toString()) {
      usersSupportManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.CareManagement.type.toString()) {
      usersCareManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.FinanceManagement.type.toString()) {
      usersFinanceManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.AchievementManagement.type.toString()) {
      usersAchievementManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.ProcessesManagement.type.toString()) {
      usersProcessesManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.ProgrammingManagement.type.toString()) {
      usersProgrammingManagement.insert(0, user);
    } else if (user.typeAdministration == UserType.MarketingManagement.type.toString()) {
      usersMarketingManagement.insert(0, user);
    }
  }
}
