

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'dart:io';
import '../constants.dart';

class UserService{

Future<UserModel> addUser(body , String params) async {
  var data = await Api().post(
    url:url+'users/addUser.php?$params',
    // body:body,
    //token: '',
  );
   if(data=='repeatuser'){
     UserModel usermodel=UserModel(
         // privilgelist: [],
       idUser: '0',
         isActive: '', fkuserAdd: '', created_at: '',
         nameuserAdd: '', updated_at: '', fkuserupdate: '', nameuserupdate: ''  );
    return UserModel.fromJson(usermodel);}
  return UserModel.fromJson(data[0]);//UserModel.fromJson(data);
}

Future<UserModel> UpdateUser({
  required String? idUser,
  required Map<String, dynamic> body,
  File? file,
  String params = ''
}) async {

var data = await Api().postRequestWithFile('array',
   url+'users/updateuser_patch.php?id_user=$idUser$params',
   body,
   file,null,
  );
  List<UserModel> usersList = [];

  for (int i = 0; i < data.length; i++) {
  usersList.add(UserModel.fromJson(data[i]));
  }
  // if(usersList.isNotEmpty)
  return usersList[0];
  // else
  //  return
  //      UserModel(created_at: '',isActive: '0',
  //      fkuserAdd: '', nameuserAdd: '',idUser: '0');

}

Future<List<UserModel>> usersServices() async {
  List<dynamic> data = await Api().get(url: url+'users/getUser.php');
  List<UserModel> usersList = [];

  for (int i = 0; i < data.length; i++) {
    usersList.add(UserModel.fromJson(data[i]));
  }
  print('usersList');
  print(usersList);
  return usersList;
}

Future<UserModel> userByIdServices({required String idUser}) async {
  var data = await Api().get(url: url+'users/getuserByID.php?id_user=$idUser');

  return UserModel.fromJson(data);
}

Future<UserModel> userByUserNAmeServices({required String userName}) async {
  UserModel data =
  await Api().get(url: url+'users/getuserByName.php?txtsearch=$userName');

  return data;
}

}