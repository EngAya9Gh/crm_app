import 'package:crm_smart/features/clients_care/client_activites/data/models/activity_type_model.dart';
import 'package:flutter/cupertino.dart';

import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../../../client_communications/data/models/client_activity_model.dart';

class AddActivityCrudEntity {
  TextEditingController nameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ValueNotifier<String?> priority = ValueNotifier(null);
  ValueNotifier<String?> activityState = ValueNotifier(null);
  ValueNotifier<bool> wholeDay = ValueNotifier(false);
  ValueNotifier<SubscribedClientModel?> selectedClient = ValueNotifier(null);
  ValueNotifier<ActivityTypeModel?> selectedActivityType = ValueNotifier(null);
  ValueNotifier<ClientActivityModel?> selectedActivity = ValueNotifier(null);
  ValueNotifier<List<ActivityTypeModel>> addActivityTypesList = ValueNotifier([]);
  ValueNotifier<List<SubscribedClientModel>> subscribedClientsList = ValueNotifier([]);
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  
  void setUpdateValues(ClientActivityModel activity){
    nameController.text= activity.name;
    startDateController.text= activity.startDate!=null?activity.startDate.toString():'';
    endDateController.text= activity.endDate!=null?activity.endDate.toString():'';
    descriptionController.text= activity.description??"";
    priority.value = activity.priority;
    activityState.value = activity.state;
    wholeDay.value = activity.wholeDay;
    if (subscribedClientsList.value.isNotEmpty) {
      if (subscribedClientsList.value.any((client) => client.id.toString() == activity.fkClient.toString())) {
        selectedClient.value = subscribedClientsList.value.firstWhere(
              (client) => client.id.toString() == activity.fkClient,
        );
      }
    }
    if (addActivityTypesList.value.isNotEmpty) {
      if (addActivityTypesList.value.any((activityType) => activityType.id.toString() == activity.activityTypeId.toString())) {
        selectedActivityType.value = addActivityTypesList.value.firstWhere(
              (activityType) => activityType.id.toString() == activity.activityTypeId.toString(),
        );
      }
    }
  }
  void clear() {
    nameController.clear();
    selectedActivity.value = null;
    startDateController.clear();
    endDateController.clear();
    descriptionController.clear();
    priority.value = null;
    activityState.value = null;
    selectedClient.value = null;
    selectedActivityType.value = null;
    wholeDay.value = false;
  }
}