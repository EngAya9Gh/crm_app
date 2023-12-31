import 'package:crm_smart/model/commentmodel.dart';

import 'clientmodel.dart';

class LastcommentClientModel {
  LastcommentClientModel({
    required this.client_obj,
  });

  late ClientModel  client_obj;

  List<CommentModel>  allComment=[];
  String? dateCommentClient;
  String? hoursLastComment;

  LastcommentClientModel.fromJson(Map<String, dynamic> jsondata) {
    client_obj =   getproud(jsondata['client_obj']);//  jsondata['client_obj'].map((e) {ClientModel.fromJson(e); }).toList().first;//  ClientModel.fromJson(jsondata['client_obj']);
    allComment    = jsondata['allComment']==null?[]:getcomm(jsondata['allComment']);// jsondata['allComment'].map((e) {CommentModel.fromJson(e); }).toList();
    dateCommentClient = jsondata['dateCommentClient'];
    hoursLastComment = jsondata['hoursLastComment'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};

    return _data;
  }
 ClientModel  getproud(data){

    print('data');
     print( data.length.toString()+'data');
    List<ClientModel> prodlist = [];
    if(data!=null) {
      for (int i = 0; i < data.length; i++) {
          print('i'+i.toString());//+data[i]);
        prodlist.add(ClientModel.fromJson(data[i]));
      }
    }
    return prodlist[0];
  }
  List<CommentModel>  getcomm(data){

    List<CommentModel> prodlist = [];
    if(data!=null){
      for (int i = 0; i < data.length; i++) {
        // print(i+data[i]);
        prodlist.add(CommentModel.fromJson(data[i]));
      }
    }
    return prodlist;
  }
}
