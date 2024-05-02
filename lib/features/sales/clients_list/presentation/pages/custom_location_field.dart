import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/core/services/di/di_container.dart';
import 'package:crm_smart/core/services/maps/location_services.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../app/presentation/widgets/app_text_field.dart.dart';

class CustomLocationField extends StatefulWidget {
  const CustomLocationField({
    super.key,
    required this.locationController,
  });

  final TextEditingController locationController;

  @override
  State<CustomLocationField> createState() => _CustomLocationFieldState();
}

class _CustomLocationFieldState extends State<CustomLocationField> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      excludeFromSemantics: true,
      onTap: () async {
        if (isLoading) return;
        _changeIsLoading();

        final LocationServices locationServices = getIt<LocationServices>();

        try {
          final value = await locationServices.getLocation();
          widget.locationController.text =
              "${value.latitude},${value.longitude}";
        } on BaseAppException catch (e) {
          AppConstants.showSnakeBar(context, e.message);
        }

        _changeIsLoading();
      },
      child: AppTextField(
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
        labelText: "الموقع",
        maxLines: 1,
        controller: widget.locationController,
        readOnly: true,
        enabled: false,
      ),
    );
  }

  void _changeIsLoading() {
    isLoading = !isLoading;
    setState(() {});
  }
}
