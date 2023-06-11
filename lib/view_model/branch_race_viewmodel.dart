import 'package:crm_smart/model/targetmodel.dart';
import 'package:crm_smart/view_model/page_state.dart';
import 'package:flutter/material.dart';

import '../ui/screen/target/target_data.dart';

class BranchRaceViewmodel extends ChangeNotifier {
  PageState<List<TargetModel>> targetsState = PageState();

  Future<void> getTargets() async {
    try {
      if (!targetsState.isLoading) {
        targetsState = targetsState.changeToLoading;
        notifyListeners();
      }
      final list = await TargetData.getTarget();

      targetsState = targetsState.changeToLoaded(list);
      notifyListeners();
    } catch (e) {
      targetsState = targetsState.changeToFailed;
      notifyListeners();
    }
  }
}
