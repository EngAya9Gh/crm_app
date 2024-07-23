enum NoCommentsEnum {
//   الكل
// لايوجد اي تعليقات
// يوجد تعليقات
  all,
  comments,
  noComments,
}

extension NoCommentsEnumExtension on NoCommentsEnum {
  String get value {
    switch (this) {
      case NoCommentsEnum.all:
        return 'الكل';
      case NoCommentsEnum.noComments:
        return 'لايوجد اي تعليقات';
      case NoCommentsEnum.comments:
        return 'يوجد تعليقات';
    }
  }

  String? get toParam {
    switch (this) {
      case NoCommentsEnum.all:
        return null;
      case NoCommentsEnum.noComments:
        return '1';
      case NoCommentsEnum.comments:
        return '2';
    }
  }
}
