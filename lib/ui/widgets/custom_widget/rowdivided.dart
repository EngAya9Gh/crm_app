


import 'package:crm_smart/constants.dart';
import 'package:crm_smart/ui/widgets/custom_widget/separatorLine.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardRowDivided extends StatelessWidget {
  cardRowDivided({
    this.alignment,required this.value,required this.title,
    this.isExpanded,Key? key})
      : super(key: key);
  var alignment;
  String title;
  String value;
  bool? isExpanded=false;
  // bool? isrow=true;
  @override
  Widget build(BuildContext context) {
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
            isExpanded==true?
            Expanded(
                flex: 1,
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(value,style: TextStyle( fontWeight: FontWeight.w500,fontFamily: kfontfamily2),)))
                :Text(value,style: TextStyle( fontWeight: FontWeight.w500,fontFamily: kfontfamily2),),],
        ),
        //Spacer(),
        //  isrow==true?
        //Divider(thickness: 1,color: Colors.grey,),//:Container(),
        //const MySeparator(color: Colors.grey),
        SizedBox(height: 5,),

      ],
    );
  }
}

