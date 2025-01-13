import '../core/common/enums/comments/comment_type_enum.dart';
import '../core/utils/end_points.dart';

class CommentModel {
  CommentModel({
    required this.idComment,
    required this.fkUser,
    required this.fkClient,
    required this.content,
    required this.nameUser,
    required this.imgImage,
    required this.nameEnterprise,
    required this.date_comment,
    required this.type_comment,
  });

  late final String idComment;
  late final String fkUser;
  late final String fkClient;
  late final String content;
  late String? nameUser;
  late String? imgImage = '';
  late final String nameEnterprise;
  late final String date_comment;
  late final String type_comment;

  CommentModel.fromJson(Map<String, dynamic> json) {
    final image = json['img_image'];
    if (image != null) {
      imgImage = EndPoints.baseUrls.urlImage + image;
    }
    idComment = json['id_comment']!=null?json['id_comment'].toString():"";
    fkUser = json['fk_user']!=null?json['fk_user'].toString():"";
    fkClient =json['fk_client']!=null?json['fk_client'].toString():"";
    content = json['content'] ?? '';
    nameUser = json['nameUser'];
    imgImage = image;
    nameEnterprise = json['name_enterprise'];
    date_comment = json['date_comment'];
    type_comment = json['type_comment'] ?? CommentTypeEnum.all.value;
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

  CommentModel copyWith({
    String? idComment,
    String? fkUser,
    String? fkClient,
    String? content,
    String? nameUser,
    String? imgImage,
    String? nameEnterprise,
    String? date_comment,
    String? type_comment,
  }) {
    return CommentModel(
      idComment: idComment ?? this.idComment,
      fkUser: fkUser ?? this.fkUser,
      fkClient: fkClient ?? this.fkClient,
      content: content ?? this.content,
      nameUser: nameUser ?? this.nameUser,
      imgImage: imgImage ?? this.imgImage,
      nameEnterprise: nameEnterprise ?? this.nameEnterprise,
      date_comment: date_comment ?? this.date_comment,
      type_comment: type_comment ?? this.type_comment,
    );
  }
}
