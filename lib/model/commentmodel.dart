import '../constants.dart';

class CommentModel {
  CommentModel({
    required this.idComment,
    required this.fkUser,
    required this.fkClient,
    required this.content,
    required this.nameUser,
    required this.imgImage,
    required this.nameEnterprise,
  });
  late final String idComment;
  late final String fkUser;
  late final String fkClient;
  late final String content;
  late final String nameUser;
  late  String? imgImage='';
  late final String nameEnterprise;
  late final String date_comment;

  CommentModel.fromJson(Map<String, dynamic> json){
    idComment = json['id_comment'];
    fkUser = json['fk_user'];
    fkClient = json['fk_client'];
    content = json['content'];
    nameUser = json['nameUser'];
    imgImage =json['img_image'].toString().trim().isEmpty?
    json['img_image']: urlimage+ json['img_image'];
    nameEnterprise = json['name_enterprise'];
    date_comment = json['date_comment'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_comment'] = idComment;
    _data['fk_user'] = fkUser;
    _data['fk_client'] = fkClient;
    _data['content'] = content;
    _data['nameUser'] = nameUser;
    _data['img_image'] = imgImage;
    _data['name_enterprise'] = nameEnterprise;
    _data['date_comment'] = date_comment;
    return _data;
  }
}