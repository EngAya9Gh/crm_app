import 'package:crm_smart/core/common/enums/toast_colors_enum.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text.dart';

class AddLevelSheet extends StatefulWidget {
  const AddLevelSheet({super.key});

  @override
  State<AddLevelSheet> createState() => _AddLevelSheetState();
}

class _AddLevelSheetState extends State<AddLevelSheet> {
  late final LevelsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<LevelsCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _cubit.addLevelFormVariables.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.height,
                  AppText("إضافة مستوى"),
                  20.height,
                  AppTextField(
                    labelText: "اسم المستوى*",
                    maxLines: 1,
                    validator: InputValidator.requiredFiled,
                    controller: _cubit.addLevelFormVariables.nameController,
                  ),
                  20.height,
                  BlocConsumer<LevelsCubit, LevelsState>(
                    listener: (context, state) {
                      if (state.addLevelStatus.isFailed()) {
                        AppSnackbar.showSnakeBar(
                          state.addLevelStatus.error!,
                          color: ToastColorsEnum.error,
                        );
                        return;
                      }
                      if (state.addLevelStatus.isSuccess()) {
                        AppSnackbar.showSnakeBar(
                          "تمت الإضافة بنجاح",
                          color: ToastColorsEnum.success,
                        );
                        AppNavigator.pop();
                        return;
                      }
                    },
                    builder: (context, state) {
                      return AppElevatedButton(
                        text: "إضافة",
                        isLoading: state.addLevelStatus.isLoading(),
                        onPressed: () {
                          if (!_isValid()) return;
                          _cubit.addLevel();
                        },
                      );
                    },
                  ),
                  20.height,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  bool _isValid() {
    return _cubit.addLevelFormVariables.formKey.currentState!.validate();
  }
}
