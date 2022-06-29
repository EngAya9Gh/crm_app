import 'package:flutter/material.dart';

import '../../../constants.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child:
      Container(
        height: MediaQuery.of(context).size.height* .2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage(kLogo)),
            // Positioned(
            //     bottom: 0,
            //     child: Text(
            //       'smart life',
            //       style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Pacifico'),)
            // )
          ],
        ),
      ),
    );
  }
}