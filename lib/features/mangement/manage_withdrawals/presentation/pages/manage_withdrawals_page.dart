import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/manage_withdrawals_cubit.dart';

class ManageWithdrawalsPage extends StatefulWidget {
  const ManageWithdrawalsPage({super.key});

  @override
  State<ManageWithdrawalsPage> createState() => _ManageWithdrawalsPageState();
}

class _ManageWithdrawalsPageState extends State<ManageWithdrawalsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;

  @override
  void initState() {
    currentUser = context.read<UserProvider>().currentUser;
    _manageWithdrawalsCubit = context.read<ManageWithdrawalsCubit>()
      ..getUsersSeries(currentUser.fkCountry!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ManageWithdrawalsCubit, ManageWithdrawalsState>(
      listener: (context, state) {
        AppSnackbar.showSnakeBar(
          "تم تعديل سلسة الانسحابات بنجاح",
          color: ToastColorsEnum.success,
        );
      },
      listenWhen: (previous, current) =>
          !previous.updateUsersSeriesState.isSuccess() &&
          current.updateUsersSeriesState.isSuccess(),
      builder: (context, state) {
        return AppScaffold(
            appBar: CustomAppBar(
              title: 'إدارة الإنسحابات',
              actions: state.allUsersSeries.isLoading
                  ? null
                  : [
                      if (state.updateUsersSeriesState.isLoading())
                        Center(
                          child: SizedBox(
                            height: 25.scaleIconsSize,
                            width: 25.scaleIconsSize,
                            child: AppLoader(color: AppColors.white),
                          ),
                        )
                      else
                        Builder(
                          builder: (context) {
                            return AppTextButton(
                              text: "حفظ",
                              textStyle: AppStyles.textStyle.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                              onPressed: () {
                                _manageWithdrawalsCubit.updateUsersSeries(
                                  currentUser.fkCountry!,
                                  () {},
                                );
                              },
                            );
                          },
                        ),
                    ],
            ),
            floatingActionButton: Builder(
              builder: (context) {
                if (state.allUsersSeries.isLoading ||
                    state.updateUsersSeriesState.isLoading()) {
                  return SizedBox.shrink();
                }

                return FloatingActionButton(
                  onPressed: () =>
                      _manageWithdrawalsCubit.onAddWithdrawalsManager(
                    () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "من فضلك املأ كل الحقول أولاً",
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      );
                    },
                  ),
                  child: Icon(Icons.add, color: AppColors.white),
                  backgroundColor: AppColors.primaryColor,
                );
              },
            ),
            body: state.allUsersSeries.when(
              init: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              loaded: (data) => ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 20.scaleIconsSize,
                            backgroundColor: AppColors.primaryColor,
                            child: Center(
                              child: AppText(
                                '${index + 1}',
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          10.width,
                          Expanded(
                            child: CustomSearchableDropDown<
                                UserWithdrawalsManager>(
                              hint: 'الموظف',
                              items: state.handleUsersSeries.values
                                  .toList()[index],
                              itemAsString: (u) => u!.name!,
                              selectedItem:
                                  state.handleUsersSeries.keys.toList()[index],
                              filterFn: (user, filter) {
                                return user.name!
                                    .toLowerCase()
                                    .contains(filter.toLowerCase());
                              },
                              onChanged: (selectedUser) {
                                if (selectedUser == null) {
                                  return;
                                }
                                _manageWithdrawalsCubit
                                    .onChangeWithdrawalsManager(
                                  selectedUser,
                                  state.handleUsersSeries.keys.toList()[index],
                                );
                              },
                            ),
                          ),
                          if (!state.updateUsersSeriesState.isLoading()) ...{
                            10.width,
                            ClipOval(
                              child: InkWell(
                                onTap: () {
                                  _manageWithdrawalsCubit
                                      .onRemoveWithdrawalsManager(state
                                          .handleUsersSeries.keys
                                          .toList()[index]);
                                },
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.red,
                                  child: Center(
                                    child: Icon(Icons.remove,
                                        color: AppColors.white, size: 17),
                                  ),
                                ),
                              ),
                            ),
                          },
                        ],
                      ),
                      if (state.handleUsersSeries.length - 1 != index)
                        Transform.translate(
                          offset: Offset(10, 0),
                          child: SizedBox(
                            height: 50,
                            child: VerticalDivider(
                                color: AppColors.primaryColor, thickness: 1.5),
                          ),
                        ),
                    ],
                  );
                },
                itemCount: state.handleUsersSeries.keys.length,
              ),
              empty: () => Center(child: Text("No users series")),
              error: (e) => Center(
                child: IconButton(
                  onPressed: () => _manageWithdrawalsCubit
                      .getUsersSeries(currentUser.fkCountry!),
                  icon: Icon(Icons.refresh_rounded),
                ),
              ),
            ));
      },
    );
  }
}
