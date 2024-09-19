import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
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
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  String isActive = '1';

  UserModel? get user => widget.user ?? _usersCubit.state.currentUser;

  late final bool isEdit;

  @override
  void initState() {
    _usersCubit = context.read<UsersCubit>();
    isEdit = widget.user != null || widget.userId != null;
    if (isEdit && user != null) _prepareUser();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!isEdit) _usersCubit.addNewUserState();
      if (isEdit && user == null) {
        await _usersCubit.getUserById(widget.userId!);
        _prepareUser();
      }
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

  void _prepareUser() {
    _usersCubit.setSelectedManage(user!.typeAdministration!);
    _usersCubit.setSelectedLevel(user!.typeLevel!);
    _usersCubit.setSelectedBranch(user!.fkRegoin!);
    emailController.text = user!.email.toString().trim();
    mobileController.text = user!.mobile.toString();
    nameController.text = user!.nameUser.toString();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: isEdit ? 'تعديل الموظف' : 'إضافة موظف'),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          return state.getUserByIdStatus.when(
            success: (data) {
              return Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isEdit) ...{
                          _buildAlignedText('الإسم*'),
                          10.height,
                          AppTextField(
                            hintText: 'الإسم',
                            controller: nameController,
                            isRequired: true,
                          ),
                          15.height,
                        },
                        _buildAlignedText('البريد الإلكتروني*'),
                        10.height,
                        AppTextField(
                          hintText: 'البريد الإلكتروني',
                          isRequired: true,
                          controller: emailController,
                        ),
                        15.height,
                        _buildAlignedText('الإدارة*'),
                        10.height,
                        ManageSearchableDropdown(
                          manage: _usersCubit.userActionsEntity.selectedManage,
                          onChanged: (value) {
                            _usersCubit.userActionsEntity.selectedManage =
                                value;
                          },
                          isRequired: true,
                        ),
                        15.height,
                        _buildAlignedText('${AppStrings.labelLevel}*'),
                        10.height,
                        LevelsSearchableDropdown(
                          level: _usersCubit.userActionsEntity.selectedLevel,
                          onChanged: (value) {
                            _usersCubit.userActionsEntity.selectedLevel = value;
                          },
                          isRequired: true,
                        ),
                        15.height,
                        _buildAlignedText('الفرع*'),
                        10.height,
                        BranchSearchableDropDown(
                          selectedBranchId: _usersCubit
                              .userActionsEntity.selectedBranch?.branchId,
                          onSelected: (value) {
                            _usersCubit.userActionsEntity.selectedBranch =
                                value;
                          },
                          isRequired: true,
                        ),
                        15.height,
                        _buildAlignedText('المنطقة*'),
                        10.height,
                        Consumer<MainCityProvider>(
                          builder: (context, cart, child) {
                            final items = cart.listmaincityfilter
                                .where((element) => element.id_maincity != '0')
                                .map((e) => e.toMap())
                                .toList();

                            final selectedItems = cart.selectedRegions
                                .map((e) => e.toMap())
                                .toList();
                            selectedItems.forEachIndexed((index, element) {
                              selectedItems[index]['value'] =
                                  element['id_maincity'];
                              selectedItems[index]['parameter'] = 'id_maincity';
                            });

                            return CustomMultiSelectionDropdown<
                                Map<String, dynamic>>(
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
                                return item['id_maincity'] ==
                                    selected['id_maincity'];
                              },
                              onSave: (value) {
                                final List<RegionModel> list = value
                                    .map<RegionModel>(
                                        (e) => RegionModel.fromJson(e))
                                    .toList();

                                cart.changeItemsList(list);
                              },
                            );
                          },
                        ),
                        20.height,
                        _buildAlignedText('${AppStrings.labelMobile}*'),
                        10.height,
                        AppTextField(
                          hintText: '966000000000',
                          isRequired: true,
                          controller: mobileController,
                          maxLength: 15,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          inputType: TextInputType.phone,
                        ),
                        15.height,
                        if (isEdit) ...{
                          Center(
                            child: AppGroupButton(
                              groupButtonController: GroupButtonController(
                                  selectedIndex: int.parse(isActive)),
                              buttons: ['غير نشط', 'نشط'],
                              onSelected: (_, index, isSelected) {
                                isActive = index.toString();
                                setState(() {});
                              },
                            ),
                          ),
                          20.height,
                        },
                        Center(
                          child: SizedBox(
                            width: 200.w,
                            child: BlocBuilder<UsersCubit, UsersState>(
                              builder: (context, state) => AppElevatedButton(
                                text:
                                    isEdit ? 'تعديل البيانات' : 'إضافة الموظف ',
                                isLoading: state.actionUserState.isLoading(),
                                onPressed: () => onAction(context),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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

  Align _buildAlignedText(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: AppText(
        text,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    );
  }

  onAction(BuildContext context) {
    _formKey.currentState!.save();
    if (!_formKey.currentState!.validate()) return;

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
        userId: user?.idUser,
      ),
      mainCityList: selectedRegion.map((e) => e.asUserRegion()).toList(),
      onSuccess: (String? value) {
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
        AppSnackbar.showSnakeBar(
          value ?? "Something went wrong",
          color: ToastColorsEnum.error,
        );
      },
    );
  }
}
