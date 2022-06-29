import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/model/targetmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/target/target_user.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/ui/screen/target/target_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class buildCardTarget extends StatelessWidget {
  buildCardTarget({required this.target, Key? key}) : super(key: key);
   TargetModel target;
   final fontsize=20;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TargetUser(
                        target: target,
                      )));
        },
        child: Container(
          height:100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3.0,
                    blurRadius: 5.0)
              ]),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10, right: size * 0.14, left: size * 0.14),
                  child:  CircleAvatar(
                    radius: 30,
                    child:
                     target.img_image.toString().trim().length==0
                    // ||usermodell.img_thumbnail.toString().trim().isEmpty
                        ? target.nameUser.toString().isEmpty||target.nameUser==null
                        ? Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.lightBlueAccent,
                     ) : Text(target.nameUser.toString().substring(0, 1))
                        : ClipRRect(
                      borderRadius: BorderRadius.circular(45),

                      child: CachedNetworkImage(
                        placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                        imageUrl: target.img_image,
                      ),
                    ),

                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding:
                      EdgeInsets.only(left: size * 0.02, right: size * 0.02
                      ,bottom: size*0.03
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextUtilis(
                        color: Colors.amber,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        textstring: target.name_regoin.toString(),
                        underline: TextDecoration.none,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextUtilis(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textstring: target.nameUser.toString(),
                            underline: TextDecoration.none,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          TextUtilis(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            textstring: target.name_level.toString(),
                            underline: TextDecoration.none,
                          )
                        ],
                      ),

                      Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.bold,
                            textstring: 'Target :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.normal,
                            textstring: target.target.toString(),
                            underline: TextDecoration.none,
                          ),
                        ],),
                   target.Q1!=null?Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.bold,
                            textstring: 'Q1 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.normal,
                            textstring: target.Q1.toString(),
                            underline: TextDecoration.none,
                          ),
                        ],
                      ):Container(),
                      target.Q2!=null?    Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.bold,
                            textstring: 'Q2 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.normal,
                            textstring: target.Q2.toString(),
                            underline: TextDecoration.none,
                          ),
                        ],
                      ):Container(),
                      target.Q3!=null? Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.bold,
                            textstring: 'Q3 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.normal,
                            textstring: target.Q3.toString(),
                            underline: TextDecoration.none,
                          ),
                        ],
                      ):Container(),
                      target.Q4!=null?Row(
                        children: [
                          TextUtilis(
                            color: Colors.black,
                            fontSize: double.parse(fontsize.toString()),
                            fontWeight: FontWeight.bold,
                            textstring: 'Q4 :',
                            underline: TextDecoration.none,
                          ),
                          TextUtilis(
                            color: Colors.black38,
                            fontSize:double.parse(fontsize.toString()),
                            fontWeight: FontWeight.normal,
                            textstring: target.Q4.toString(),
                            underline: TextDecoration.none,
                          ),
                        ],
                      ):Container(),
                    ],
                  ),
                ),


                // Directionality(
                //   textDirection: TextDirection.ltr,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //
                //     ],
                //   ),
                // )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
