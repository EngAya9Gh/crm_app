

import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/screen/config/cityview.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/ui/widgets/widgetcalendar/utils.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import 'dart:ui' as myui;
import 'package:intl/intl.dart';

class addClient extends StatefulWidget {
  addClient({Key? key}) : super(key: key);

  @override
  _addClientState createState() => _addClientState();
}

class _addClientState extends State<addClient> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final _globalKey = GlobalKey<FormState>();

  final TextEditingController nameclientController = TextEditingController();

  final TextEditingController nameEnterpriseController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController typejobController = TextEditingController();

  String? cityController ;

  final TextEditingController locationController = TextEditingController();

  final TextEditingController regoinController = TextEditingController();

  @override void dispose() {
    nameclientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    typejobController.dispose();
    locationController.dispose();
    regoinController.dispose();

    super.dispose();
  }
  @override void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_)async{

    await  Provider.of<maincity_vm>(context,listen: false).getcityAll();
      Provider.of<maincity_vm>(context,listen: false).changevalue(null);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     //final controllerUsers = Get.find<AllUserVMController>();
    //_user=Provider.of<user_vm_provider>(context,listen: true).currentUser!;
    // controllerUsers.getcurrentUser();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kWhiteColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddclient,
        child: SingleChildScrollView(
          child: Form(
            key: _globalKey,
            child: Directionality(
              textDirection: myui.TextDirection.rtl ,
              child: Padding(
                padding: EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                    bottom: 10), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
                // child: ContainerShadows(
                //   width: double.infinity,
                //   //height: 400,
                //   margin: EdgeInsets.only(),
                  child: Column(
                    //textDirection: TextDirection.rtl,

                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      RowEdit(name: label_cliententerprise, des: 'required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        obscureText: false,
                        hintText: label_cliententerprise,
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        controller: nameEnterpriseController, //اسم المؤسسة
                        //label: label_client,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientname, des: 'required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: label_clientname,
                        obscureText: false,
                        controller: nameclientController,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_client_typejob, des: 'Required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        hintText: label_client_typejob,
                        obscureText: false,
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        controller: typejobController, //اسم المؤسسة
                        label: label_client_typejob,
                        onChanged: (val) {
                          // nameprod = val;
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),

                      //admin
                      RowEdit(name: label_clientcity, des: 'Required'),
                      SizedBox(
                        height: 5,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(left: 20.0,right: 8),
                      //   child: Consumer<maincity_vm>(
                      //       builder: (context, cart, child){
                      //         return DropdownButton(
                      //           isExpanded: true,
                      //           hint: Text(label_clientcity),
                      //           items: cart.listcity.map((city) {
                      //             return DropdownMenuItem(
                      //               child: Text(city.name_city), //label of item
                      //               value: city.id_city, //value of item
                      //             );
                      //           }).toList(),
                      //           value:cart.selectedValuemanag,
                      //           onChanged:(value) {
                      //             cityController=value.toString();
                      //           cart.changevalue(value.toString());
                      //           },
                      //         );}
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Consumer<maincity_vm>(
                          builder: (context, cart, child){
                            return  DropdownSearch<CityModel>(
                              mode: Mode.DIALOG,
                              label: "المدن",
                              validator: (val){

                                if(val==null)
                                  return 'من فضلك حدد اسم مدينة';
                              },
                              filterFn: (user, filter) => user!.getfilteruser(filter!),
                              items: cart.listcity,
                              itemAsString:
                                  ( u) => u!.userAsString(),
                              onChanged: (data) =>
                              cityController=data!.id_city,//print(data!.nameUser),
                              showSearchBox: true,
                              dropdownSearchDecoration: InputDecoration(
                                labelText: "حدد مدينة",
                                contentPadding: EdgeInsets.fromLTRB(12, 12, 5, 5),
                                border: OutlineInputBorder(),
                              ),
                            );
                          },
                        ),
                      ),
                      // EditTextFormField(
                      //   vaild: (value) {
                      //     if (value!.isEmpty) {
                      //       return label_empty;
                      //     }
                      //   },
                      //   hintText: label_clientcity,
                      //   obscureText: false,
                      //   controller: cityController,
                      // ),
                      //manage
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientmobile, des: 'Required'),
                      SizedBox(
                        height: 5,
                      ),
                      EditTextFormField(
                        vaild: (value) {
                          if (value!.toString().trim().isEmpty) {
                            return label_empty;
                          }
                        },
                        hintText: '+966000000000',
                        obscureText: false,
                        controller: mobileController,
                      ),
                      //RowEdit(name: 'Image', des: ''),
                      SizedBox(
                        height: 15,
                      ),
                      RowEdit(name: label_clientlocation, des: ''),
                      EditTextFormField(
                        hintText: 'location',
                        obscureText: false,
                        controller: locationController,
                      ),
                      ////////////////////////////////////////////////
                      SizedBox(
                        height: 15,
                      ),
                      // RowEdit(name: label_clientregoin, des: ''),
                      // //show chose image
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // RowEdit(name: label_clientdate, des: ''),
                      //
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // RowEdit(name: label_clientnameuser, des: controllerUsers.currentUser.value.nameUser.toString()),
                      // SizedBox(
                      //   height: 15,
                      // ),
                      // RowEdit(name: label_clienttype, des: "تفاوض"),

                      Center(
                        child: custom_button_new(
                          text: label_clientadd,
                          onpress: () async {

                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();
                                Provider.of<LoadProvider>(
                                    context, listen: false)
                                    .changebooladdclient(true);
                                UserModel _user =
                                    Provider
                                        .of<user_vm_provider>
                                      (context, listen: false)
                                        .currentUser;
                                Provider.of<client_vm>(context, listen: false)
                                    .addclient_vm({
                                  'name_client': nameclientController.text,
                                  'name_enterprise': nameEnterpriseController
                                      .text,
                                  'type_job': typejobController.text,
                                  'city': cityController.toString(),
                                  'location':
                                  // locationController.text==null?"null":
                                  locationController.text.toString(),
                                  "fk_regoin": _user.fkRegoin == null
                                      ? "null"
                                      : _user.fkRegoin,
                                  "date_create": DateTime.now().toString(),

                                  //Utils.toDate22(DateTime.now()),
                                  //,  //formatter.format(_currentDate),
                                  "type_client": "تفاوض",
                                  "fk_user": _user.idUser,
                                  // "date_transfer":,
                                  "mobile": mobileController.text,
                                  //"date_changetype":,
                                }, _user.nameUser.toString(),
                                    _user.nameRegoin.toString()
                                ).then((value) =>
                                value != "false"
                                    ? clear(context)
                                    : error(context)
                                  // Fluttertoast.showToast(
                                  //  backgroundColor:
                                  //      Colors.lightBlueAccent,
                                  //  msg: label_errorAddProd, // message
                                  //  toastLength:
                                  //      Toast.LENGTH_SHORT, // length
                                  //  gravity: ToastGravity.CENTER, //
                                );
                              // }else{
                              //   _scaffoldKey.currentState!.showSnackBar(
                              //       SnackBar(content: Text('من فضلك حدد مدينة')));
                              // }
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 3,),
                    ],
                  ),
               // ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  clear(BuildContext context) {

    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    Navigator.pop(context);

    // nameEnterpriseController.text="";
    // nameclientController.text="";
    // locationController.text="";
    // mobileController.text="";
    // cityController.text="";
    // typejobController.text="";
    // _scaffoldKey.currentState!.showSnackBar(
    //     SnackBar(content: Text(label_Addeduser))
   // );
    print("succ");
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text(label_errorAddProd))
    );
    print("error");
  }

  DateTime _currentDate = DateTime.now();

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
}
