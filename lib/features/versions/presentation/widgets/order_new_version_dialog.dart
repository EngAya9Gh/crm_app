
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_drop_down.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OrderNewVersionDialog extends StatefulWidget {
  const OrderNewVersionDialog({
    super.key,
  });

  @override
  State<OrderNewVersionDialog> createState() => _OrderNewVersionDialogState();
}

class _OrderNewVersionDialogState extends State<OrderNewVersionDialog> {
  late final ViolationsCubit violationsCubit;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController goalController = TextEditingController();
  final TextEditingController desciptionController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final ValueNotifier<int> idmanagement = ValueNotifier(0);
  @override
  void initState() {
    violationsCubit = context.read<ViolationsCubit>();
    violationsCubit.getAllManagements();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppDialog(
        headerWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: AppColors.black,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            Expanded(child: Center(child: AppText('طلب تطويري'))),
          ],
        ),
        insetPadding: EdgeInsets.symmetric(horizontal: 12),
        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        children: [
          SizedBox(
            width: 650.scaleWidth,
            child: Column(
              children: [
                AppTextField(
                  hintText: "عنوان الطلب",
                  isRequired: true,
                  controller: titleController,
                ),
                10.height,
                AppTextField(
                  hintText: "الهدف",
                  isRequired: true,
                  maxLines: 3,
                  controller: goalController,
                ),
                10.height,
                AppTextField(
                  hintText: "الوصف",
                  controller: desciptionController,
                  onChange: (val) {},
                  isRequired: true,
                  maxLines: 4,
                ),
                10.height,
                BlocBuilder<ViolationsCubit, ViolationsState>(builder: (context, state) {
                  if (state.getManagementStatus.isLoading()) {
                    return AppLoader();
                  } else if (state.getManagementStatus.isFailed()) {
                    return AppErrorWidget(onPressed: () {
                      violationsCubit.getAllManagements();
                    });
                  }
                  return ValueListenableBuilder(
                    valueListenable: idmanagement,
                    builder: (context, managementId, child) => AppDropdownButtonFormField(
                      value: managementId,
                      items: List.of(violationsCubit.pageVariables.managementList)..insert(0, ManagementModel(idManage: 0, nameManage: 'عام')),
                      itemBuilder: (item) => AppText(item?.nameManage ?? ''),
                      itemAsValue: (item) => item?.idManage,
                      // itemAsString: (item) => item??'' ,
                      onChange: (value) {
                        idmanagement.value = value!;
                      },
                      validator: InputValidator.requiredFiled,
                    ),
                  );
                }),
                10.height,
                AppTextField(
                  hintText: "الملاحظات",
                  controller: noteController,
                  onChange: (val) {},
                  maxLines: 4,
                ),
                20.height,
                AppElevatedButton(
                  width: double.infinity,
                  text: 'حفظ',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
