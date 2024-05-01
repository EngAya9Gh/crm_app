import 'package:crm_smart/core/common/helpers/location_permission.dart';
import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
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
        setState(() {
          isLoading = true;
        });
        final value = await LocationService.getLocation(context);
        if (value != null) {
          // show ling
          widget.locationController.text =
              "${value.latitude},${value.longitude}";
        }
        setState(() {
          isLoading = false;
        });
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
}
