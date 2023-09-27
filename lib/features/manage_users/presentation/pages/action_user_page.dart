import 'dart:async';
import 'package:collection/collection.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/features/manage_users/domain/use_cases/action_user_usecase.dart';
import 'package:crm_smart/features/manage_users/presentation/manager/users_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_ditributors_action.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';
import '../../../../labeltext.dart';
import '../../../../model/maincitymodel.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../../../view_model/user_vm_provider.dart';

class ActionUserPage extends StatefulWidget {
  const ActionUserPage({Key? key, this.userModel});

  final UserModel? userModel;

  @override
  State<ActionUserPage> createState() => _ActionUserPageState();
}

class _ActionUserPageState extends State<ActionUserPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String? nameManage = '1';
  late UsersCubit _usersCubit;
  String? regionName, levelName;
  String isActive = '1';

  UserModel? get user => widget.userModel;

  bool get isEdit => user != null;

  @override
  void initState() {
    _usersCubit = context.read<UsersCubit>();
    scheduleMicrotask(() {
      Provider.of<level_vm>(context, listen: false).getlevel();
      Provider.of<manage_provider>(context, listen: false).getmanage();
      Provider.of<regoin_vm>(context, listen: false).changeValuser(null, true);
      context.read<maincity_vm>()
        ..changeitemlist([], isInit: true)
        ..getmaincity();
    });

    if (user != null) {
      scheduleMicrotask(() {
        nameManage = user!.typeAdministration.toString();
        context.read<manage_provider>().changevalue(nameManage!);
        context.read<maincity_vm>().getmaincity(regions: user!.maincitylist_user);
        emailController.text = user!.email.toString();
        mobileController.text = user!.mobile.toString();

        regionName = user!.nameRegoin;
        levelName = user!.name_level;

        context.read<level_vm>().changeVal(user!.typeLevel.toString());
        context.read<regoin_vm>().changeValuser(user!.fkRegoin);

        setState(() {
          isActive = user!.isActive!;
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: kWhiteColor),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SingleChildScrollView(
          padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isEdit) ...{
                  RowEdit(name: 'Name', des: '*'),
                  2.verticalSpace,
                  EditTextFormField(
                    hintText: 'Name',
                    obscureText: false,
                    controller: nameController,
                    vaild: (value) {
                      if (isEdit) {
                        return null;
                      }

                      if (value?.trim() == null || value?.trim() == '') {
                        return "هذا الحقل مطلوب.";
                      }
                      return null;
                    },
                  ),
                  2.verticalSpace,
                },
                RowEdit(name: 'Email', des: '*'),
                2.verticalSpace,
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
                  },
                  hintText: 'Email',
                  obscureText: false,
                  controller: emailController,
                ),
                15.verticalSpace,
                RowEdit(name: label_manage, des: '*'),
                Consumer<manage_provider>(builder: (context, mangelist, child) {
                  return DropdownButtonFormField(
                    isExpanded: true,
                    hint: Text("حددالإدارة"),
                    items: mangelist.listtext.map((manage) {
                      return DropdownMenuItem(
                        child: Text(manage.name_mange), //label of item
                        value: manage.idmange, //value of item
                      );
                    }).toList(),
                    value: mangelist.selectedValuemanag,
                    onChanged: (value) {
                      nameManage = value.toString();
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
                15.verticalSpace,
                RowEdit(name: label_level, des: '*'),
                Consumer<level_vm>(
                  builder: (context, cart, child) {
                    return DropdownButtonFormField(
                      isExpanded: true,
                      items: cart.listoflevel_periorty.map((level) {
                        return DropdownMenuItem(
                          child: Text(level.nameLevel), //label of item
                          value: level.idLevel, //value of item
                        );
                      }).toList(),
                      value: cart.selectedValueLevel,
                      onChanged: (value) {
                        cart.changeVal(value.toString());
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
                15.verticalSpace,
                RowEdit(name: 'الفرع', des: '*'),
                Consumer<regoin_vm>(
                  builder: (context, cart, child) {
                    return DropdownButtonFormField(
                      isExpanded: true,
                      items: cart.listregoin.map((branch) {
                        return DropdownMenuItem(
                          child: Text(branch.name_regoin), //label of item
                          value: branch.id_regoin, //value of item
                        );
                      }).toList(),
                      value: cart.selectedValueuser,
                      onChanged: (value) {
                        cart.changeValuser(value.toString());
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
                15.verticalSpace,
                RowEdit(name: 'المناطق', des: ''),
                Consumer<maincity_vm>(
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
                20.verticalSpace,
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
                15.verticalSpace,
                if (isEdit) ...{
                  Center(
                      child: GroupButton(
                    controller: GroupButtonController(selectedIndex: int.parse(isActive)),
                    options: GroupButtonOptions(
                        buttonWidth: 110, selectedColor: kMainColor, borderRadius: BorderRadius.circular(10)),
                    buttons: ['غير نشط', 'نشط'],
                    onSelected: (_, index, isselected) {
                      setState(() {
                        isActive = index.toString();
                      });
                    },
                  )),
                  20.verticalSpace,
                },
                Center(
                  child: SizedBox(
                    width: 250.w,
                    child: BlocBuilder<UsersCubit, UsersState>(
                      builder: (context, state) {
                        if (state.actionUserState.isLoading()) return Center(child: CircularProgressIndicator());

                        return custom_button_new(
                          onpress: () => onAction(context),
                          text: isEdit ? 'تعديل البيانات' : 'إضافة الموظف ',
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  onAction(BuildContext context) {
    _formKey.currentState!.save();
    final validate = _formKey.currentState!.validate();
    if (!validate) {
      return;
    }
    final selectedRegion = context.read<maincity_vm>().selecteditemmaincity;
    final oldRegion = user?.maincitylist_user?.map((e) => e.asMainCity).toList();

    final selectedMainCityIds = selectedRegion.map((e) => e.id_maincity).toList();
    final userMainCityIds = oldRegion?.map((e) => e.id_maincity).toList();

    bool hasChanges;
    if ((userMainCityIds?.isEmpty ?? true) && selectedMainCityIds.isNotEmpty) {
      hasChanges = true;
    } else {
      hasChanges = !const DeepCollectionEquality.unordered().equals(selectedMainCityIds, userMainCityIds);
    }

    final regionVm = context.read<regoin_vm>();
    String? region = regionVm.selectedValueuser;
    String? regionName =
        region == null ? "" : regionVm.listregoin.firstWhere((element) => element.id_regoin == region).name_regoin;

    final levelVm = context.read<level_vm>();
    String? level = levelVm.selectedValueLevel;
    String levelName = levelVm.listoflevel.firstWhere((element) => element.idLevel == level).nameLevel;

    final currentUser = context.read<user_vm_provider>().currentUser;
    final fkCountry = currentUser.fkCountry;
    final userID = currentUser.idUser;

    _usersCubit.actionUser(
      updateUser: user,
      addUserParams: ActionUserParams(
        name: nameController.text,
        email: emailController.text,
        mobile: mobileController.text,
        fkCountry: fkCountry!,
        typeAdministration: nameManage!,
        level: level!,
        levelName: levelName,
        regionName: regionName,
        fkUserAction: userID!,
        fkRegion: region!,
        selectedMainCityIds: isEdit ? (hasChanges ? selectedMainCityIds : []) : selectedMainCityIds,
        isActive: isActive,
        userId: user?.idUser,
      ),
      mainCityList: selectedRegion.map((e) => e.asUserRegion()).toList(),
      onSuccess: (String? value) {
        if (value != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الموظف مضاف مسبقاً')));
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(isEdit ? label_Edituser : label_Addeduser)));
        Navigator.pop(context);
      },
    );
  }
}