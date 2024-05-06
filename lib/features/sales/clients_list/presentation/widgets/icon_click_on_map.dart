import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/features/sales/clients_list/presentation/widgets/custom_google_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

        await AppNavigator.push(CustomGoogleMap(
          locationController: widget.locationController,
        ));

        _changeIsLoading();
      },
      child: SizedBox(
        height: 45,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.centerLeft,
          children: [
            Icon(
              Icons.map,
              color: Colors.blue,
              size: 30,
            ),
            Positioned(
              right: -10,
              bottom: 0,
              child: Icon(
                Icons.ads_click,
                color: Colors.blue,
                size: 20.sp,
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
