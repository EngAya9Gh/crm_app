import 'package:crm_smart/core/common/enums/client_registration_type.dart';
import 'package:crm_smart/core/common/enums/source_client.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/maps/location_services.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/widgets/icon_click_on_map.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../app/presentation/widgets/app_text_field.dart.dart';

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
  late final PrivilegeCubit privilegeCubit;

  @override
  void initState() {
    privilegeCubit = getIt<PrivilegeCubit>();
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
                maxLines: 1,
                controller: widget.locationController,
                validator: (value) => _locationValidation(userProvider, value),
                textStyle: context.textTheme.titleSmall?.copyWith(
                  fontSize: 12.sp,
                ),
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
    if (_isRequiredLocation(userProvider) && value!.isEmpty) {
      return 'الموقع مطلوب';
    }
    if (!LocationServices.isValidLatLang(value)) {
      return 'يرجي اتباع الصيغة: (العرض,الطول)'
          '\nمثل: 21.4224779,39.8251832';
    }

    final latitude = double.tryParse(value?.split(',')[0] ?? '0') ?? 0;
    final longitude = double.tryParse(value?.split(',')[1] ?? '0') ?? 0;

    if (latitude < -90 || latitude > 90) {
      return 'العرض يجب ان يكون بين -90 و 90';
    }

    if (longitude < -180 || longitude > 180) {
      return 'الطول يجب ان يكون بين -180 و 180';
    }

    return null;
  }

  bool _isRequiredLocation(UserProvider userProvider) {
    return ClientRegistrationType.isCorrectFromString(
            userProvider.selectedClientRegistrationType) ||
        ClientSource.isFieldFromString(userProvider.selectedSourceClient) ||
        ClientSource.isRecommendedClientFromString(
            userProvider.selectedSourceClient);
  }
}
