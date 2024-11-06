import 'package:flutter/cupertino.dart';


class UpdateActivityCrudEntity {
  TextEditingController startDataController = TextEditingController();
  TextEditingController endDataController =TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ValueNotifier<String?> priority = ValueNotifier(null);
  ValueNotifier<String?> activityState = ValueNotifier(null);
  ValueNotifier<String?> fkUser = ValueNotifier(null);
  ValueNotifier<String?> fkClient = ValueNotifier(null);
  ValueNotifier<bool> wholeDay = ValueNotifier(false);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();


  void clear() {
    startDataController.clear();
    endDataController.clear();
    nameController.clear();
    descriptionController.clear();
    fkUser = ValueNotifier(null);
    priority = ValueNotifier(null);
    activityState = ValueNotifier(null);
    fkClient = ValueNotifier(null);
  }
}