import 'dart:ui' as myui;
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violations_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../client_communications/presentation/manager/clients_activities_bloc.dart';
import '../manager/violations_cubit.dart';

class UpdateViolationDialog extends StatefulWidget {
  final ViolationModel violation;

  UpdateViolationDialog({
    super.key,
    required this.violation,
  });

  @override
  State<UpdateViolationDialog> createState() => _UpdateViolationDialogState();
}

class _UpdateViolationDialogState extends State<UpdateViolationDialog> {
  late final ViolationsCubit _violationsCubit;

  void initState() {
    super.initState();
    _violationsCubit = context.read<ViolationsCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "تعديل المخالفة",
      children:[
      BlocBuilder<ClientsActivitiesBloc, ClientsActivitiesState>(
        builder: (context, state) {
          return Directionality(
            textDirection: myui.TextDirection.rtl,
            child: Form(
              key: _violationsCubit.pageVariables.globalKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextField(
                    hintText: "الوصف",
                    controller: _violationsCubit.pageVariables.descriptionController,
                    isRequired: true,
                    maxLines: 3,
                  ),
                  10.height,
                  Center(
                    child: BlocBuilder<ViolationsCubit, ViolationsState>(
                      buildWhen: (previous, current) {
                        return current.updateViolationStatus !=
                            previous.updateViolationStatus;
                      },
                      builder: (context, state) {
                        if(state.updateViolationStatus.isLoading())
                          return FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const AppText("loading..."),
                                8.width,
                                const AppLoader(),
                              ],
                            ),
                          );
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppElevatedButton(
                              isLoading: state.updateViolationStatus.isLoading(),
                              backgroundColor: AppColors.statusErrorActive,
                              text: "رفض",
                              onPressed: () async {
                                if (_violationsCubit
                                    .pageVariables.globalKey.currentState!
                                    .validate()) {
                                  _violationsCubit.updateViolationEvent(
                                    description: _violationsCubit.pageVariables.descriptionController.text,
                                    isAccepted:false,violationId: widget.violation.id!,
                                      onSuccess:()=> AppNavigator.pop()
                                  );
                                  return;
                                }
                              },
                            ),
                            10.width,
                            AppElevatedButton(
                              isLoading: state.updateViolationStatus.isLoading(),
                              backgroundColor: AppColors.green,
                              text: "قبول",
                              onPressed: () async {
                                if (_violationsCubit
                                    .pageVariables.globalKey.currentState!
                                    .validate()) {
                                  _violationsCubit.updateViolationEvent(
                                      description: _violationsCubit.pageVariables.descriptionController.text,
                                      isAccepted:true,violationId: widget.violation.id!,
                                      onSuccess:()=> AppNavigator.pop()
                                  );
                                  return;
                                }
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      ]
    );
  }

}
