import 'package:crm_smart/core/common/enums/client_registration_type.dart';
import 'package:crm_smart/core/common/enums/source_client.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/maps/location_services.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
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
    return Column(
      children: [
        GestureDetector(
          excludeFromSemantics: true,
          onTap: () async {
            if (isLoading) return;
            _changeIsLoading();

            await _handleLocation(context);

            _changeIsLoading();
          },
          child: Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return AppTextField(
                labelText:
                    "الموقع${_isRequiredLocation(userProvider) ? '*' : ''}",
                maxLines: 1,
                controller: widget.locationController,
                readOnly: true,
                enabled: false,
                validator: (value) {
                  if (_isRequiredLocation(userProvider) && value!.isEmpty) {
                    return 'الموقع مطلوب';
                  }
                  return null;
                },
                suffixIcon: isLoading
                    ? Container(
                        width: 20,
                        height: 20,
                        padding: const EdgeInsets.all(10.0),
                        child: const CustomLoadingIndicator(isCentered: false),
                      )
                    : Icon(
                        Icons.location_on,
                        color: Colors.blue,
                      ),
              );
            },
          ),
        ),
        15.verticalSpace,
      ],
    );
  }

  bool _isRequiredLocation(UserProvider userProvider) {
    return ClientRegistrationType.isCorrectFromString(
            userProvider.selectedClientRegistrationType) ||
        ClientSource.isFieldFromString(userProvider.selectedSourceClient) ||
        ClientSource.isRecommendedClientFromString(
            userProvider.selectedSourceClient);
  }

  Future<void> _handleLocation(BuildContext context) async {
    final LocationServices locationServices = getIt<LocationServices>();

    try {
      final value = await locationServices.getLocation();
      widget.locationController.text = "${value.latitude},${value.longitude}";
    } on BaseAppException catch (e) {
      debugPrint("error => ${e.message}");
      AppConstants.showSnakeBar(context, e.message);
    } catch (e) {
      debugPrint("error => $e");
      AppConstants.showSnakeBar(context, 'حدث خطأ ما');
    }
  }

  void _changeIsLoading() {
    isLoading = !isLoading;
    setState(() {});
  }
}
