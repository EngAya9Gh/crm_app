import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import 'custom_google_map.dart';

class IconClickOnMap extends StatefulWidget {
  const IconClickOnMap({
    super.key,
    required this.locationController,
  });

  final TextEditingController locationController;

  @override
  State<IconClickOnMap> createState() => _IconClickOnMapState();
}

class _IconClickOnMapState extends State<IconClickOnMap> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isLoading) return;
        _changeIsLoading();

        await AppNavigator.go(
          CustomGoogleMap(
            locationController: widget.locationController,
          ),
          isNew: false,
        );

        _changeIsLoading();
      },
      child: SizedBox(
        height: 45.scaleIconsSize,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            AppIcon(
              Icons.map,
              color: Colors.blue,
              size: 30,
            ),
            Positioned(
              right: -10,
              bottom: 0,
              child: AppIcon(
                Icons.ads_click,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeIsLoading() {
    isLoading = !isLoading;
    setState(() {});
  }
}
