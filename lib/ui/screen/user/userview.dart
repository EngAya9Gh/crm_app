
import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/user/image_profile.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_uitil.dart';

import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/user_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../function_global.dart';
import 'editprofile.dart';
import 'edituser.dart';

class UserScreen extends StatefulWidget {
  final UserModel userModel;
  //final int index;
  String? ismyprofile;
  UserScreen({
    this.ismyprofile,
     required this.userModel,
    //required this.index,
    Key? key,
  }) : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late int index;
  late var controllerUser;
  @override void initState() {
     index = Provider.of<user_vm_provider>(context,listen: false)
         .userall.indexWhere(
            (element) =>
        element.idUser ==widget.userModel.idUser );
     //controllerUser =Provider.of<user_vm_provider>(context,listen: false);
    ;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool isupdate=
    UserModel useredit=  Provider.of<user_vm_provider>
      (context,listen: true).userall[index];
    //return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            //edit_profile(),
            //
            //                        fullscreenDialog: true,
          widget.ismyprofile!=null?
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          edit_profile()));
                },
                icon:
                const Icon(Icons.edit,
                  color: kWhiteColor,)):
            Provider.of<privilge_vm>(context,listen: true)
                .checkprivlge('50')==true ?
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>
                          EditUser(
                              userModel:useredit//widget.userModel
                            //index: widget.index,
                          )));
                  //
                  // Get.to(() => EditUser(
                  //   index: index,
                  //   //userModel: controllerUsers.usersList[index],
                  // ));
                },
                icon:
                const Icon(Icons.edit,
                  color: kWhiteColor,)):Container(),

          ],
          title: TextUtilis(
            color: Colors.white,
            fontSize: 35,
            fontWeight: FontWeight.bold,
            textstring: useredit.nameUser.toString(),
            //widget.userModel.nameUser.toString(),
            underline: TextDecoration.none,
          ),
          backgroundColor: kMainColor,
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: ContainerShadows(

              padding: EdgeInsets.only(
                  top: 15,right: 1,left: 1,bottom: 5), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),

              margin: EdgeInsets.only(
                  left: 1,
                  right: 1,
                  top: 20,bottom: 20
              ),
              width: double.infinity,
              //height: 500,
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child:
                            Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 5,bottom: 5
                          ),
                          child:
                          CircleAvatar(
                              radius: 60.0,
                              child:
                              useredit.img_image!.isNotEmpty
                                  ?
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),

                                child: CachedNetworkImage(
                                    width: 500,height: 500,fit: BoxFit.fill,
                                    progressIndicatorBuilder: (context, url, progress) =>
                                        Center(
                                    child: CircularProgressIndicator(
                                      value: progress.progress,
                                    ),
                                  ),
                                  imageUrl:
                                  useredit.img_image!  ),
                              )
                              // Image.network(
                              //   useredit.img_image! ,
                              //   //width: 200,height: 200,fit: BoxFit.fill,
                              // )
                              // FileImage(
                              //     File(Provider.of<user_vm_provider>(context,listen: true).currentUser!.img_image!))
                              //     as ImageProvider
                                  :Text(useredit.nameUser
                                  .toString()
                                  .substring(0, 1))),
                           //ImageProfile(),
                        ),
                        Expanded(
                          child:
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: RowEdit(
                                          des:
                                          //controllerUser.userall![widget.index]
                                          useredit.name_mange
                                              .toString(),
                                          name: 'الإدارات',
                                        ),
                                      )),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: RowEdit(
                                          des:
                                          //controllerUser.userall![widget.index]
                                          useredit.nameRegoin.toString() ==
                                              "null"
                                              ? ""
                                              :
                                          //controllerUser.userall![widget.index]
                                          useredit.nameRegoin.toString(),
                                          name: 'المنطقة',
                                        ),
                                      )),

                                  SizedBox(
                                    height: 10,
                                  ),
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: RowEdit(
                                          des:
                                          //controllerUser.userall![widget.index]
                                          useredit.name_level.toString(),
                                          name: 'المستوى',
                                        ),
                                      )),

                                  SizedBox(
                                    height: 10,
                                  ),

                                  // RowWidget(
                                  //   name: 'Added by',
                                  //   des: 'added',
                                  // ),
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: RowEdit(
                                          des:
                                          //controllerUser.userall![widget.index]
                                          useredit.isActive=="1"?'نشط':'غير نشط',
                                          name: 'الحالة',
                                        ),
                                      )),
                                  SizedBox(height: 10,),

                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextUtilis(
                                              color: Colors.black,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              textstring:
                                              //controllerUser.userall![widget.index]
                                              useredit.email.toString(),
                                              underline: TextDecoration.none,
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                // controllerUser.onPressEmail(
                                                //     controllerUser.userall!index].email.toString());
                                                //
                                              },
                                              icon: const Icon(
                                                Icons.email,
                                                size: 20,
                                                color: kMainColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextUtilis(
                                              color: Colors.black,
                                              fontSize: 35,
                                              fontWeight: FontWeight.bold,
                                              textstring: 'الهاتف',
                                              underline: TextDecoration.none,
                                            ),
                                            TextButton(
                                              onPressed: () async {
                                                await FlutterPhoneDirectCaller
                                                    .callNumber(useredit.mobile.toString());
                                              },
                                              // onPressed: () async {
                                              //   controllerUser.onPressPhone(
                                              //       controllerUser.userall![index].mobile.toString());
                                              // },
                                              child:
                                              Text( useredit.mobile.toString(),
                                                style: TextStyle(

                                                ),
                                              ),

                                            ),
                                          ],
                                        ),
                                      )),

                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: RowEdit(
                                          des:
                                          //controllerUser.userall![widget.index]
                                          getnameshort(useredit.nameuserAdd.toString()),
                                          name: 'تمت الإضافة من قبل ',
                                        ),
                                      )),
                                  SizedBox(height: 10,),
                                  ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: RowEdit(
                                          des:
                                          //controllerUser.userall![widget.index]
                                          useredit.created_at.toString(),
                                          name: 'تاريخ الإضافة',
                                        ),
                                      )),
                                  SizedBox(height: 10,),
                                ],
                              ),
                            ),
                          ),
                          //info(context),
                          // child: ListView.separated(
                          //   controller: scrollController,
                          //   itemCount: 6,
                          //   separatorBuilder: (context, index) => const Padding(
                          //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                          //     child: Divider(
                          //       color: Colors.grey,
                          //       thickness: 1,
                          //     ),
                          //   ),
                          //   itemBuilder: (context, index) {
                          //      return infoUser(name: userModel.nameUser.toString());
                          //   },
                          // ),
                        ),
                      ],
                    ),

                ),
              ),
            ),
          ),
        ),
      );
   // });
  }

  // Widget info(context) {
  //  // var controllerUser =Provider.of<user_vm_provider>(context,listen: false);
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
  //     child: Column(
  //       children: [
  //         ContainerShadows(
  //             width: double.infinity,
  //             height: 50,
  //             margin: EdgeInsets.only(),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 10,
  //                 right: 10,
  //               ),
  //               child: RowEdit(
  //                 des:
  //                 //controllerUser.userall![widget.index]
  //                 useredit.typeAdministration
  //                     .toString(),
  //                 name: 'الإدارات',
  //               ),
  //             )),
  //
  //         SizedBox(
  //           height: 10,
  //         ),
  //         ContainerShadows(
  //             width: double.infinity,
  //             height: 50,
  //             margin: EdgeInsets.only(),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 10,
  //                 right: 10,
  //               ),
  //               child: RowEdit(
  //                 des:
  //                 //controllerUser.userall![widget.index]
  //                 useredit.nameRegoin.toString() ==
  //                     "null"
  //                     ? ""
  //                     :
  //                   //controllerUser.userall![widget.index]
  //                 useredit.nameRegoin.toString(),
  //                 name: 'المنطقة',
  //               ),
  //             )),
  //
  //         SizedBox(
  //           height: 10,
  //         ),
  //         ContainerShadows(
  //             width: double.infinity,
  //             height: 50,
  //             margin: EdgeInsets.only(),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 10,
  //                 right: 10,
  //               ),
  //               child: RowEdit(
  //                 des:
  //                 //controllerUser.userall![widget.index]
  //                 useredit.name_level.toString(),
  //                 name: 'المستوى',
  //               ),
  //             )),
  //
  //         SizedBox(
  //           height: 10,
  //         ),
  //
  //         // RowWidget(
  //         //   name: 'Added by',
  //         //   des: 'added',
  //         // ),
  //         ContainerShadows(
  //             width: double.infinity,
  //             height: 50,
  //             margin: EdgeInsets.only(),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 10,
  //                 right: 10,
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   TextUtilis(
  //                     color: Colors.black,
  //                     fontSize: 35,
  //                     fontWeight: FontWeight.bold,
  //                     textstring:
  //                     //controllerUser.userall![widget.index]
  //                     useredit.email.toString(),
  //                     underline: TextDecoration.none,
  //                   ),
  //                   IconButton(
  //                     onPressed: () {
  //                       // controllerUser.onPressEmail(
  //                       //     controllerUser.userall!index].email.toString());
  //                       //
  //                     },
  //                     icon: const Icon(
  //                       Icons.email,
  //                       size: 20,
  //                       color: kMainColor,
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             )),
  //
  //         const SizedBox(
  //           height: 10,
  //         ),
  //         ContainerShadows(
  //             width: double.infinity,
  //             height: 50,
  //             margin: EdgeInsets.only(),
  //             child: Padding(
  //               padding: const EdgeInsets.only(
  //                 left: 10,
  //                 right: 10,
  //               ),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   TextUtilis(
  //                     color: Colors.black,
  //                     fontSize: 35,
  //                     fontWeight: FontWeight.bold,
  //                     textstring: 'الهاتف',
  //                     underline: TextDecoration.none,
  //                   ),
  //                   TextButton(
  //                     onPressed: (){},
  //                     // onPressed: () async {
  //                     //   controllerUser.onPressPhone(
  //                     //       controllerUser.userall![index].mobile.toString());
  //                     // },
  //                     child:
  //                       Text( useredit.mobile.toString(),
  //                         style: TextStyle(
  //
  //                         ),
  //                       ),
  //
  //                   ),
  //                 ],
  //               ),
  //             )),
  //
  //         const SizedBox(
  //           height: 10,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
