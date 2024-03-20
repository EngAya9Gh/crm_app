import 'package:crm_smart/constants.dart';
import 'package:flutter/material.dart';

class cardRow extends StatelessWidget {
  cardRow(
      {this.alignment,
      required this.value,
      required this.title,
      this.isExpanded = true,
      Key? key,
      this.withDivider = true})
      : super(key: key);
  var alignment;
  String title;
  String? value;
  bool isExpanded;
  final bool withDivider;

  // bool? isrow=true;
  @override
  Widget build(BuildContext context) {
    if (value == null) return SizedBox.shrink();
    if (value!.isEmpty) return SizedBox.shrink();
    return Column(
      //mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              alignment == null ? MainAxisAlignment.spaceBetween : alignment,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            Flexible(
              child: Text(
                title,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: kfontfamily2,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            //Spacer(flex: 1,),
            isExpanded == true
                ? Expanded(
                    flex: 1,
                    child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          value!,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: kfontfamily2),
                        )))
                : Text(
                    value!,
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontFamily: kfontfamily2),
                  ),
          ],
        ),
        //Spacer(),
        //  isrow==true?
        if (withDivider) ...{
          Divider(
            thickness: 1,
            color: Colors.grey,
          ), //:Container(),
          //const MySeparator(color: Colors.grey),
          SizedBox(
            height: 5,
          ),
        }
      ],
    );
  }
}

// Widget cardRow(String title,String value){
//   return Column(
//
//     children: [
//       Row(
//         mainAxisAlignment: alignment==null? MainAxisAlignment.spaceBetween:alignment,
//         children: [
//           Text(title,style: TextStyle(fontFamily: kfontfamily3),),
//           Spacer(),
//           Text(value,style: TextStyle(fontFamily: kfontfamily2),),
//         ],
//       ),
//       //Spacer(),
//       Divider(thickness: 2,color: Colors.amberAccent,),
//       //const MySeparator(color: Colors.grey),
//       SizedBox(height: 10,),
//
//     ],
//   );
//
// }
