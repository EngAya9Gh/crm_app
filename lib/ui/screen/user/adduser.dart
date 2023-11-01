import 'package:crm_smart/constants.dart';
import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_ditributors_action.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../labeltext.dart';
import '../../../model/maincitymodel.dart';
import '../../../view_model/maincity_vm.dart';

class addUser extends StatefulWidget {
  const addUser({Key? key}) : super(key: key);

  @override
  _addUserState createState() => _addUserState();
}

class _addUserState extends State<addUser> {
  //final controllerUsers = Get.find<AllUserVMController>();

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  late final controllerUsers;

  String? namemanage = '1';

  //var _list=_maptext.to;
  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      // controllerUsers= Provider.of<user_vm_provider>
      //   (context,listen: false).userall!;
      Provider.of<level_vm>(context, listen: false).getlevel();
      // Provider.of<level_vm>(context, listen: false).get_periorty();
      Provider.of<manage_provider>(context, listen: false).getmanage();

      //Provider.of<regoin_vm>(context,listen: false).getregoin();
      Provider.of<RegionProvider>(context, listen: false).changeValuser(null);
    });

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    descriptionController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // Provider.of<regoin_vm>(context,listen: false).getregoin();
    // Provider.of<level_vm>(context,listen: false).getlevel();
    //
    // context.read<user_vm_provider>() .
    context.read<MainCityProvider>()
      ..changeitemlist([], isInit: true)
      ..getmaincity();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Provider.of<regoin_vm>(context,listen: true).getregoin();

    // controllerUsers=Provider.of<user_vm_provider>(context,listen: true).userall;

    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kWhiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<LoadProvider>(context).isLoadingAddUser,
          child: SingleChildScrollView(
            child: ContainerShadows(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 25, right: 10, left: 10, bottom: 35), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),

              margin: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  //textDirection: TextDirection.rtl,

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RowEdit(name: 'Name', des: '*'),
                    SizedBox(
                      height: 2,
                    ),
                    EditTextFormField(
                      hintText: 'Name',
                      obscureText: false,
                      controller: nameController,
                      vaild: (value) {
                        if (value?.trim() == null || value?.trim() == '') {
                          return "هذا الحقل مطلوب.";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 2,
                    ),

                    RowEdit(name: 'Email', des: '*'),
                    SizedBox(
                      height: 2,
                    ),
                    EditTextFormField(
                      vaild: (data) {
                        if (data?.trim() == null || data?.trim() == '') {
                          return "هذا الحقل مطلوب.";
                        } else {
                          if (!data!.validateEmail) {
                            return "من فضلك أدخل بريد الكتروني صحيح.";
                          }
                          return null;
                        }
                        // if (!validateEmail2(data.toString())) {
                        //   return "أدخل ايميل صحيح";
                        // }
                      },
                      hintText: 'Email',
                      obscureText: false,
                      controller: emailController,
                    ),

                    SizedBox(
                      height: 15,
                    ),
                    RowEdit(name: label_manage, des: '*'),
                    Consumer<manage_provider>(builder: (context, mangelist, child) {
                      return DropdownButtonFormField(
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
                        validator: (value) {
                          if (value == null) {
                            return "هذا الحقل مطلوب.";
                          }

                          return null;
                        },
                      );
                    }),
                    // DropdownButton(
                    //   isExpanded: true,
                    //   hint: Text("حددالإدارة"),
                    //   items: listtext.map(
                    //           (level_one) {
                    //     return DropdownMenuItem(
                    //
                    //       child: Text(level_one), //label of item
                    //       value: level_one, //value of item
                    //     );
                    //   }).toList(),
                    //   value:namemanage,
                    //   onChanged:(value){
                    //   setState(() {
                    //     namemanage=value.toString();
                    //   });
                    //   },
                    // ),
                    // EditTextFormField(
                    //   hintText: label_manage,
                    //   obscureText: false,
                    //   controller: descriptionController,
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    RowEdit(name: label_level, des: '*'),

                    Consumer<level_vm>(
                      builder: (context, cart, child) {
                        return DropdownButtonFormField(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.listoflevel_periorty.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.nameLevel), //label of item
                              value: level_one.idLevel, //value of item
                            );
                          }).toList(),
                          value: cart.selectedValueLevel,
                          onChanged: (value) {
                            //  setState(() {
                            cart.changeVal(value.toString());
                            // });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "هذا الحقل مطلوب.";
                            }

                            return null;
                          },
                        );
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    //admin
                    RowEdit(name: 'الفرع', des: '*'),
                    //RegoinCombox(
                    //   selected: _selectedregoin,
                    //   onChanged:
                    //     (value) {
                    //   _selectedregoin=value.toString();
                    //
                    // },
                    //),
                    Consumer<RegionProvider>(
                      builder: (context, cart, child) {
                        return DropdownButtonFormField(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.listRegion.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.regionName), //label of item
                              value: level_one.regionId, //value of item
                            );
                          }).toList(),
                          value: cart.selectedValueuser,
                          onChanged: (value) {
                            //  setState(() {
                            cart.changeValuser(value.toString());
                            // });
                          },
                          validator: (value) {
                            if (value == null) {
                              return "هذا الحقل مطلوب.";
                            }

                            return null;
                          },
                        );
                      },
                    ),
                    //manage
                    SizedBox(
                      height: 15,
                    ),
                    RowEdit(name: 'المناطق', des: ''),
                    Consumer<MainCityProvider>(
                      builder: (context, cart, child) {
                        return DropdownSearch<MainCityModel>.multiSelection(
                          mode: Mode.DIALOG,
                          filterFn: (user, filter) => user!.getfilteruser(filter!),
                          compareFn: (item, selectedItem) => item?.id_maincity == selectedItem?.id_maincity,
                          items: cart.listmaincityfilter,
                          showSelectedItems: true,
                          selectedItems: cart.selecteditemmaincity,
                          itemAsString: (u) => u!.userAsString(),
                          onChanged: (data) {
                            cart.changeitemlist(data);
                          },
                          showSearchBox: true,
                          dropdownSearchDecoration: InputDecoration(
                            isCollapsed: true,
                            hintText: 'المنطقة',
                            alignLabelWithHint: true,
                            fillColor: Colors.grey.withOpacity(0.2),
                            contentPadding: EdgeInsets.all(0),
                            border: UnderlineInputBorder(borderSide: const BorderSide(color: Colors.grey)),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    RowEdit(name: label_mobile, des: '*'),
                    EditTextFormField(
                      hintText: '+966000000000',
                      obscureText: false,
                      controller: mobileController,
                      vaild: (value) {
                        if (value?.trim() == null || value?.trim() == '') {
                          return "هذا الحقل مطلوب.";
                        }
                        return null;
                      },
                      inputType: TextInputType.phone,
                      maxLength: 15,
                      inputformate: [FilteringTextInputFormatter.digitsOnly],
                    ),
                    //RowEdit(name: 'Image', des: ''),
                    SizedBox(
                      height: 35,
                    ),
                    //show chose image
                    Center(
                      child: custom_button_new(
                        // style: ButtonStyle(backgroundColor:Color(Colors.lightBlue)),
                        onpress: () {
                          _formKey.currentState!.save();
                          final validate = _formKey.currentState!.validate();
                          if (!validate) {
                            return;
                          }

                          final selectedRegion = context.read<MainCityProvider>().selecteditemmaincity;
                          final selectedMainCityIds = selectedRegion.map((e) => e.id_maincity).toList();
                          bool hasChanges = selectedMainCityIds.isNotEmpty;

                          String? regoin = Provider.of<RegionProvider>(context, listen: false).selectedValueuser;
                          String? regoinname = regoin == null
                              ? ""
                              : Provider.of<RegionProvider>(context, listen: false)
                                  .listRegion
                                  .firstWhere((element) => element.regionId == regoin)
                                  .regionName;

                          String? level = Provider.of<level_vm>(context, listen: false).selectedValueLevel;
                          String levelname = Provider.of<level_vm>(context, listen: false)
                              .listoflevel
                              .firstWhere((element) => element.idLevel == level)
                              .nameLevel;

                          String? id_country =
                              Provider.of<UserProvider>(context, listen: false).currentUser.fkCountry;
                          if (level != null &&
                              emailController.text.toString().trim().isNotEmpty &&
                              nameController.text.toString().trim().isNotEmpty &&
                              mobileController.text.toString().trim().isNotEmpty) {
                            Provider.of<LoadProvider>(context, listen: false).changeboolValueUser(true);
                            Map<String, String?> body = {
                              "nameUser": nameController.text,
                              'email': emailController.text != null ? emailController.text : "",
                              'mobile': mobileController.text != null ? mobileController.text : "",
                              'fk_country': id_country,
                              'type_administration': namemanage,
                              // != null
                              // ? namemanage
                              // : "",
                              'type_level': level,
                              'name_level': levelname,
                              'name_regoin': regoinname,
                              'fkuserAdd':
                                  Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString(),
                              'fk_regoin': regoin != null ? regoin : "null",
                            };
                            Provider.of<UserProvider>(context, listen: false)
                                .addUserVm(body, hasChanges ? _getMainCityParams(selectedMainCityIds) : "",selectedRegion.map((e) => e.asUserRegion()).toList())
                                .then((value) => value != "repeat" ? clear() : error());
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(SnackBar(content: Text('تأكد من الخيارات من فضلك')));
                          }
                        },
                        text:
                            //Text(
                            'إضافة الموظف ',
                        // style: TextStyle(color: kMainColor),
                        //)
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getMainCityParams(List<String> regionFks) {
    final StringBuffer stringBuffer = StringBuffer();
    regionFks.forEach((element) {
      stringBuffer.write("maincity_fks[]=$element");
      if (element != regionFks.last) {
        stringBuffer.write("&");
      }
    });
    return stringBuffer.toString();
  }

  void error() {
    Provider.of<LoadProvider>(context, listen: false).changeboolValueUser(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الموظف مضاف مسبقاً')));
  }

  void clear() {
    Provider.of<LoadProvider>(context, listen: false).changeboolValueUser(false);
    // controllerUsers.add(
    //     UserModel.fromJson( body)
    // );
    descriptionController.text = "";
    nameController.text = "";
    mobileController.text = "";
    emailController.text = "";
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(label_Addeduser)));
    Navigator.pop(context);
  }
}
