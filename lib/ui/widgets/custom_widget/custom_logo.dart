import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
    this.height,
    this.width,
    this.fit,
    this.logoNumber = 0,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;
  final int logoNumber;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        height: height ?? MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: AssetImage(logos()[logoNumber]),
              width: width,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }

  List<String> logos() => [
        Assets.imagesLogoCrmLong,
        Assets.imagesNewCrmLogo,
      ];
}
