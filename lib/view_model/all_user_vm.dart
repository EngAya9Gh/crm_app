import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllUserVMController extends GetxController {
  var usersList = <UserModel>[].obs;
  var isLoading = true.obs;

  //var currentUser=UserModel(created_at: '').obs;

  @override
  void onInit() {
    super.onInit();
    getUsers();
  }

  @override
  void onReady() {
    //getUsers();
    //getcurrentUser();
  }

  Future<void> getcurrentUser() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String? id = preferences.getString('id_user');

      final index = usersList.indexWhere((element) => element.idUser == "1");

      // currentUser.value = usersList[index].obs.value;
    } catch (e) {}
  }

  void getUsers() async {
    try {
      var users = await UserService().usersServices();

      isLoading(true);
      if (users.isNotEmpty) {
        usersList.addAll(users);
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }
}
