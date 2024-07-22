import '../../../../../model/managmodel.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../data/models/branch_model.dart';

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
