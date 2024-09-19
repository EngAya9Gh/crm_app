import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/app_svg_picture.dart';

class WebLoginLeftSide extends StatelessWidget {
  const WebLoginLeftSide({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: constraints.maxWidth * 0.78,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSvgPicture(
                    Assets.svgLogicCurvedIcons,
                    stateType: SvgSource.assets,
                    width: 99,
                    height: 81,
                  ),
                  AppSvgPicture(
                    Assets.svgLoginGearIcon,
                    stateType: SvgSource.assets,
                    width: 92,
                    height: 92,
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.scaleHeight),
            SizedBox(
              width: constraints.maxWidth * 0.78,
              height: constraints.maxHeight * 0.56,
              child: AppSvgPicture(
                Assets.svgLoginPage,
                stateType: SvgSource.assets,
              ),
            ),
          ],
        );
      },
    );
  }
}
