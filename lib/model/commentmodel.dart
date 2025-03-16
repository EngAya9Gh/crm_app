import 'package:crm_smart/model/usermodel.dart';

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
    this.nameEnterprise,
    required this.date_comment,
    required this.type_comment,
    this.mention_users,
  });

  late final String idComment;
  late final String fkUser;
  late final String fkClient;
  late final String content;
  late String? nameUser;
  late String? imgImage = '';
  String? nameEnterprise;
  late final String date_comment;
  late final String type_comment;
  List<UserModel>? mention_users;
  UserModel? commentedBy;

  CommentModel.fromJson(Map<String, dynamic> json) {
    final image = json['img_image'];
    if (image != null) {
      imgImage = EndPoints.baseUrls.urlImage + image;
    }
    idComment = json['id_comment'] != null ? json['id_comment'].toString() : "${json['id'] ?? ''}";
    fkUser = json['fk_user'] != null
        ? json['fk_user'].toString()
        : json['user_id'] != null
            ? json['user_id'].toString()
            : "";
    fkClient = json['fk_client'] != null
        ? json['fk_client'].toString()
        : json['client_id'] != null
            ? json['client_id'].toString()
            : "";
    content = json['content'] ?? '';
    nameUser = json['nameUser']??json['user_name'];
    imgImage = image;
    nameEnterprise = json['name_enterprise'] == null ? null : json['name_enterprise'];
    commentedBy = json['commented_by'] == null ? null : UserModel.fromJson(json['commented_by']);
    date_comment = json['date_comment'] ?? json['comment_date'];
    type_comment = json['type_comment'] ?? CommentTypeEnum.all.value;
    mention_users = json['mention_users'] == null ? [] : List.of(json['mention_users']).map((e) => UserModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_comment'] = idComment;
    _data['fk_user'] = fkUser;
    _data['user_id'] = fkUser;
    _data['fk_client'] = fkClient;
    _data['client_id'] = fkClient;
    _data['content'] = content;
    _data['nameUser'] = nameUser;
    _data['user_name'] = nameUser;
    _data['img_image'] = imgImage;
    _data['name_enterprise'] = nameEnterprise;
    _data['date_comment'] = date_comment;
    _data['mention_users'] = mention_users?.map(
      (e) => e.toJson(),
    );
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
    List<UserModel>? mention_users,
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
      mention_users: mention_users ?? this.mention_users,
    );
  }
}
