import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/custom_dropdown.dart';
import '../../../model/communication_withdrawal_reason_model.dart';
import '../../../view_model/communication_vm.dart';

class CommunicationWithdrawalReasonsDropDown extends StatefulWidget {
  const CommunicationWithdrawalReasonsDropDown({
    super.key,
    this.initialValue,
    this.withdrawalReason,
    this.onChanged,
  });

  final String? initialValue;
  final CommunicationWithdrawalReasonModel? withdrawalReason;
  final void Function(CommunicationWithdrawalReasonModel?)? onChanged;

  @override
  State<CommunicationWithdrawalReasonsDropDown> createState() =>
      _CommunicationWithdrawalReasonsDropDownState();
}

class _CommunicationWithdrawalReasonsDropDownState
    extends State<CommunicationWithdrawalReasonsDropDown> {
  late final CommunicationVm communicationVm;
  CommunicationWithdrawalReasonModel? _withdrawalReason;

  @override
  void initState() {
    communicationVm = context.read<CommunicationVm>();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (communicationVm.withdrawalReasons.isEmpty) {
        await communicationVm.getCommunicationWithdrawalReasons();
      }
      _prepareInitialValue();
    });
    super.initState();
  }

  _prepareInitialValue() {
    if (widget.initialValue == null) return;

    _withdrawalReason = communicationVm.withdrawalReasons.firstWhereOrNull(
      (element) => element.nameReason == widget.initialValue,
    );
    if (_withdrawalReason != null) {
      setState(() {});
      widget.onChanged!(_withdrawalReason);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CommunicationVm>(
      builder: (context, value, child) {
        return CustomDropDown<CommunicationWithdrawalReasonModel>(
          hint: 'سبب الانسحاب',
          items: value.withdrawalReasons,
          itemAsString: (item) => item!.nameReason,
          selectedItem: _withdrawalReason,
          onChanged: widget.onChanged,
          height: 165.scaleHeight,
        );
      },
    );
  }
}
