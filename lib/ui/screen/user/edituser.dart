import 'package:crm_smart/model/managmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/provider/selected_button_provider.dart';
import 'package:crm_smart/services/UserService.dart';
import 'package:crm_smart/ui/widgets/combox_widget/levelcombox.dart';
import 'package:crm_smart/ui/widgets/combox_widget/manage_widget.dart';
import 'package:crm_smart/ui/widgets/combox_widget/regoincombox.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/country_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/privilge_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import 'package:get/get.dart';
import 'dart:io';
class EditUser extends StatefulWidget {
  UserModel userModel;
  //final int index;
  EditUser(
      {
        //required this.index,
      required this.userModel,
      Key? key})
      : super(key: key);

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  //final controllerUsers = Get.find<AllUserVMController>();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   String? namemanage, fklevel, fkregoin = "";
   String? regoinname,levelname;
   String isAcive='1';
 // late List<UserModel>   controllerUsers=[];
  @override void dispose() {
    super.dispose();
    descriptionController.dispose();
    mobileController.dispose();
    emailController.dispose();

  }
  @override void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      // controllerUsers= Provider.of<user_vm_provider>
      //   (context,listen: false).userall!;
       Provider.of<level_vm>(context,listen: false).getlevel();
       Provider.of<manage_provider>(context,listen: false).getmanage();
       //Provider.of<regoin_vm>(context,listen: false).getregoin();
    }
    );

    super.didChangeDependencies();
  }
  @override
  void initState() {

    // Provider.of<level_vm>(context,listen: false).getlevel();
    //
    // Provider.of<level_vm>(context,listen: false).listoflevel;
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    //
    // });
    // Provider.of<regoin_vm>(context,listen: false).getregoin();
    //
    // Provider.of<level_vm>(context,listen: false).getlevel();
    WidgetsBinding.instance!.addPostFrameCallback((_){

      // Add Your Code here.
      namemanage =
      // controllerUsers[widget.index]
      widget.userModel.typeAdministration.toString();
      Provider.of<manage_provider>(context, listen: false)
          .changevalue(namemanage!);
      //
      // Provider.of<manage_provider>(context,listen: false)
      //     .changevalue(widget.userModel.typeAdministration.toString());
      // namemanage=widget.userModel.typeAdministration.toString();

      print("after manage provider in main");
      emailController.text =
      //controllerUsers[widget.index]
      widget.userModel.email.toString();

      mobileController.text =
      //controllerUsers[widget.index]
      widget.userModel.mobile.toString();
      regoinname= widget.userModel.nameRegoin;
      levelname=widget.userModel.name_level;
      Provider.of<level_vm>(context,listen: false).changeVal(
          widget.userModel.typeLevel.toString());
      print("level inside build main screen"+ widget.userModel.typeLevel.toString() );
      // Provider.of<level_vm>(context,listen: false).selectedValueLevel =
      // //controllerUsers[widget.index]
      // widget.userModel.typeLevel.toString();
      Provider.of<regoin_vm>(context,listen: false)
          .changeValuser( widget.userModel.fkRegoin);

      print( widget.userModel.fkRegoin.toString());

      print('ddjksnsjncmdn');
      //print(widget.index);

      setState(() {
        isAcive=widget.userModel.isActive;
      });
      print("init");
    });



    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      //   controllerUsers= Provider.of<user_vm_provider>
      // (context,listen: true).userall;
    //WidgetsBinding.instance?.addPostFrameCallback((_) {


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [

          IconButton(
            onPressed: () {
              fkregoin = Provider.of<regoin_vm>(context, listen: false)
                  .selectedValueuser;
              fklevel = Provider.of<level_vm>(context, listen: false)
                  .selectedValueLevel;
              regoinname=
                  fkregoin==null?"":
                  Provider.of<regoin_vm>(context, listen: false)
                  .listregoin.firstWhere((element) => element.id_regoin==fkregoin).name_regoin;

              levelname=Provider.of<level_vm>(context, listen: false)
              .listoflevel.firstWhere((element) => element.idLevel==fklevel).nameLevel;

              //String id_country=Provider.of<country_vm>(context,listen: false).id_country;
              print("level in update button" + levelname.toString());
              print("regoin in update button" + regoinname.toString());
              if (levelname != null &&
                  emailController.text.toString().trim().isNotEmpty) {
                // Provider.of<LoadProvider>(context, listen: false)
                //     .changeboolUpdateUser(true);
                Map<String,String?> body = {
                  'email': emailController.text != null
                      ? emailController.text
                      : "",
                  'mobile': mobileController.text != null
                      ? mobileController.text
                      : "",
                  //'fk_country': id_country,
                  'type_administration':
                  namemanage ,//!= null ? namemanage : "",
                  'type_level': fklevel,
                  'fk_regoin': fkregoin != null ? fkregoin : "null",
                  'name_regoin':regoinname,
                  'name_level' :levelname,
                  'isActive' :isAcive,
                };
              Provider.of<user_vm_provider>(context,listen: false)
                  .updateuser_vm(body,
                 // controllerUsers[widget.index]
                  widget.userModel.idUser,null
                  // Provider.of<user_vm_provider>(context,listen: false)
                  //     .currentUser!.path!.isNotEmpty?
                  // File(
                  //     Provider.of<user_vm_provider>(context,listen: false)
                  //     .currentUser!.path!):null
              );
                    //.then((value) => value != "error" //   ?
                  clear(body);
                   // : error());
              } else {
                _scaffoldKey.currentState!.showSnackBar(SnackBar(
                    content: Text('حدد مستوى للصلاحية من فضلك')));
              }
            },
            icon: const Icon(Icons.check,color: kWhiteColor,),
          )
        ],
        title: const Text(' ',style: TextStyle(color: kWhiteColor),),
        centerTitle: true,
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<user_vm_provider>(context,listen: true).isupdate,//Provider.of<LoadProvider>(context).isLoadingUpdateUser,
        child: SingleChildScrollView(
          child: ContainerShadows(
            width: double.infinity,
            padding:
            EdgeInsets.only(
                top: 50,right: 20,left: 20,bottom: 50), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            margin: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 50,bottom: 10
            ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RowEdit(name: 'Email', des: ''),
                    SizedBox(height: 2,),

                    EditTextFormField(
                      hintText: 'Email',
                      obscureText: false,
                      controller: emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RowEdit(name: label_manage, des: ''),

                    Consumer<manage_provider>(builder: (context, mangelist, child) {
                      return DropdownButton(
                        isExpanded: true,
                        hint: Text("حددالإدارة"),
                        items: mangelist.listtext.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.name_mange), //label of item
                            value: level_one.idmange, //value of item
                          );
                        }).toList(),
                        value: mangelist.selectedValuemanag,
                        onChanged: (value) {
                          namemanage = value.toString();
                          mangelist.changevalue(value.toString());
                        },
                      );
                    }),
                    SizedBox(
                      height: 20,
                    ),
                    RowEdit(name: label_level, des: 'Required'),
                    //mangwidget(),
                    Consumer<level_vm>(
                      builder: (context, cart, child){
                        return DropdownButton(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.listoflevel.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.nameLevel), //label of item
                              value: level_one.idLevel, //value of item
                            );
                          }).toList(),
                          value:cart.selectedValueLevel,
                          onChanged:(value) {
                           // name_level=
                            //  setState(() {
                            cart.changeVal(value.toString());
                            // });
                          },
                        );},
                    ),
                    // levelCombox(
                    //   selected: level,
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                    //admin
                    RowEdit(name: 'الفرع', des: 'Required'),
                    Consumer<regoin_vm>(
                      builder: (context, cart, child){
                        return DropdownButton(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.listregoin.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.name_regoin), //label of item
                              value: level_one.id_regoin, //value of item
                            );
                          }).toList(),
                          value:cart.selectedValueuser,
                          onChanged:(value) {
                            //  setState(() {
                            cart.changeValuser(value.toString());
                            // });
                          },
                        );},
                    ),
                    // RegoinCombox(
                    //   selected: regoin,
                    // ),
                    //manage
                    SizedBox(
                      height: 20,
                    ),
                    RowEdit(name: label_mobile, des: 'Required'),
                    EditTextFormField(
                      hintText: '+966000000000',
                      obscureText: false,
                      controller: mobileController,
                    ),
                    //RowEdit(name: 'Image', des: ''),
                    SizedBox(
                      height:20,
                    ),
                   // Consumer<selected_button_provider>(
                     //   builder: (context, selectedProvider, child) {
                         // return
                            GroupButton(
                              controller: GroupButtonController(
                                selectedIndex:int.parse(isAcive),
                                //selectedProvider.isSelectedtypeinstall,
                                // typeinstallController==null
                                //     ? 0 :
                                // int.tryParse( typeinstallController!)
                              ),
                              options: GroupButtonOptions(
                                  buttonWidth: 110,
                                selectedColor: kMainColor,
                                  borderRadius: BorderRadius.circular(10)),
                              buttons: ['غير نشط','نشط'],
                              onSelected: (index,isselected) {
                                print(index);
                                setState(() {
                                isAcive=index.toString();
                                //selectedProvider.selectValuetypeinstall(index);
                                  });
                              }
                          ),
                       // }),
                    //show chose image

                    // Center(
                    //   child: TextButton(
                    //       // style: ButtonStyle(backgroundColor:Color(Colors.lightBlue)),
                    //       onPressed: () {
                    //
                    //       },
                    //       child: Text(
                    //         'تعديل ',
                    //         style: TextStyle(color: kMainColor),
                    //       )),
                    // )
                  ],
                ),
              ),

          ),
        ),
      ),
    );
    //});
  }

  clear(body) {
    //label_Edituser
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changeboolUpdateUser(false);
//     final index = Provider.of<user_vm_provider>(context, listen: false)
//         .userall.indexWhere(
//             (element) =>
//         element.idUser ==widget.userModel.idUser );
// widget.userModel=Provider.of<user_vm_provider>(context, listen: false)
//     .userall[index];
    // descriptionController.text = "";
    // mobileController.text = "";
    // emailController.text = "";
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_Edituser)));
    Navigator.pop(context);
  }

  error() {
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changeboolUpdateUser(false);
    _scaffoldKey.currentState!
        .showSnackBar(SnackBar(content: Text(label_errorAddProd)));
    Navigator.pop(context);
  }
}
