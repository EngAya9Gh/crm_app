
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/userview.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../constants.dart';

class buildCardUsers extends StatelessWidget {
  buildCardUsers({required this.usermodell, Key? key}) : super(key: key);
  UserModel usermodell;
  @override
  Widget build(BuildContext context) {
    print('dd');
    print( usermodell.img_thumbnail.toString().trim().length);
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10, top: 5),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserScreen(
                      userModel: usermodell
                    //index: index,
                  )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                 child:
                 usermodell.img_image.toString().trim().length==0
                     // ||usermodell.img_thumbnail.toString().trim().isEmpty
                      ? usermodell.nameUser.toString().isEmpty||usermodell.nameUser==null
                      ? Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.lightBlueAccent,
                  ) : Text(usermodell.nameUser.toString().substring(0, 1))
                      : ClipRRect(
                   borderRadius: BorderRadius.circular(45),

                   child: CachedNetworkImage(
                       width: 500,height: 500,fit: BoxFit.fill,
                    placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                    imageUrl: usermodell.img_image!,
                  ),
                      ),
                  // CachedNetworkImage(
                  //   progressIndicatorBuilder: (context, url, progress) => Center(
                  //     child: CircularProgressIndicator(
                  //       value: progress.progress,
                  //     ),
                  //   ),
                  //   imageUrl:usermodell.img_image!
                  //    ),
                  //Image.network(usermodell.img_image!, height: 150, width: 150, fit: BoxFit.cover,) ,
                    // :  FileImage(
                    //   File(
                    //   //Provider.of<user_vm_provider>(context,listen: false)
                    //   usermodell.img_thumbnail!)) as Widget ,//as ImageProvider,
                 // backgroundColor: Colors.grey.withOpacity(0.1),
                ),
                SizedBox(width: 15),

              ],
            ),
            Column(
             // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
               Row(
                 // mainAxisAlignment: MainAxisAlignment.start,

                 children: [
                   TextUtilis(
                     color: Colors.black87,
                     fontSize: 30,
                     fontWeight: FontWeight.bold,
                     textstring: usermodell.nameUser.toString(),
                     underline: TextDecoration.none,
                   ),
                 ],
               ),
               Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 //crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   TextUtilis(
                     color: Colors.black87,
                     fontSize: 25,
                     fontWeight: FontWeight.normal,
                     textstring: usermodell.name_mange.toString(),
                     underline: TextDecoration.none,
                   ),

                   // SizedBox(width: 50,),

                 ],
               ),
              ],
            // Icon(
            //   Icons.arrow_back_ios_new_outlined,
            //   color: Colors.black54,
            // ),
           ) ,
             Column(),
             Column(),
             Column(),
             Column(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
            //  mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                 // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtilis(
                      color: Colors.black87,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textstring: usermodell.isActive=='1'?
                      'Active':'unActive',
                      underline: TextDecoration.none,
                    ),
                    SizedBox(width: 5,),
                    usermodell.isActive=='1'?
            const SizedBox(
            width: 15.0,
              height: 15.0,
              child: const DecoratedBox(
                decoration: const BoxDecoration(
                    color: Colors.green
                ),
              ),
            ):
      const SizedBox(
      width: 15.0,
      height: 15.0,
      child: const DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.red
        ),
      ),
    ),


                ],),
                SizedBox(height: 10,),
                Row(
                  children: [
                    usermodell.fkRegoin==null?Text(''): Text(usermodell.nameRegoin.toString(),style: TextStyle(
                        fontFamily: kfontfamily2
                    ),),
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}