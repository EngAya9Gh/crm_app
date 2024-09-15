import 'package:collection/collection.dart';
import 'package:crm_smart/features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/input_validator.dart';
import '../../../core/common/models/location/region_model.dart';
import '../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../model/usermodel.dart';
import '../../../provider/manage_provider.dart';
import '../../../view_model/maincity_vm.dart';
import '../../../view_model/regoin_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/app_card_row.dart';
import '../../widgets/custom_widget/text_form.dart';

class EditUser extends StatefulWidget {
  final UserModel userModel;

  //final int index;
  const EditUser({
    required this.userModel,
    super.key,
  });

  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
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
      context.read<LevelsCubit>().getLevels();
      Provider.of<manage_provider>(context, listen: false).getManages();
      //Provider.of<regoin_vm>(context,listen: false).getregoin();
    });

    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Add Your Code here.
      namemanage = widget.userModel.typeAdministration.toString();
      Provider.of<manage_provider>(context, listen: false)
          .changevalue(namemanage!);

      context
          .read<MainCityProvider>()
          .getmaincity(regions: widget.userModel.maincitylist_user);
      emailController.text = widget.userModel.email.toString();

      mobileController.text = widget.userModel.mobile.toString();
      regoinname = widget.userModel.nameRegoin;
      levelname = widget.userModel.name_level;
      namemanage = widget.userModel.typeAdministration;

      Provider.of<RegionProvider>(context, listen: false)
          .changeValuser(widget.userModel.fkRegoin);

      setState(() {
        isAcive = widget.userModel.isActive!;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          actions: [
            BlocBuilder<LevelsCubit, LevelsState>(
              builder: (context, state) {
                if (state.getLevelStatus.isLoading()) {
                  return SizedBox.shrink();
                }
                if (state.getLevelStatus.isLoading()) {
                  return IconButton(
                      onPressed: () => context.read<LevelsCubit>().getLevels(),
                      icon: Icon(Icons.refresh));
                }
                return IconButton(
                  onPressed: () {
                    _formKey.currentState!.save();
                    final validate = _formKey.currentState!.validate();
                    if (!validate) {
                      return;
                    }

                    final selectedRegion =
                        context.read<MainCityProvider>().selectedRegions;
                    final oldRegion = widget.userModel.maincitylist_user
                        ?.map((e) => e.asRegion)
                        .toList();

                    final selectedMainCityIds =
                        selectedRegion.map((e) => e.id_maincity).toList();
                    final userMainCityIds =
                        oldRegion?.map((e) => e.id_maincity).toList();

                    bool hasChanges;
                    if ((userMainCityIds?.isEmpty ?? true) &&
                        selectedMainCityIds.isNotEmpty) {
                      hasChanges = true;
                    } else {
                      hasChanges = !const DeepCollectionEquality.unordered()
                          .equals(selectedMainCityIds, userMainCityIds);
                    }

                    fkregoin =
                        Provider.of<RegionProvider>(context, listen: false)
                            .selectedValueuser;
                    // todo: un comment this
                    // fklevel = state.levelsStatus.data
                    //     .firstWhereOrNull(
                    //         (element) => element.idLevel == state.selectedLevelId)
                    //     ?.idLevel;

                    // levelname = state.levelsStatus.data
                    //     .firstWhereOrNull(
                    //         (element) => element.idLevel == fklevel)
                    //     ?.nameLevel;

                    regoinname = fkregoin == null
                        ? ""
                        : Provider.of<RegionProvider>(context, listen: false)
                            .listRegion
                            .firstWhere(
                                (element) => element.branchId == fkregoin)
                            .branchName;

                    //String id_country=Provider.of<country_vm>(context,listen: false).id_country;

                    if (levelname != null &&
                        emailController.text.toString().trim().isNotEmpty) {
                      Map<String, String?> body = {
                        'email': emailController.text,
                        'mobile': mobileController.text,
                        //'fk_country': id_country,
                        'type_administration':
                            namemanage, //!= null ? namemanage : "",
                        'type_level': fklevel,
                        'fk_regoin': fkregoin != null ? fkregoin : "null",
                        'name_regoin': regoinname,
                        'name_level': levelname,

                        'isActive': isAcive,
                        "updated_at": DateTime.now().toString(),
                        "fkuserupdate":
                            Provider.of<UserProvider>(context, listen: false)
                                .currentUser
                                .idUser
                                .toString(),
                      };

                      Provider.of<UserProvider>(context, listen: false)
                          .updateUserVm(
                              body: body,
                              // controllerUsers[widget.index]
                              iduser: widget.userModel.idUser,
                              mainCityList: hasChanges
                                  ? selectedRegion
                                      .map((e) => e.asUserRegion())
                                      .toList()
                                  : [],
                              params: hasChanges
                                  ? _getMainCityParams(selectedMainCityIds)
                                  : "");
                      clear(body);
                      // : error());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text('حدد مستوى للصلاحية من فضلك')));
                    }
                  },
                  icon: const Icon(
                    Icons.check,
                    color: AppColors.kWhiteColor,
                  ),
                );
              },
            )
          ],
          title: const Text(
            ' ',
            style: TextStyle(color: AppColors.kWhiteColor),
          ),
          centerTitle: true,
        ),
        body: ModalProgressHUD(
          inAsyncCall:
              Provider.of<UserProvider>(context, listen: true).isUpdate,
          //Provider.of<LoadProvider>(context).isLoadingUpdateUser,
          child: SingleChildScrollView(
            child: ContainerShadows(
              width: double.infinity,
              padding: EdgeInsets.only(
                  top: 50,
                  right: 20,
                  left: 20,
                  bottom:
                      50), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppCardRow(title: 'Email', value: '*'),
                    SizedBox(height: 2),
                    EditTextFormField(
                      hintText: 'Email',
                      obscureText: false,
                      controller: emailController,
                      vaildator: InputValidator.validateEmail,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AppCardRow(title: AppStrings.labelManage, value: '*'),

                    Consumer<manage_provider>(
                        builder: (context, mangelist, child) {
                      return DropdownButtonFormField(
                        isExpanded: true,
                        hint: Text("حددالإدارة"),
                        items: mangelist.listtext.map((level_one) {
                          return DropdownMenuItem(
                            child: Text(level_one.name_mange),
                            //label of item
                            value: level_one.idMange, //value of item
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
                    AppCardRow(title: AppStrings.labelLevel, value: '*'),
                    //mangwidget(),
                    BlocBuilder<LevelsCubit, LevelsState>(
                      builder: (context, state) {
                        return DropdownButtonFormField(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: state.getLevelStatus.data.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.nameLevel ?? ''),
                              value: level_one.idLevel,
                            );
                          }).toList(),
                          // todo: un comment this
                          // value: state.selectedLevelId,
                          onChanged: (value) {},
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
                    AppCardRow(title: 'الفرع', value: '*'),
                    Consumer<RegionProvider>(
                      builder: (context, cart, child) {
                        return DropdownButtonFormField(
                          isExpanded: true,
                          //hint: Text("حدد حالة العميل"),
                          items: cart.listRegion.map((level_one) {
                            return DropdownMenuItem(
                              child: Text(level_one.branchName), //label of item
                              value: level_one.branchId, //value of item
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
                    AppCardRow(title: 'المناطق', value: ''),
                    Consumer<MainCityProvider>(
                      builder: (context, cart, child) {
                        return CustomMultiSelectionDropdown<RegionModel>(
                          items: cart.listmaincityfilter,
                          selectedItems: cart.selectedRegions,
                          hint: 'المنطقة',
                          filterFn: (user, filter) =>
                              user.getfilteruser(filter),
                          compareFn: (item, selectedItem) =>
                              item.id_maincity == selectedItem.id_maincity,
                          onSave: (data) {
                            cart.changeItemsList(data);
                          },
                          itemAsString: (u) => u!.userAsString(),
                        );
                      },
                    ),
                    SizedBox(height: 20),

                    SizedBox(height: 20),
                    AppCardRow(title: AppStrings.labelMobile, value: '*'),
                    EditTextFormField(
                      hintText: '00966000000000',
                      obscureText: false,
                      controller: mobileController,
                      vaildator: (value) {
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
                            buttonWidth: 110,
                            selectedColor: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        buttons: ['غير نشط', 'نشط'],
                        onSelected: (_, index, isselected) {
                          setState(() {
                            isAcive = index.toString();
                            //selectedProvider.selectValuetypeinstall(index);
                          });
                        }),
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
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(AppStrings.labelEditUser)));
    Navigator.pop(context);
  }

  String _getMainCityParams(List<String> regionFks) {
    final StringBuffer stringBuffer = StringBuffer();
    regionFks.forEach((element) {
      stringBuffer.write("&maincity_fks[]=$element");
    });
    return stringBuffer.toString();
  }
}
