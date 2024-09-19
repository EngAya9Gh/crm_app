import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
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
        title: Center(child: AppText('حالة المتعاون')),
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
                height: 135.scaleHeight,
              ),
              10.height,
              AppTextField(
                hintText: 'السبب *',
                controller: _reasonController,
                maxLines: 3,
                contentPadding: EdgeInsets.all(10),
                autoValidateMode: AutovalidateMode.onUserInteraction,
                isRequired: true,
              ),
              10.height,
              BlocBuilder<ParticipateListBloc, ParticipateListState>(
                builder: (context, state) {
                  return AppElevatedButton(
                    text: 'حفظ',
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
                          AppSnackbar.showSnakeBar(
                            'تم تغيير الحالة بنجاح',
                            color: ToastColorsEnum.success,
                          );
                        },
                      ));
                    },
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
