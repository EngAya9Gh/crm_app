import 'package:flutter/cupertino.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:url_launcher/url_launcher.dart';

class UserVMController extends GetxController {
  var isProbicpicpathSet = false.obs;
  var profilepicpath = "".obs;

  void onPressPhone(String phone) async {
    await FlutterPhoneDirectCaller.callNumber(phone);
  }

  void onPressEmail(String path) {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: path,
      queryParameters: {
        'subject :': 'Here is Subject .....',
        'body :': 'Add body here .....',
      },
      // query: encodeQueryParameters(<String, String>{
      //   'subject': 'Example Subject & Symbols are allowed!'
      // }),
    );
    launch(emailLaunchUri.toString());
  }

  void setProfileImagePath(String path) {
    profilepicpath.value = path;
    isProbicpicpathSet.value = true;
  }
}