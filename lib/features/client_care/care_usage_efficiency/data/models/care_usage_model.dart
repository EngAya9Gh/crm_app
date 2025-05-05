import '../../domain/entities/care_usage_entity.dart';

class CareUsageModel extends CareUsageEntity {
  const CareUsageModel({
    super.idClients,
    super.nameEnterprise,
    super.lastActivity,
    super.daysSinceLastActivity,
    super.dateSubscription,
    super.endSubscription,
    super.state,
    super.package,
    super.lastModuleActivity,
    super.lastOperationActivity,
    super.fkRegoin,
    super.regoinName,
    super.activityTypeFk,
    super.activityTypeName,
    super.shouldCommunicate,
    super.idCommunication
  });

  factory CareUsageModel.fromJson(Map<String, dynamic> json) {
    return CareUsageModel(
      idClients: json['id_clients'],
      nameEnterprise: json['name_enterprise'],
      lastActivity: json['last_activity'],
      daysSinceLastActivity: json['days_since_last_activity'],
      dateSubscription: json['date_subscription'],
      endSubscription: json['end_subscription'],
      state: json['state'],
      package: json['package'],
      lastModuleActivity: json['last_module_activity'],
      lastOperationActivity: json['last_operation_activity'],
      fkRegoin: json['fk_regoin'],
      regoinName: json['regoin_name'],
      activityTypeFk: json['activity_type_fk'],
      activityTypeName: json['activity_type_name'],
      shouldCommunicate: json['should_communicate'],
      idCommunication: json['id_communication'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_clients': idClients,
      'name_enterprise': nameEnterprise,
      'last_activity': lastActivity,
      'days_since_last_activity': daysSinceLastActivity,
      'date_subscription': dateSubscription,
      'end_subscription': endSubscription,
      'state': state,
      'package': package,
      'last_module_activity': lastModuleActivity,
      'last_operation_activity': lastOperationActivity,
      'fk_regoin': fkRegoin,
      'regoin_name': regoinName,
      'activity_type_fk': activityTypeFk,
      'activity_type_name': activityTypeName,
      'should_communicate': shouldCommunicate,
      'id_communication':idCommunication,
    };
  }
}
