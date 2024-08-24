import 'package:flutter/material.dart';

import '../../core/common/widgets/app_cached_network_image.dart';
import '../../core/utils/app_fonts.dart';

class widgetlogo extends StatelessWidget {
  widgetlogo(
      {this.alignment,
      required this.value,
      required this.title,
      this.isExpanded,
      Key? key})
      : super(key: key);
  var alignment;
  String title;
  String value;
  bool? isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              alignment == null ? MainAxisAlignment.spaceBetween : alignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.fontFamily2),
            ),
            SizedBox(
              width: 50,
            ),
            //Spacer(flex: 1,),
            // isExpanded==true?
            Expanded(
                flex: 1,
                child: CircleAvatar(
                  child: AppCachedNetworkImage(
                    width: 1000,
                    height: 1000,
                    fit: BoxFit.fill,
                    imageUrl: value,
                  ),
                )),
          ],
        ),
        //Spacer(),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        //const MySeparator(color: Colors.grey),
        SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
