import 'package:flutter/cupertino.dart';

import '../../../../model/notificationModel.dart';

class NotificationsPageVariablesEntity {
  List<NotificationModel> allList = [];
  TextEditingController searchController = TextEditingController();
  int totalCount = 0;
  int unReadCount = 0;

  bool isNewFilter = true;
  bool hasReachedEnd = false;
}
