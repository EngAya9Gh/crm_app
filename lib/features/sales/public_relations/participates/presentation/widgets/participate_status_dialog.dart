import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../../core/utils/app_navigator.dart';
import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/utils/app_constants.dart';
import '../../data/models/state_participat_model.dart';
import '../../domain/use_cases/change_participate_status_usecase.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';

class ParticipateStatusDialog extends StatefulWidget {
  const ParticipateStatusDialog({
    super.key,
    required this.idParticipate,
    this.stateParticipateModel,
  });

  final String idParticipate;
  final StateParticipateModel? stateParticipateModel;

  @override
  _ParticipateStatusDialogState createState() =>
      _ParticipateStatusDialogState();
}

class _ParticipateStatusDialogState extends State<ParticipateStatusDialog> {
  late final ParticipateListBloc _bloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StateParticipateEnum? _selectedParticipateState;
  final TextEditingController _reasonController = TextEditingController();

  @override
  void initState() {
    _bloc = context.read<ParticipateListBloc>();
    _selectedParticipateState =
        StateParticipateEnum.fromString(widget.stateParticipateModel?.state);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text('حالة المتعاون'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomDropDown<StateParticipateEnum>(
                hint: 'حالة المتعاون',
                items: StateParticipateEnum.values,
                itemAsString: (item) => item!.value,
                selectedItem: _selectedParticipateState,
                onChanged: (state) {
                  _selectedParticipateState = state;
                },
                validator: InputValidator.requiredFiled,
                height: 100.h,
              ),
              15.height,
              TextFormField(
                controller: _reasonController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'السبب *',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: InputValidator.requiredFiled,
              ),
              SizedBox(height: 15),
              BlocBuilder<ParticipateListBloc, ParticipateListState>(
                builder: (context, state) {
                  return AppElevatedButton(
                    isLoading: state.changeStateParticipateStatus.isLoading(),
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) return;
                      _bloc.add(ChangeParticipateStatusEvent(
                        ChangeParticipateParams(
                          idParticipate: widget.idParticipate,
                          stateParticipate: _selectedParticipateState!,
                          reason: _reasonController.text,
                        ),
                        onSuccess: (value) {
                          AppNavigator.pop();
                          _bloc.add(ChanageCurrentParticipate(value!));
                          AppConstants.showSnakeBar('تم تغيير الحالة بنجاح');
                        },
                      ));
                    },
                    text: 'حفظ',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
