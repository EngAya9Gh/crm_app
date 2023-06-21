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
import 'package:crm_smart/view_model/activity_vm.dart';
import 'package:crm_smart/view_model/all_user_vm.dart';
import 'package:crm_smart/view_model/client_vm.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../constantsList.dart';
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
  final TextEditingController descActivController = TextEditingController();

  final TextEditingController nameEnterpriseController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  // final TextEditingController typejobController = TextEditingController();
  final TextEditingController address_client = TextEditingController();

  String? cityController;

  String? presystem = '';

  String? sourclient = '';

  String? presystemcomb;

  final TextEditingController locationController = TextEditingController();

  final TextEditingController regoinController = TextEditingController();

  @override
  void dispose() {
    nameclientController.dispose();
    nameEnterpriseController.dispose();
    mobileController.dispose();
    // typejobController.dispose();
    locationController.dispose();
    regoinController.dispose();
    address_client.dispose();
    descActivController.dispose();
    phoneController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Provider.of<maincity_vm>(context, listen: false).getcityAll();
      await Provider.of<activity_vm>(context, listen: false).getactv();
      await Provider.of<company_vm>(context, listen: false).getcompany();

      Provider.of<maincity_vm>(context, listen: false).changevalue(null);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              textDirection: myui.TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 10),
                child: Column(
                  children: [
                    RowEdit(name: label_cliententerprise, des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      obscureText: false,
                      hintText: label_cliententerprise,
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return label_empty;
                        }
                      },
                      inputformate: [FilteringTextInputFormatter.allow(RegExp(r'''/^[a-zA-Z]+$/'''))],
                      controller: nameEnterpriseController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: label_clientname, des: '*'),
                    SizedBox(height: 5),
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
                    SizedBox(height: 15),
                    RowEdit(name: label_clientmobile, des: '*'),
                    SizedBox(height: 5),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return label_empty;
                        }
                      },
                      hintText: '00966000000000',
                      obscureText: false,
                      controller: mobileController,
                      inputType: TextInputType.phone,
                      maxLength: 15,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: label_client_typejob, des: '*'),
                    SizedBox(height: 5),
                    Consumer<activity_vm>(
                      builder: (context, cart, child) {
                        return SizedBox(
                          //width: 240,
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(width: 2, color: Colors.grey))),

                            isExpanded: true,
                            //hint: Text("حدد حالة العميل"),
                            items: cart.list_activity.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one.name_activity_type), //label of item

                                value: level_one.id_activity_type, //value of item
                              );
                            }).toList(),
                            value: cart.selectedValueOut,
                            onChanged: (value) {
                              //  setState(() {
                              cart.changevalueOut(value.toString());
                              // });
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'وصف النشاط', des: '*'),
                    EditTextFormField(
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return label_empty;
                        }
                      },
                      hintText: label_desc_activ,
                      obscureText: false,
                      controller: descActivController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: label_clientcity, des: '*'),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Consumer<maincity_vm>(
                        builder: (context, cart, child) {
                          return DropdownSearch<CityModel>(
                            mode: Mode.DIALOG,
                            label: "المدن",
                            validator: (val) {
                              if (val == null) return 'من فضلك حدد اسم مدينة';
                            },
                            filterFn: (user, filter) => user!.getfilteruser(filter!),
                            items: cart.listcity,
                            itemAsString: (u) => u!.userAsString(),
                            onChanged: (data) => cityController = data!.id_city,
                            //print(data!.nameUser),
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
                    SizedBox(height: 15),
                    RowEdit(name: label_usernameclient, des: '*'),
                    EditTextFormField(
                      hintText: label_usernameclient,
                      obscureText: false,
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return label_empty;
                        }
                      },
                      controller: address_client,
                      //اسم المؤسسة
                      label: label_usernameclient,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: label_clientlocation, des: ''),
                    EditTextFormField(
                      hintText: 'location',
                      obscureText: false,
                      controller: locationController,
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'رقم آخر', des: ' '),
                    SizedBox(height: 5),
                    EditTextFormField(
                      hintText: '+0',
                      obscureText: false,
                      controller: phoneController,
                      inputType: TextInputType.phone,
                      maxLength: 15,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'مصدر العميل', des: '*'),
                    DropdownButtonFormField<String?>(
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(width: 2, color: Colors.grey))),
                      isExpanded: true,
                      items: list_sourcclient.map((level_one) {
                        return DropdownMenuItem(
                          child: Text(level_one), //label of item

                          value: level_one, //value of item
                        );
                      }).toList(),
                      value: presystemcomb,
                      onChanged: (value) {
                        setState(() {
                          sourclient = value.toString();
                        });
                      },
                      validator: (value) {
                        if (value?.trim().isEmpty ?? true) {
                          return "هذا الحقل مطلوب";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    RowEdit(name: 'نظام سابق', des: ' '),
                    Consumer<company_vm>(
                      builder: (context, cart, child) {
                        return SizedBox(
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(width: 2, color: Colors.grey))),
                            isExpanded: true,
                            items: cart.list_company.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one.name_company.toString()), //label of item

                                value: level_one.id_Company, //value of item
                              );
                            }).toList(),
                            value: cart.selectedValueOut,
                            onChanged: (value) {
                              //  setState(() {
                              cart.changevalueOut(value.toString());
                              // });
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),

                    Center(
                      child: custom_button_new(
                        text: label_clientadd,
                        onpress: () async {
                          if (_globalKey.currentState!.validate() &&
                              Provider.of<activity_vm>(context, listen: false).selectedValueOut != null &&
                              sourclient != '') {
                            _globalKey.currentState!.save();
                            Provider.of<LoadProvider>(context, listen: false).changebooladdclient(true);
                            UserModel _user = Provider.of<user_vm_provider>(context, listen: false).currentUser;
                            Provider.of<client_vm>(context, listen: false).addclient_vm({
                              'descActivController': descActivController.text,
                              'name_client': nameclientController.text,
                              'address_client': address_client.text,
                              'name_enterprise': nameEnterpriseController.text,
                              'type_job': 'type',
                              'city': cityController.toString(),
                              'location': locationController.text.toString(),
                              "fk_regoin": _user.fkRegoin == null ? "null" : _user.fkRegoin,
                              "date_create": DateTime.now().toString(),

                              "type_client": "تفاوض",
                              "fk_user": _user.idUser,
                              "user_add": _user.idUser,
                              // "date_transfer":,
                              'presystem': Provider.of<company_vm>(context, listen: false).selectedValueOut.toString(),
                              'sourcclient': sourclient,
                              'activity_type_fk':
                                  Provider.of<activity_vm>(context, listen: false).selectedValueOut.toString(),
                              "mobile": mobileController.text,
                              "phone": phoneController.text,
                              "ismarketing": sourclient == 'ميداني' ? '0' : '1',
                              //"date_changetype":,
                            }, _user.nameUser.toString(), _user.nameRegoin.toString()).then(
                                (value) => value != "false" ? clear(context) : error(context));
                          }
                        },
                      ),
                    ),
                    SizedBox(height: 3),
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
    Provider.of<LoadProvider>(context, listen: false).changebooladdclient(false);
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
    Provider.of<LoadProvider>(context, listen: false).changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(label_errorAddProd)));
    print("error");
  }

  DateTime _currentDate = DateTime.now();

  final DateFormat formatter = DateFormat('yyyy-MM-dd');
}
