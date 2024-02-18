import 'dart:async';
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/features/manage_users/domain/use_cases/action_user_usecase.dart';
import 'package:crm_smart/features/manage_users/presentation/manager/users_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_distributors_action.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_button_new.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../app_strings.dart';
import '../../../../model/maincitymodel.dart';
import '../../../../view_model/maincity_vm.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';

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
      context
          .read<PrivilegeCubit>()
          .getLevels(context.read<UserProvider>().currentUser);
      Provider.of<manage_provider>(context, listen: false).getmanage();
      Provider.of<RegionProvider>(context, listen: false)
          .changeValuser(null, true);
      context.read<MainCityProvider>().changeitemlist([], isInit: true);
      if (user == null) context.read<MainCityProvider>().getmaincity();
    });

    if (user != null) {
      scheduleMicrotask(() {
        nameManage = user!.typeAdministration.toString();
        context.read<manage_provider>().changevalue(nameManage!);
        debugPrint(
            '' + context.read<manage_provider>().selectedValuemanag.toString());
        context
            .read<MainCityProvider>()
            .getmaincity(regions: user!.maincitylist_user);
        emailController.text = user!.email.toString();
        mobileController.text = user!.mobile.toString();

        regionName = user!.nameRegoin;
        levelName = user!.name_level;

        print('user!.typeLevel.toString()');
        print(user!.typeLevel.toString());
        context
            .read<PrivilegeCubit>()
            .onChangeLevelId(user!.typeLevel.toString());
        print(context.read<PrivilegeCubit>().state.selectedLevelId);
        context.read<RegionProvider>().changeValuser(user!.fkRegoin);

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
                RowEdit(name: AppStrings.labelManage, des: '*'),
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
                RowEdit(name: AppStrings.labelLevel, des: '*'),
                BlocBuilder<PrivilegeCubit, PrivilegeState>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                      isExpanded: true,
                      items: state.priorityState.map((level) {
                        return DropdownMenuItem(
                          child: Text(level.nameLevel ?? ''),
                          value: level.idLevel,
                        );
                      }).toList(),
                      value: state.selectedLevelId,
                      onChanged: (value) {
                        context
                            .read<PrivilegeCubit>()
                            .onChangeLevelId(value.toString());
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
                Consumer<RegionProvider>(
                  builder: (context, cart, child) {
                    return DropdownButtonFormField(
                      isExpanded: true,
                      items: cart.listRegion.map((branch) {
                        return DropdownMenuItem(
                          child: Text(branch.regionName), //label of item
                          value: branch.regionId, //value of item
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
                Consumer<MainCityProvider>(
                  builder: (context, cart, child) {
                    final items = cart.listmaincityfilter
                        .where((element) => element.id_maincity != '0')
                        .map((e) => e.toMap())
                        .toList();

                    final selectedItems =
                        cart.selectedRegions.map((e) => e.toMap()).toList();
                    selectedItems.forEachIndexed((index, element) {
                      selectedItems[index]['value'] = element['id_maincity'];
                      selectedItems[index]['parameter'] = 'id_maincity';
                    });

                    return CustomSearchableDropDown(
                      dropdownHintText: 'ابحث هنا... ',
                      showLabelInMenu: true,
                      primaryColor: kMainColor,
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      items: items,
                      multiSelectValuesAsWidget: true,
                      label: 'اختر المناطق',
                      initialValue: selectedItems,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Icon(Icons.search),
                      ),
                      dropDownMenuItems: items.map((item) {
                        return item['namemaincity'];
                      }).toList(),
                      multiSelect: true,
                      onChanged: (value) {
                        if (value == null) {
                          return;
                        }

                        final list = jsonDecode(value)
                            .map<MainCityModel>(
                                (e) => MainCityModel.fromJson(e))
                            .toList();
                        cart.changeitemlist(list);
                      },
                    );
                  },
                ),
                20.verticalSpace,
                RowEdit(name: AppStrings.labelMobile, des: '*'),
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
                    controller: GroupButtonController(
                        selectedIndex: int.parse(isActive)),
                    options: GroupButtonOptions(
                        buttonWidth: 110,
                        selectedColor: kMainColor,
                        borderRadius: BorderRadius.circular(10)),
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
                        if (state.actionUserState.isLoading())
                          return Center(child: CircularProgressIndicator());

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
    final selectedRegion = context.read<MainCityProvider>().selectedRegions;
    final oldRegion =
        user?.maincitylist_user?.map((e) => e.asMainCity).toList();

    final selectedMainCityIds =
        selectedRegion.map((e) => e.id_maincity).toList();
    final userMainCityIds = oldRegion?.map((e) => e.id_maincity).toList();

    bool hasChanges;
    if ((userMainCityIds?.isEmpty ?? true) && selectedMainCityIds.isNotEmpty) {
      hasChanges = true;
    } else {
      hasChanges = !const DeepCollectionEquality.unordered()
          .equals(selectedMainCityIds, userMainCityIds);
    }

    final regionVm = context.read<RegionProvider>();
    String? region = regionVm.selectedValueuser;
    String? regionName = region == null
        ? ""
        : regionVm.listRegion
            .firstWhere((element) => element.regionId == region)
            .regionName;

    final levelVm = context.read<PrivilegeCubit>();
    String? level = levelVm.state.selectedLevelId;
    String levelName = levelVm.state.levelsState.data
        .firstWhere((element) => element.idLevel == level)
        .nameLevel!;

    final currentUser = context.read<UserProvider>().currentUser;
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
        selectedMainCityIds: isEdit
            ? (hasChanges ? selectedMainCityIds : [])
            : selectedMainCityIds,
        isActive: isActive,
        userId: user?.idUser,
      ),
      mainCityList: selectedRegion.map((e) => e.asUserRegion()).toList(),
      onSuccess: (String? value) {
        if (value != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('الموظف مضاف مسبقاً')));
          return;
        }

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(isEdit
                ? AppStrings.labelEditUser
                : AppStrings.labelAddedUser)));
        Navigator.pop(context);
      },
    );
  }
}
