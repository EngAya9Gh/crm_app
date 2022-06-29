import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/user_vm.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
class UserBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(AllUserVMController());
    //Get.lazyPut(()=>AllUserVMController());
    Get.put(UserVMController());
  }
}