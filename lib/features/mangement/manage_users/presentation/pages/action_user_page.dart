import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/info_item.dart';
import 'package:crm_smart/core/common/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/widgets/app_group_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../domain/use_cases/action_user_usecase.dart';
import '../manager/users_cubit.dart';
import '../widgets/levels_searchable_dropdown.dart';
import '../widgets/manage_searchable_dropdown.dart';

class ActionUserPage extends StatefulWidget {
  const ActionUserPage({
    super.key,
    this.user,
    this.userId,
  });

  final UserModel? user;
  final String? userId;

  @override
  State<ActionUserPage> createState() => _ActionUserPageState();
}

class _ActionUserPageState extends State<ActionUserPage> {
  late UsersCubit _usersCubit;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String isActive = '1';
  bool _isLoading = false;

  UserModel? get user => widget.user ?? _usersCubit.state.currentUser;

  late final bool isEdit;

  @override
  void initState() {
     _usersCubit = context.read<UsersCubit>()..init();
    isEdit = widget.user != null || widget.userId != null;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!isEdit) {
        _usersCubit.addNewUserState();
        await context.read<MainCityProvider>().getmaincity();
      } else if (widget.userId != null) {
        await _usersCubit.getUserById(widget.userId!);
        if (user != null) {
          _prepareUser();
          await context
              .read<MainCityProvider>()
              .getmaincity(regions: user!.maincitylist_user);
        }
      } else if (widget.user != null) {
        _prepareUser();
        await context
            .read<MainCityProvider>()
            .getmaincity(regions: widget.user!.maincitylist_user);
      }
    });
    super.initState();
  }

  void _prepareUser() {
    if (user == null) return;

    // تعيين قيم النصوص
    nameController.text = user!.nameUser?.toString() ?? '';
    emailController.text = user!.email?.toString()?.trim() ?? '';
    mobileController.text = user!.mobile?.toString() ?? '';
    isActive = user!.isActive ?? '1';

    // تعيين قيم القوائم المنسدلة
    if (user!.typeAdministration != null) {
    _usersCubit.setSelectedManage(user!.typeAdministration!);
    }

    if (user!.typeLevel != null) {
    _usersCubit.setSelectedLevel(user!.typeLevel!);
    }

    if (user!.fkRegoin != null) {
    _usersCubit.setSelectedBranch(user!.fkRegoin!);
    }

    // تحديث الحالة لإعادة بناء الواجهة
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: isEdit ? 'تعديل الحساب' : 'إضافة حساب جديد',
        // backgroundColor: Color(0xFF2196F3),
        // elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.check, color: Colors.white),
            onPressed: () => onAction(context),
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return state.getUserByIdStatus.when(
            success: (data) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                          textDirection: TextDirection.rtl,
                      children: [
                            SectionHeader(title: 'USER INFORMATION'),
                            InfoItem(
                              title: 'الإسم',
                              isRequired: true,
                              customWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: AppTextField(
                            hintText: 'الإسم',
                            controller: nameController,
                            isRequired: true,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            InfoItem(
                              title: 'البريد الإلكتروني',
                              isRequired: true,
                              customWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: AppTextField(
                          hintText: 'البريد الإلكتروني',
                                  controller: emailController,
                          isRequired: true,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            InfoItem(
                              title: 'الإدارة',
                              value: _usersCubit.userActionsEntity
                                      .selectedManage?.name_mange ??
                                  '',
                          isRequired: true,
                              showArrow: true,
                              onTap: () => _showManageDialog(),
                            ),
                            InfoItem(
                              title: AppStrings.labelLevel,
                              value: _usersCubit.userActionsEntity.selectedLevel
                                      ?.nameLevel ??
                                  '',
                          isRequired: true,
                              showArrow: true,
                              onTap: () => _showLevelDialog(),
                            ),
                            InfoItem(
                              title: 'الفرع',
                              value: _usersCubit.userActionsEntity
                                      .selectedBranch?.branchName ??
                                  '',
                          isRequired: true,
                              showArrow: true,
                              onTap: () => _showBranchDialog(),
                            ),
                            InfoItem(
                              title: 'المنطقة',
                              value: context
                                      .read<MainCityProvider>()
                                      .selectedRegions
                                      .isEmpty
                                  ? ''
                                  : context
                                      .read<MainCityProvider>()
                                      .selectedRegions
                                      .map((e) => e.namemaincity)
                                      .join(', '),
                              isRequired: true,
                              showArrow: true,
                              onTap: () => _showRegionDialog(),
                            ),
                            SectionHeader(title: 'CALL INFORMATION'),
                            InfoItem(
                              title: AppStrings.labelMobile,
                              isRequired: true,
                              customWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: AppTextField(
                          hintText: '966000000000',
                          controller: mobileController,
                                  inputType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                                  maxLength: 15,
                                  isRequired: true,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            if (isEdit) ...[
                              SectionHeader(title: 'USER STATUS'),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 16),
                                color: Colors.white,
                                child: Center(
                            child: AppGroupButton(
                                    groupButtonController:
                                        GroupButtonController(
                                  selectedIndex: int.parse(isActive)),
                              buttons: ['غير نشط', 'نشط'],
                              onSelected: (_, index, isSelected) {
                                isActive = index.toString();
                                setState(() {});
                              },
                            ),
                          ),
                              ),
                            ],
                            SectionHeader(title: 'VIEW OPTIONS'),
                            GestureDetector(
                              onTap: () {
                                // Implement smart view switch functionality
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16),
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Switch to Smart View',
                                    style: TextStyle(
                                      color: Color(0xFF2196F3),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                  ),
                ),
              );
            },
            failure: (error, data) {
              return AppErrorWidget(
                message: error,
                onPressed: () => _usersCubit.getUserById(widget.userId!),
              );
            },
          );
        },
      ),
    );
  }

  void _showManageDialog() {
    showDialog<dynamic>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: AppText('الإدارة', textDirection: TextDirection.rtl),
        content: Container(
          width: double.maxFinite,
          child: ManageSearchableDropdown(
            manage: _usersCubit.userActionsEntity.selectedManage,
            onChanged: (value) {
              if (value != null) {
                _usersCubit.userActionsEntity.selectedManage = value;
              }
            },
            isRequired: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _showLevelDialog() {
    showDialog<dynamic>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: AppText(AppStrings.labelLevel, textDirection: TextDirection.rtl),
        content: Container(
          width: double.maxFinite,
          child: LevelsSearchableDropdown(
            level: _usersCubit.userActionsEntity.selectedLevel,
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  _usersCubit.userActionsEntity.selectedLevel = value;
                });
                // Navigator.pop(dialogContext);
              }
            },
            isRequired: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _showBranchDialog() {
    showDialog<dynamic>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: AppText('الفرع', textDirection: TextDirection.rtl),
        content: Container(
          width: double.maxFinite,
          child: BranchSearchableDropDown(
            selectedBranchId:
                _usersCubit.userActionsEntity.selectedBranch?.branchId,
            onSelected: (value) {
              if (value != null) {
                _usersCubit.userActionsEntity.selectedBranch = value;
              }
            },
            isRequired: true,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: Text('موافق'),
          ),
        ],
      ),
    );
  }

  void _showRegionDialog() {
    showDialog<dynamic>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: AppText('المنطقة', textDirection: TextDirection.rtl),
        content: Container(
          width: double.maxFinite,
          height: 300,
          child: Consumer<MainCityProvider>(
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
                  final List<RegionModel> list = value
                      .map<RegionModel>((e) => RegionModel.fromJson(e))
                      .toList();
                  cart.changeItemsList(list);
                },
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text('إلغاء'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              setState(() {});
            },
            child: Text('حفظ'),
          ),
        ],
      ),
    );
  }

  onAction(BuildContext context) {
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) return;

    if (_usersCubit.userActionsEntity.selectedManage == null) {
      AppSnackbar.showSnakeBar(
        "الرجاء اختيار الإدارة",
        color: ToastColorsEnum.error,
      );
      return;
    }

    if (_usersCubit.userActionsEntity.selectedLevel == null) {
      AppSnackbar.showSnakeBar(
        "الرجاء اختيار المستوى",
        color: ToastColorsEnum.error,
      );
      return;
    }

    if (_usersCubit.userActionsEntity.selectedBranch == null) {
      AppSnackbar.showSnakeBar(
        "الرجاء اختيار الفرع",
        color: ToastColorsEnum.error,
      );
      return;
    }

    if (context.read<MainCityProvider>().selectedRegions.isEmpty) {
      AppSnackbar.showSnakeBar(
        "الرجاء اختيار منطقة واحدة على الأقل",
        color: ToastColorsEnum.error,
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final selectedRegion = context.read<MainCityProvider>().selectedRegions;
    final oldRegion = user?.maincitylist_user?.map((e) => e.asRegion).toList();

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
        userId: isEdit ? user?.idUser : null,
      ),
      mainCityList: selectedRegion.map((e) => e.asUserRegion()).toList(),
      onSuccess: (String? value) {
        setState(() {
          _isLoading = false;
        });
        if (value != null) {
          AppSnackbar.showSnakeBar(
            "الموظف مضاف مسبقاً",
            color: ToastColorsEnum.warning,
          );
          return;
        }

        AppNavigator.pop();
        AppSnackbar.showSnakeBar(
          isEdit ? AppStrings.labelEditUser : AppStrings.labelAddedUser,
          color: ToastColorsEnum.success,
        );
      },
      onFail: (String? value) {
        setState(() {
          _isLoading = false;
        });
        AppSnackbar.showSnakeBar(
          value ?? "Something went wrong",
          color: ToastColorsEnum.error,
        );
      },
    );
  }
}
