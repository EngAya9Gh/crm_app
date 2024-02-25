import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/core/utils/responsive_padding.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_elvated_button.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/helpers/helper_functions.dart';
import '../../../../core/di/di_container.dart';

class AddLevelSheet extends StatefulWidget {
  const AddLevelSheet({Key? key}) : super(key: key);

  @override
  State<AddLevelSheet> createState() => _AddLevelSheetState();
}

class _AddLevelSheetState extends State<AddLevelSheet> {
  late TextEditingController _levelController;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _levelController = TextEditingController();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: HWEdgeInsets.symmetric(horizontal: 20),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.verticalSpace,
              AppText("إضافة مستوى", style: context.textTheme.titleMedium),
              20.verticalSpace,
              AppTextField(
                labelText: "اسم المستوى*",
                maxLines: 1,
                validator: HelperFunctions.instance.requiredFiled,
                controller: _levelController,
              ),
              20.verticalSpace,
              BlocBuilder<PrivilegeCubit, PrivilegeState>(
                builder: (context, state) {
                  return AppElevatedButton(
                    text: "إضافة",
                    isLoading: state.addLevelStatus.isLoading(),
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) {
                        return;
                      }
                      getIt<PrivilegeCubit>().addLevel(
                          _levelController.text, Navigator.of(context).pop);
                    },
                  );
                },
              ),
              40.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
