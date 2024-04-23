


class CompanyCommentModel{
  String? id_comment_company;
  String? id;
  String? fk_user;
  String? fk_company ;
  String? content;
  String? date_comment;
  String? nameUser;
  String? imgImage;

  CompanyCommentModel({
    this.id_comment_company,
    this.fk_user,
    this.fk_company ,
    this.content,
    this.date_comment,
    this.nameUser,
    this.imgImage,


  });
  //
  factory CompanyCommentModel.fromJson(jsonData) {
    return CompanyCommentModel(
       id_comment_company:  jsonData['id_comment_company'].toString(),
      fk_user: jsonData['fk_user'].toString(),
      nameUser: jsonData['nameUser'].toString(),
      imgImage: jsonData['img_image'].toString(),

      fk_company : jsonData['fk_company'].toString(),
      content: jsonData['content'].toString(),
      date_comment: jsonData!['date_comment'],

    );
  }
  // factory CompanyCommentModel.fromJson( jsonData) {
  //   return CompanyCommentModel(
  //     id_comment_company: int.parse(jsonData['id_comment_company']).toString(),
  //     fk_user: int.parse(jsonData['fk_user']).toString(),
  //     nameUser: jsonData['nameUser'].toString(),
  //     imgImage: jsonData['img_image'].toString(),
  //     fk_company: int.parse(jsonData['fk_company']).toString(),
  //     content: jsonData['content'].toString(),
  //     date_comment: jsonData['date_comment'],
  //   );
  // }
}