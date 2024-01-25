import 'dart:io';

import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';

// import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

class UserProvider extends ChangeNotifier {
  List<UserModel> allUsers = [];
  List<UserModel> listFilteredUser = [];
  var isLoading = true;
  bool isUpdate = false;
  UserModel? selectedUser;

  List<UserModel> usersHigherManagement = [];
  List<UserModel> usersSalesManagement = [];
  List<UserModel> usersSupportManagement = [];
  List<UserModel> usersCareManagement = [];
  List<UserModel> usersFinanceManagement = [];
  List<UserModel> usersAchievementManagement = [];
  List<UserModel> usersProcessesManagement = [];
  List<UserModel> usersProgrammingManagement = [];
  List<UserModel> usersMarketingManagement = [];

  String? _selectedClientRegistrationType='';
  String? _selectedClientClassificationType='';
  String get selectedClientRegistrationType=>_selectedClientRegistrationType!;
  String get selectedClientClassificationType=>_selectedClientClassificationType!;

  void changeClientRegistrationTypeStatus( String? selectedClientRegistrationType){
    _selectedClientRegistrationType=selectedClientRegistrationType;
    notifyListeners();
  }
  void changeClientClassificationTypeStatus( String selectedClientClassificationType){
    _selectedClientClassificationType=selectedClientClassificationType;
    notifyListeners();
  }
  void changevalueuser(UserModel? s, [bool isInit = false]) {
    selectedUser = s;
    if (isInit) {
      return;
    }
    notifyListeners();
  }

  late String? selectedValueUser = null;

  void changeValUserID(String? val) {
    if (val == null || val == "null") {
      selectedValueUser = null;
    } else {
      selectedValueUser = val;
    }
    changevalueuser(allUsers.firstWhere((element) => element.idUser == val));
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
      path: '',
      fkuserAdd: '');

  Future<void> getUsersVm() async {
    isLoading = true;
    notifyListeners();
    await _getUsersVm();
    isLoading = false;
    listFilteredUser = List.from(allUsers);
    notifyListeners();
  }

  void setImagePath(String path) {
    currentUser.path = path;
    notifyListeners();
  }

  Future<void> updateUserVm(Map<String, dynamic> body, String? iduser, File? file,
      [List<UserRegion> mainCityList = const [], String params = '']) async {
    isUpdate = true;
    notifyListeners();
    int index = allUsers.indexWhere((element) => element.idUser == iduser);
    UserModel ustemp = await UserService().UpdateUser(body: body, idUser: iduser, file: file, params: params);
    ustemp.maincitylist_user = mainCityList;
    allUsers[index] = ustemp;
    updateUserList(ustemp);
    getcurrentuser();
    allUsers[index].path = "";
    listFilteredUser = List.from(allUsers);
    isUpdate = false;
    notifyListeners();
  }

  Future<String> addUserVm(Map<String, String?> body, String params, List<UserRegion> mainCityList) async {
    try {
      UserModel us = await UserService().addUser(body, params);
      String result = '';
      if (us.idUser == '0') {
        result = 'repeat';
      } else {
        us.maincitylist_user = mainCityList;
        allUsers.insert(0, us);
        addUserList(us);
        listFilteredUser.insert(0, us);
        notifyListeners();
        result = 'done';
      }
      return result;
    } catch (e) {
      return "repeat";
    }
  }

  Future<void> searchProducts(String productName) async {
    listFilteredUser = [];
    String searchKey = productName;
    if (productName.isNotEmpty) {
      if (allUsers.isNotEmpty) {
        allUsers.forEach((element) {
          if (element.nameUser!.toLowerCase().contains(searchKey.toLowerCase(), 0)
              // || element.mobile!.contains(searchKey,0)
              ) listFilteredUser.add(element);
        });
      }
    } else {
      listFilteredUser = List.from(allUsers);
    }
    notifyListeners();
  }

  bool getFilterUser(String filter) {
    UserModel? user;
    allUsers.map((e) {
      e.nameUser!.contains(filter);
      return true;
    });
    return false;
  }

  Future<SharedPreferences> getcurrentuser() async {
    prefs = await SharedPreferences.getInstance();
    try {
      await _getUsersVm();
      String? id = prefs.getString('id_user');
      print(id.toString());
      if (id != null) {
        final index =   allUsers.indexWhere((element) => element.idUser == id && element.isActive == '1');
        if (index >= 0) {
          currentUser = allUsers[index];
          final response = await GetIt.I<PrivilegeCubit>().getUserPrivileges(currentUser.typeLevel.toString());
          if(!response){
            prefs.setString("id_user1", '0');
            return prefs;
          }
          currentUser.path = "";
          notifyListeners();
          prefs.setString("id_user1", '-1');
          return prefs;
        } else {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("id_user1", '0');
          return preferences;
        }
      } else {
        return prefs;
      }
    } catch (e) {}
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
      isDeletingAccount = false;
      notifyListeners();
      onDeleteFailed?.call();
    }
  }

  Future<void> _getUsersVm() async {
    if (allUsers.isNotEmpty) {
      return;
    }

    allUsers = await UserService().usersServices();

    final List<UserModel> activeUsers =
        List<UserModel>.of(allUsers).where((element) => element.isActive == '1').toList();

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
    usersMarketingManagement.addAll(usersSalesManagement);
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
