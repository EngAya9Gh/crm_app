import 'package:equatable/equatable.dart';

import '../../data/models/care_usage_model.dart';

class CareUsageEntity extends Equatable {
  final int? idClients;
  final String? nameEnterprise;
  final String? lastActivity;
  final int? daysSinceLastActivity;
  final String? dateSubscription;
  final String? endSubscription;
  final String? state;
  final String? package;
  final String? lastModuleActivity;
  final String? lastOperationActivity;
  final int? fkRegoin;
  final String? regoinName;
  final int? activityTypeFk;
  final String? activityTypeName;
  final int? shouldCommunicate;
  final int? idCommunication;
  final int? days_since_last_activity;
  final bool? tag;
  final WithdrawPossibility? possibilityOfWithdraw;

  const CareUsageEntity({
    this.idClients,
    this.nameEnterprise,
    this.lastActivity,
    this.daysSinceLastActivity,
    this.dateSubscription,
    this.endSubscription,
    this.state,
    this.package,
    this.lastModuleActivity,
    this.lastOperationActivity,
    this.fkRegoin,
    this.regoinName,
    this.activityTypeFk,
    this.activityTypeName,
    this.shouldCommunicate,
    this.idCommunication,
    this.days_since_last_activity,
    this.possibilityOfWithdraw,
    this.tag,
  });

  @override
  List<Object?> get props => [
        idClients,
        nameEnterprise,
        lastActivity,
        daysSinceLastActivity,
        dateSubscription,
        endSubscription,
        state,
        package,
        lastModuleActivity,
        lastOperationActivity,
        fkRegoin,
        regoinName,
        activityTypeFk,
        activityTypeName,
        shouldCommunicate,
        idCommunication,
        days_since_last_activity,
        possibilityOfWithdraw,
        tag,
      ];
}
