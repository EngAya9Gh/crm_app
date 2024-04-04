import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage(kLogo)),
          ],
        ),
      ),
    );
  }
}
