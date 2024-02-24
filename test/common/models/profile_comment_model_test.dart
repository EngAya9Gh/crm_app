import 'package:crm_smart/core/common/widgets/profile_comments_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProfileCommentModel', () {
    final ProfileCommentModel commentModel = ProfileCommentModel(
      id: 1,
      userId: 1,
      participateId: 1,
      content: "content",
      addDate: "2024-02-24 20:14:28",
      dateComment: "2024-02-24 20:14:28",
      imgImage: '',
      nameUser: '',
      updateDate: "2024-02-24 20:14:28",
    );

    final Map<String, dynamic> commentMap = {
      "id": 1,
      "user_id": 1,
      "participate_id": 1,
      "content": "content",
      "add_date": "2024-02-24 20:14:28",
      "date_comment": "2024-02-24 20:14:28",
      "img_image": '',
      "nameUser": '',
      "update_date": "2024-02-24 20:14:28",
    };

    test("to map method in ProfileCommentModel", () {
      // Arrange

      // Act
      final result = commentModel.toJson();

      // Assert
      expect(result, commentMap);
    });

    test("from map method in ProfileCommentModel", () {
      // Arrange

      // Act
      final result = ProfileCommentModel.fromJson(commentMap);

      // Assert
      expect(result, commentModel);
    });
  });
}
