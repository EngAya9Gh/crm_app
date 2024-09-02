import '../../../../../../core/common/helpers/api_helper.dart';

class ClientLogModel {
  final String id;
  final String? model;
  final String? modelName;
  final String? modelId;
  final String? action;
  final List<ChangesData>? changesData;
  final String? description;
  final String? userId;
  final String? nameUser;
  final String? route;
  final String? routeName;
  final dynamic? afterApprove;
  final String? actionDate;

  const ClientLogModel({
    required this.id,
    this.model,
    this.modelName,
    this.modelId,
    this.action,
    this.changesData,
    this.description,
    this.userId,
    this.nameUser,
    this.route,
    this.routeName,
    this.afterApprove,
    this.actionDate,
  });

  factory ClientLogModel.fromJson(Map<String, dynamic> json) {
    return ClientLogModel(
      id: json['id'].toString(),
      model: ApiHelper.handleString(json['model']),
      modelName: ApiHelper.handleString(json['model_name']),
      modelId: ApiHelper.handleString(json['model_id']),
      action: ApiHelper.handleString(json['action']),
      changesData: json['changesData'] == null
          ? null
          : List<ChangesData>.from(
              json['changesData'].map((e) => ChangesData.fromJson(e))),
      description: ApiHelper.handleString(json['description']),
      userId: ApiHelper.handleString(json['user_id']),
      nameUser: ApiHelper.handleString(json['nameUser']),
      route: ApiHelper.handleString(json['route']),
      routeName: ApiHelper.handleString(json['route_name']),
      afterApprove: json['afterApprove'],
      actionDate: ApiHelper.handleString(json['action_date']),
    );
  }

  bool searchString(String search) {
    String searchIn = "";
    if (model != null) searchIn += "$model ";
    if (modelName != null) searchIn += "$modelName ";
    if (modelId != null) searchIn += "$modelId ";
    if (action != null) searchIn += "$action ";
    if (description != null) searchIn += "$description ";
    if (userId != null) searchIn += "$userId ";
    if (nameUser != null) searchIn += "$nameUser ";
    if (route != null) searchIn += "$route ";
    if (routeName != null) searchIn += "$routeName ";
    if (actionDate != null) searchIn += "$actionDate ";
    if (afterApprove != null) searchIn += "$afterApprove ";
    if (changesData != null) {
      for (var item in changesData!) {
        if (item.key != null) searchIn += "${item.key} ";
        if (item.old != null) searchIn += "${item.old} ";
        if (item.theNew != null) searchIn += "${item.theNew} ";
      }
    }
    return searchIn.toLowerCase().contains(search.toLowerCase());
  }
}

class ChangesData {
  final String? key;
  final String? old;
  final String? theNew;

  const ChangesData({
    this.key,
    this.old,
    this.theNew,
  });

  factory ChangesData.fromJson(Map<String, dynamic> json) {
    return ChangesData(
      key: ApiHelper.handleString(json['key']),
      old: ApiHelper.handleString(json['old']),
      theNew: ApiHelper.handleString(json['new']),
    );
  }
}
