import 'dart:async';

import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import '../core/common/enums/client/client_source_enum.dart';
import '../core/common/enums/users/user_type_enum.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../model/usermodel.dart';
import '../services/UserService.dart';

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

  String? _selectedClientRegistrationType = '';
  ClientSourceEnum? _selectedSourceClient = null;
  ClientSourceEnum? _filterSourceClient = null;
  String? _selectedClientClassificationType = '';

  String get selectedClientRegistrationType => _selectedClientRegistrationType!;

  ClientSourceEnum? get selectedSourceClient => _selectedSourceClient;

  ClientSourceEnum? get filterSourceClient => _filterSourceClient;

  String get selectedClientClassificationType =>
      _selectedClientClassificationType!;

  void changeClientRegistrationTypeStatus(
    String? selectedClientRegistrationType,
  ) {
    _selectedClientRegistrationType = selectedClientRegistrationType;
    notifyListeners();
  }

  set selectedSourceClient(ClientSourceEnum? selectedSourceClient) {
    _selectedSourceClient = selectedSourceClient;
    notifyListeners();
  }

  set filterSourceClient(ClientSourceEnum? filterSourceClient) {
    _filterSourceClient = filterSourceClient;
    notifyListeners();
  }

  void changeClientClassificationTypeStatus(
      String? selectedClientClassificationType) {
    _selectedClientClassificationType = selectedClientClassificationType;
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

  void changeValUserID(String? val, [bool? isInit]) {
    if (val == null || val == "null") {
      selectedValueUser = null;
    } else {
      selectedValueUser = val;
    }
    changevalueuser(
      allUsers.firstWhere((element) => element.idUser == val),
      isInit ?? false,
    );
    if (isInit == true) {
      return;
    }
    notifyListeners();
  }

  UserModel _currentUser = UserModel(
    nameUser: "user test",
    fkCountry: "1",
    fkRegoin: "1",
    idUser: "-1",
    email: "user.test@gmail.com",
    nameuserAdd: '',
    created_at: '',
    nameuserupdate: '',
    fkuserupdate: '',
    updated_at: '',
    isActive: '1',
    path: '',
    fkuserAdd: '',
  );

  UserModel get currentUser => _currentUser;

  set currentUser(UserModel user) {
    _currentUser = user;
    notifyListeners();
  }

  Future<void> getAllUsers() async {
    isLoading = true;
    notifyListeners();
    await getUsersVm();
    isLoading = false;
    listFilteredUser = List.from(allUsers);
    notifyListeners();
  }

  void setImagePath(String path) {
    currentUser.path = path;
    notifyListeners();
  }

  Future<void> updateUserVm({
    required Map<String, dynamic> body,
    String? iduser,
    List<UserRegion> mainCityList = const [],
    String params = '',
  }) async {
    isUpdate = true;
    notifyListeners();
    int index = allUsers.indexWhere((element) => element.idUser == iduser);
    UserModel ustemp = await UserService()
        .UpdateUser(body: body, idUser: iduser, params: params);
    ustemp.maincitylist_user = mainCityList;
    allUsers[index] = ustemp;
    updateUserList(ustemp);
    await getCurrentUser();
    allUsers[index].path = "";
    listFilteredUser = List.from(allUsers);
    isUpdate = false;
    notifyListeners();
  }

  Future<void> updateProfileImage({
    String? iduser,
    XFile? file,
  }) async {
    isUpdate = true;
    notifyListeners();
    int index = allUsers.indexWhere((element) => element.idUser == iduser);
    UserModel ustemp = await UserService().UpdateProfileImage(
      file: file,
      params: {'id_user': iduser},
    );
    allUsers[index] = ustemp;
    updateUserList(ustemp);
    await getCurrentUser();
    allUsers[index].path = "";
    listFilteredUser = List.from(allUsers);
    isUpdate = false;
    notifyListeners();
  }

  Future<void> getCurrentUser() async {
    try {
      ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.users.getCurrentUser,
      );
      final data = apiDataHandler(response);
      if (data == null) return null;

      currentUser = UserModel.fromJson(data);
      debugPrint('currentUser Id => ${currentUser.idUser}');
      AppConstants.currentUser = currentUser;

      getIt<PrivilegesCubit>()
          .setUserPrivileges(privilegeList: currentUser.privilegesList);

      notifyListeners();
    } on BaseAppException catch (e) {
      debugPrint('Error in getCurrentUser: $e');
      throw e.message;
    } catch (e) {
      debugPrint('Error in getCurrentUser: $e');
      throw e.toString();
    }
  }

  bool isDeletingAccount = false;

  deleteAccount(
      {required VoidCallback onDeleteSucceed,
      VoidCallback? onDeleteFailed}) async {
    SharedPreferences preferences = getIt<SharedPreferences>();
    String? userId = preferences.getString('id_user');

    if (userId?.isEmpty ?? true) {
      return;
    }
    isDeletingAccount = true;
    notifyListeners();
    try {
      await Api().post(
        url: EndPoints.baseUrls.url + "users/delete_user.php?id_user=$userId",
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

  Future<void> getUsersVm() async {
    if (allUsers.isNotEmpty) {
      return;
    }

    allUsers = await UserService().usersServices();

    final List<UserModel> activeUsers = List<UserModel>.of(allUsers)
        .where((element) => element.isActive == '1')
        .toList();

    usersHigherManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.HigherManagement.type.toString())
        .toList();
    usersSalesManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.SalesManagement.type.toString())
        .toList();
    _addNoneChoiceForUserSales();
    usersSupportManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.SupportManagement.type.toString())
        .toList();
    usersCareManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.CareManagement.type.toString())
        .toList();
    usersFinanceManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.FinanceManagement.type.toString())
        .toList();
    usersAchievementManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.AchievementManagement.type.toString())
        .toList();
    usersProcessesManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.ProcessesManagement.type.toString())
        .toList();
    usersProgrammingManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.ProgrammingManagement.type.toString())
        .toList();
    usersMarketingManagement = List.of(activeUsers)
        .where((element) =>
            element.typeAdministration ==
            UserTypeEnum.MarketingManagement.type.toString())
        .toList();
    usersMarketingManagement.addAll(usersSalesManagement);
  }

  void updateUserList(UserModel user) {
    if (user.typeAdministration ==
        UserTypeEnum.HigherManagement.type.toString()) {
      usersHigherManagement = usersHigherManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.SalesManagement.type.toString()) {
      usersSalesManagement = usersSalesManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.SupportManagement.type.toString()) {
      usersSupportManagement = usersSupportManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.CareManagement.type.toString()) {
      usersCareManagement = usersCareManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.FinanceManagement.type.toString()) {
      usersFinanceManagement = usersFinanceManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.AchievementManagement.type.toString()) {
      usersAchievementManagement = usersAchievementManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.ProcessesManagement.type.toString()) {
      usersProcessesManagement = usersProcessesManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.ProgrammingManagement.type.toString()) {
      usersProgrammingManagement = usersProgrammingManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    } else if (user.typeAdministration ==
        UserTypeEnum.MarketingManagement.type.toString()) {
      usersMarketingManagement = usersMarketingManagement
          .map((e) => e.idUser == user.idUser ? user : e)
          .toList();
    }
  }

  void _addNoneChoiceForUserSales() {
    UserModel noneUser = UserModel(
      nameUser: "لا يوجد",
      fkCountry: "1",
      idUser: "0",
    );
    usersSalesManagement.insert(0, noneUser);
  }
}
