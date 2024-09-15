import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/client/client_source_enum.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../view_model/user_vm_provider.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import 'icon_click_on_map.dart';

class CustomLocationField extends StatefulWidget {
  const CustomLocationField({
    super.key,
    required this.isEdit,
    required this.locationController,
  });

  final bool isEdit;
  final TextEditingController locationController;

  @override
  State<CustomLocationField> createState() => _CustomLocationFieldState();
}

class _CustomLocationFieldState extends State<CustomLocationField> {
  bool isLoading = false;
  late final PrivilegesCubit privilegeCubit;

  @override
  void initState() {
    privilegeCubit = context.read<PrivilegesCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isEdit && !privilegeCubit.checkPrivilege('27')) {
      return SizedBox.shrink();
    }

    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: AppTextField(
                labelText:
                    "الموقع${_isRequiredLocation(userProvider) ? '*' : ''}",
                controller: widget.locationController,
                validator: (value) => _locationValidation(userProvider, value),
              ),
            ),
            SizedBox(width: 12),
            IconClickOnMap(locationController: widget.locationController),
          ],
        );
      },
    );
  }

  String? _locationValidation(UserProvider userProvider, String? value) {
    if (value?.isNotEmpty ?? false) {
      return InputValidator.validateLocation(value);
    }

    if (_isRequiredLocation(userProvider)) {
      return 'الموقع مطلوب';
    }

    return null;
  }

  bool _isRequiredLocation(UserProvider userProvider) {
    return userProvider.selectedSourceClient == ClientSourceEnum.field;
  }
}
