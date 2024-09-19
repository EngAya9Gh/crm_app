import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
    this.height,
    this.width,
    this.fit,
  });

  final double? height;
  final double? width;
  final BoxFit? fit;

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
              image: AssetImage(
                Assets.imagesLogoCrmLong,
              ),
              width: width,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
