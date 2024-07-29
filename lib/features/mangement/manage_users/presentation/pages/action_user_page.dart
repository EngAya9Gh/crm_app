import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/extensions/email_validation_ext.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/widgets/custom_widget/custom_button_new.dart';
import '../../../../../ui/widgets/custom_widget/row_edit.dart';
import '../../../../../ui/widgets/custom_widget/text_form.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../domain/use_cases/action_user_usecase.dart';
import '../manager/users_cubit.dart';
import '../widgets/branches_searchable_dropdown.dart';
import '../widgets/levels_searchable_dropdown.dart';
import '../widgets/manage_searchable_dropdown.dart';

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
  late UsersCubit _usersCubit;
  String isActive = '1';

  UserModel? get user => widget.userModel;

  late final bool isEdit;

  @override
  void initState() {
    isEdit = user != null;
    print("is edit $isEdit");
    _usersCubit = context.read<UsersCubit>();
    if (isEdit) {
      _usersCubit.setSelectedManage(user!.typeAdministration!);
      _usersCubit.setSelectedLevel(user!.typeLevel!);
      _usersCubit.setSelectedBranch(user!.fkRegoin!);
      emailController.text = user!.email.toString().trim();
      mobileController.text = user!.mobile.toString();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MainCityProvider>().changeItemsList([], isInit: true);
      if (user == null) context.read<MainCityProvider>().getmaincity();
      context
          .read<MainCityProvider>()
          .getmaincity(regions: user!.maincitylist_user);
      setState(() {
        isActive = user!.isActive!;
      });
    });

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
                  10.height,
                  EditTextFormField(
                    hintText: 'Name',
                    obscureText: false,
                    controller: nameController,
                    vaildator: (value) {
                      if (isEdit) {
                        return null;
                      }

                      if (value?.trim() == null || value?.trim() == '') {
                        return "هذا الحقل مطلوب.";
                      }
                      return null;
                    },
                  ),
                  15.height,
                },
                RowEdit(name: 'Email', des: '*'),
                10.height,
                EditTextFormField(
                  vaildator: (data) {
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
                15.height,
                RowEdit(name: AppStrings.labelManage, des: '*'),
                10.height,
                ManageSearchableDropdown(
                  manage: _usersCubit.userActionsEntity.selectedManage,
                  onChanged: (value) {
                    _usersCubit.userActionsEntity.selectedManage = value;
                  },
                  isRequired: true,
                ),
                15.height,
                RowEdit(name: AppStrings.labelLevel, des: '*'),
                10.height,
                LevelsSearchableDropdown(
                  level: _usersCubit.userActionsEntity.selectedLevel,
                  onChanged: (value) {
                    _usersCubit.userActionsEntity.selectedLevel = value;
                  },
                  isRequired: true,
                ),
                15.height,
                RowEdit(name: 'الفرع', des: '*'),
                10.height,
                BranchesSearchableDropdown(
                  branch: _usersCubit.userActionsEntity.selectedBranch,
                  onChanged: (value) {
                    _usersCubit.userActionsEntity.selectedBranch = value;
                  },
                  isRequired: true,
                ),
                15.height,
                RowEdit(name: 'المناطق', des: ''),
                10.height,
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

                    return CustomMultiSelectionDropdown<Map<String, dynamic>>(
                      hint: 'المناطق',
                      items: items,
                      selectedItems: selectedItems,
                      itemAsString: (item) => item!['namemaincity'],
                      filterFn: (item, filter) {
                        return item['namemaincity']
                            .toString()
                            .toLowerCase()
                            .contains(filter.toLowerCase());
                      },
                      compareFn: (item, selected) {
                        return item['id_maincity'] == selected['id_maincity'];
                      },
                      onSave: (value) {
                        final List<MainCityModel> list = value
                            .map<MainCityModel>(
                                (e) => MainCityModel.fromJson(e))
                            .toList();

                        cart.changeItemsList(list);
                      },
                    );
                  },
                ),
                20.height,
                RowEdit(name: AppStrings.labelMobile, des: '*'),
                10.height,
                EditTextFormField(
                  hintText: '+966000000000',
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
                15.height,
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
                  20.height,
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
    if (!_formKey.currentState!.validate()) return;

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

    _usersCubit.actionUser(
      updateUser: user,
      addUserParams: ActionUserParams(
        name: nameController.text,
        email: emailController.text,
        mobile: mobileController.text,
        typeAdministration:
            _usersCubit.userActionsEntity.selectedManage!.idMange,
        level: _usersCubit.userActionsEntity.selectedLevel!.idLevel!,
        fkRegion: _usersCubit.userActionsEntity.selectedBranch!.branchId,
        selectedMainCityIds: isEdit
            ? (hasChanges ? selectedMainCityIds : [])
            : selectedMainCityIds,
        isActive: isActive,
        userId: user?.idUser,
      ),
      mainCityList: selectedRegion.map((e) => e.asUserRegion()).toList(),
      onSuccess: (String? value) {
        if (value != null) {
          AppConstants.showSnakeBar("الموظف مضاف مسبقاً");
          return;
        }

        AppNavigator.pop();
        AppConstants.showSnakeBar(
            isEdit ? AppStrings.labelEditUser : AppStrings.labelAddedUser);
      },
      onFail: (String? value) {
        AppConstants.showSnakeBar(value ?? "Something went wrong");
      },
    );
  }
}
