import 'package:equatable/equatable.dart';

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
      ];
}
