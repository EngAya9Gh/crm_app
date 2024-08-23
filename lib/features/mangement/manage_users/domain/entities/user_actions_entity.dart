import '../../../../../core/common/models/location/branch_model.dart';
import '../../../../../model/managmodel.dart';
import '../../../manage_privilege/data/models/level_model.dart';

class UserActionsEntity {
  BranchModel? selectedBranch;
  ManageModel? selectedManage;
  LevelModel? selectedLevel;

  UserActionsEntity({
    this.selectedBranch,
    this.selectedManage,
    this.selectedLevel,
  });
}
