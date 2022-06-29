
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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

    //print(currentUser.value.nameUser);
  }
  @override
  void onReady(){
    //getUsers();
    //getcurrentUser();
  }
  Future<void> getcurrentUser() async {
try {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? id = preferences.getString('id_user');
  print("in get user" + usersList[0].nameUser.toString());

  final index = usersList.indexWhere((element) => element.idUser == "1");

  // currentUser.value = usersList[index].obs.value;
}
catch(e){print('exp error is '+e.toString());}
  }
  void getUsers() async {

    try {
      var users = await UserService().usersServices();
      print("in getAlluser getx");
      isLoading(true);
      if (users.isNotEmpty) {
        usersList.addAll(users);
      }
    } catch(e){print('exp error in get all user is '+e.toString());}
    finally {
      isLoading(false);
    }

  }
}