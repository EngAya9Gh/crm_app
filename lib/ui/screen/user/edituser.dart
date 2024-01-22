import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/manage_privilege/presentation/manager/privilege_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_ditributors_action.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../labeltext.dart';
import '../../../model/maincitymodel.dart';
import '../../../provider/manage_provider.dart';
import '../../../view_model/level_vm.dart';
import '../../../view_model/maincity_vm.dart';

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
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String? namemanage, fklevel, fkregoin = "";
  String? regoinname, levelname;
  String isAcive = '1';

  // late List<UserModel>   controllerUsers=[];
  @override
  void dispose() {
    super.dispose();
    descriptionController.dispose();
    mobileController.dispose();
    emailController.dispose();
  }

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: 30)).then((_) async {
      // controllerUsers= Provider.of<user_vm_provider>
      //   (context,listen: false).userall!;
      context.read<PrivilegeCubit>().getLevels(context.read<UserProvider>().currentUser,

      );
      Provider.of<manage_provider>(context, listen: false).getmanage();
      //Provider.of<regoin_vm>(context,listen: false).getregoin();
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    // Provider.of<level_vm>(context,listen: false).getlevel();
    //
    // Provider.of<level_vm>(context,listen: false).listoflevel;
    //  WidgetsBinding.instance.addPostFrameCallback((_) {
    //
    // });
    // Provider.of<regoin_vm>(context,listen: false).getregoin();
    //
    // Provider.of<level_vm>(context,listen: false).getlevel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      namemanage = widget.userModel.typeAdministration.toString();
      Provider.of<manage_provider>(context, listen: false).changevalue(namemanage!);

      context.read<MainCityProvider>().getmaincity(regions: widget.userModel.maincitylist_user);
      emailController.text = widget.userModel.email.toString();

      mobileController.text = widget.userModel.mobile.toString();
      regoinname = widget.userModel.nameRegoin;
      levelname = widget.userModel.name_level;
      namemanage = widget.userModel.typeAdministration;
      context.read<PrivilegeCubit>().onChangeLevelId(widget.userModel.typeLevel.toString());
      Provider.of<RegionProvider>(context, listen: false).changeValuser(widget.userModel.fkRegoin);

      setState(() {
        isAcive = widget.userModel.isActive!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //   controllerUsers= Provider.of<user_vm_provider>
    // (context,listen: true).userall;
    // WidgetsBinding.instance.addPostFrameCallback((_) {

    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            BlocBuilder<PrivilegeCubit, PrivilegeState>(
              builder: (context, state) {
                if (state.levelsState.isLoading) {
                  return SizedBox.shrink();
                }
                if (state.levelsState.isLoading) {
                  return IconButton(
                      onPressed: () =>
                          context.read<PrivilegeCubit>().getLevels(context.read<UserProvider>().currentUser),
                      icon: Icon(Icons.refresh));
                }
                return IconButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    final validate = _formKey.currentState!.validate();
                    if (!validate) {
                      return;
                    }

                    final selectedRegion = context.read<MainCityProvider>().selecteditemmaincity;
                    final oldRegion = widget.userModel.maincitylist_user?.map((e) => e.asMainCity).toList();

                    final selectedMainCityIds = selectedRegion.map((e) => e.id_maincity).toList();
                    final userMainCityIds = oldRegion?.map((e) => e.id_maincity).toList();

                    bool hasChanges;
                    if ((userMainCityIds?.isEmpty ?? true) && selectedMainCityIds.isNotEmpty) {
                      hasChanges = true;
                    } else {
                      hasChanges =
                          !const DeepCollectionEquality.unordered().equals(selectedMainCityIds, userMainCityIds);
                    }

                    fkregoin = Provider.of<RegionProvider>(context, listen: false).selectedValueuser;
                    fklevel = state.selectedLevelId;
                    regoinname = fkregoin == null
                        ? ""
                        : Provider.of<RegionProvider>(context, listen: false)
                            .listRegion
                            .firstWhere((element) => element.regionId == fkregoin)
                            .regionName;

                    levelname =
                        state.levelsState.data.firstWhereOrNull((element) => element.idLevel == fklevel)?.nameLevel;

                    //String id_country=Provider.of<country_vm>(context,listen: false).id_country;

                    if (levelname != null && emailController.text.toString().trim().isNotEmpty) {
                      // Provider.of<LoadProvider>(context, listen: false)
                      //     .changeboolUpdateUser(true);
                      Map<String, String?> body = {
                        'email': emailController.text != null ? emailController.text : "",
                        'mobile': mobileController.text != null ? mobileController.text : "",
                        //'fk_country': id_country,
                        'type_administration': namemanage, //!= null ? namemanage : "",
                        'type_level': fklevel,
                        'fk_regoin': fkregoin != null ? fkregoin : "null",
                        'name_regoin': regoinname,
                        'name_level': levelname,

                        'isActive': isAcive,
                        "updated_at": DateTime.now().toString(),
                        "fkuserupdate": Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString(),
                      };

                      Provider.of<UserProvider>(context, listen: false).updateUserVm(
                          body,
                          // controllerUsers[widget.index]
                          widget.userModel.idUser,
                          null,
                          hasChanges ? selectedRegion.map((e) => e.asUserRegion()).toList() : [],
                          hasChanges ? _getMainCityParams(selectedMainCityIds) : ""
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
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('حدد مستوى للصلاحية من فضلك')));
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    color: kWhiteColor,
                  ),
                );
              },
            )
          ],
          title: const Text(
            ' ',
            style: TextStyle(color: kWhiteColor),
          ),
          centerTitle: true,
        ),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<UserProvider>(context, listen: true)
              .isUpdate, //Provider.of<LoadProvider>(context).isLoadingUpdateUser,
          child: SingleChildScrollView(
            child: ContainerShadows(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 50, right: 20, left: 20, bottom: 50), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RowEdit(name: 'Email', des: '*'),
                    SizedBox(height: 2),
                    EditTextFormField(
                      hintText: 'Email',
                      obscureText: false,
                      controller: emailController,
                      vaild: (value) {
                        if (value?.trim() == null || value?.trim() == '') {
                          return "هذا الحقل مطلوب.";
                        } else {
                          if (!value!.validateEmail) {
                            return "من فضلك أدخل بريد الكتروني صحيح.";
                          }
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 20,
                    ),
                    RowEdit(name: label_level, des: '*'),
                    //mangwidget(),
                    BlocBuilder<PrivilegeCubit, PrivilegeState>(
                      builder: (context, state) {
                        return DropdownButtonFormField(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: state.priorityState.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.nameLevel ?? ''),
                              value: level_one.idLevel,
                            );
                          }).toList(),
                          value: state.selectedLevelId,
                          onChanged: (value) {
                            // name_level=
                            //  setState(() {
                            context.read<PrivilegeCubit>().onChangeLevelId(value.toString());
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
                    // levelCombox(
                    //   selected: level,
                    // ),
                    SizedBox(
                      height: 20,
                    ),

                    //admin
                    RowEdit(name: 'الفرع', des: '*'),
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
                    SizedBox(
                      height: 20,
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
                    // RegoinCombox(
                    //   selected: regoin,
                    // ),
                    //manage
                    SizedBox(
                      height: 20,
                    ),
                    RowEdit(name: label_mobile, des: '*'),
                    EditTextFormField(
                      hintText: '00966000000000',
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
                      height: 20,
                    ),
                    // Consumer<selected_button_provider>(
                    //   builder: (context, selectedProvider, child) {
                    // return
                    GroupButton(
                        controller: GroupButtonController(
                          selectedIndex: int.parse(isAcive),
                          //selectedProvider.isSelectedtypeinstall,
                          // typeinstallController==null
                          //     ? 0 :
                          // int.tryParse( typeinstallController!)
                        ),
                        options: GroupButtonOptions(
                            buttonWidth: 110, selectedColor: kMainColor, borderRadius: BorderRadius.circular(10)),
                        buttons: ['غير نشط', 'نشط'],
                        onSelected: (_, index, isselected) {
                          setState(() {
                            isAcive = index.toString();
                            //selectedProvider.selectValuetypeinstall(index);
                          });
                        }),
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
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(label_Edituser)));
    Navigator.pop(context);
  }

  String _getMainCityParams(List<String> regionFks) {
    final StringBuffer stringBuffer = StringBuffer();
    regionFks.forEach((element) {
      stringBuffer.write("&maincity_fks[]=$element");
    });
    return stringBuffer.toString();
  }

  error() {
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changeboolUpdateUser(false);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(label_errorAddProd)));
    Navigator.pop(context);
  }

  bool validateEmail(String email) => RegExp(
          r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''')
      .hasMatch(email);
}
