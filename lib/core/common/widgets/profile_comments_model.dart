import 'package:equatable/equatable.dart';

class ProfileCommentModel extends Equatable {
  int? participateId;
  String? content;
  String? dateComment;
  int? userId;
  int? id;
  String? nameUser;
  String? imgImage;
  String? addDate;
  String? updateDate;

  ProfileCommentModel(
      {this.participateId,
      this.content,
      this.dateComment,
      this.userId,
      this.id,
      this.nameUser,
      this.imgImage,
      this.addDate,
      this.updateDate});

  ProfileCommentModel.fromJson(Map<String, dynamic> json) {
    participateId = json['participate_id'];
    content = json['content'];
    dateComment = json['date_comment'];
    userId = json['user_id'];
    id = json['id'];
    nameUser = json['nameUser'];
    imgImage = json['img_image'];
    addDate = json['add_date'];
    updateDate = json['update_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['participate_id'] = this.participateId;
    data['content'] = this.content;
    data['date_comment'] = this.dateComment;
    data['user_id'] = this.userId;
    data['id'] = this.id;
    data['nameUser'] = this.nameUser;
    data['img_image'] = this.imgImage;
    data['add_date'] = this.addDate;
    data['update_date'] = this.updateDate;
    return data;
  }

  @override
  List<Object?> get props => [
        participateId,
        content,
        dateComment,
        userId,
        id,
        nameUser,
        imgImage,
        addDate,
        updateDate
      ];
}
