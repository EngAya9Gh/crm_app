


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class widgetlogo extends StatelessWidget {
   widgetlogo({
    this.alignment,required this.value,required this.title,this.isExpanded,Key? key})
      : super(key: key);
  var alignment;
  String title;
  String value;
  bool? isExpanded=false;
  @override
  Widget build(BuildContext context) {
    print('smsnsjkn');
    print( value.toString());
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: alignment==null? MainAxisAlignment.spaceBetween:alignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: kfontfamily2),),
            SizedBox(width: 50,),
            //Spacer(flex: 1,),
           // isExpanded==true?
            Expanded(
                flex: 1,
                child:  CircleAvatar(
                  child: CachedNetworkImage(
                      width: 1000,height: 1000,fit: BoxFit.fill,
                      progressIndicatorBuilder: (context, url, progress) =>
                          Center(
                        child: CircularProgressIndicator(
                          value: progress.progress,),),
                      imageUrl:value   ),
                )
            ) ,
          ],
        ),
        //Spacer(),
        Divider(thickness: 1,color: Colors.grey,),
        //const MySeparator(color: Colors.grey),
        SizedBox(height: 5,),

      ],
    );
  }
}
