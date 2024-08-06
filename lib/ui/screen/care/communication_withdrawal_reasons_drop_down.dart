import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/custom_dropdown.dart';
import '../../../model/communication_withdrawal_reason_model.dart';
import '../../../view_model/communication_vm.dart';

class CommunicationWithdrawalReasonsDropDown extends StatefulWidget {
  const CommunicationWithdrawalReasonsDropDown({
    super.key,
    this.onChanged,
    this.withdrawalReason,
  });

  final void Function(CommunicationWithdrawalReasonModel?)? onChanged;
  final CommunicationWithdrawalReasonModel? withdrawalReason;

  @override
  State<CommunicationWithdrawalReasonsDropDown> createState() =>
      _CommunicationWithdrawalReasonsDropDownState();
}

class _CommunicationWithdrawalReasonsDropDownState
    extends State<CommunicationWithdrawalReasonsDropDown> {
  late final communication_vm communicationVm;

  @override
  void initState() {
    final communicationVm = context.read<communication_vm>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (communicationVm.withdrawalReasons.isEmpty) {
        communicationVm.getCommunicationWithdrawalReasons();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<communication_vm>(
      builder: (context, value, child) {
        return CustomDropDown<CommunicationWithdrawalReasonModel>(
          hint: 'سبب الانسحاب',
          items: value.withdrawalReasons,
          itemAsString: (item) => item!.nameReason,
          selectedItem: widget.withdrawalReason,
          onChanged: widget.onChanged,
          height: 120.h,
        );
      },
    );
  }
}
