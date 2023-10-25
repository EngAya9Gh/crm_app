import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../../../constants.dart';
import '../manager/manage_withdrawals_cubit.dart';

class ManageWithdrawalsPage extends StatefulWidget {
  const ManageWithdrawalsPage({Key? key}) : super(key: key);

  @override
  State<ManageWithdrawalsPage> createState() => _ManageWithdrawalsPageState();
}

class _ManageWithdrawalsPageState extends State<ManageWithdrawalsPage> {
  late ManageWithdrawalsCubit _manageWithdrawalsCubit;
  late UserModel currentUser;

  @override
  void initState() {
    currentUser = context.read<UserProvider>().currentUser;
    _manageWithdrawalsCubit = GetIt.I<ManageWithdrawalsCubit>()..getUsersSeries(currentUser.fkCountry!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _manageWithdrawalsCubit,
      child: Builder(
        builder: (context) {
          return BlocConsumer<ManageWithdrawalsCubit, ManageWithdrawalsState>(
            listener: (context, state) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.lightGreen,
                content: Text(
                  "تم تعديل سلسة الانسحابات بنجاح",
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            listenWhen: (previous, current) =>
                !previous.updateUsersSeriesState.isSuccess() && current.updateUsersSeriesState.isSuccess(),
            builder: (context, state) {
              return Scaffold(
                  appBar: AppBar(
                    title: Text('إدارة الإنسحابات', style: TextStyle(color: kWhiteColor)),
                    centerTitle: true,
                    backgroundColor: kMainColor,
                    actions: state.allUsersSeries.isLoading
                        ? null
                        : [
                            if (state.updateUsersSeriesState.isLoading())
                              Center(
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(color: Colors.white),
                                ),
                              )
                            else
                              Builder(
                                builder: (context) {
                                  return TextButton(
                                    onPressed: () {
                                      _manageWithdrawalsCubit.updateUsersSeries(
                                        currentUser.fkCountry!,
                                        () {},
                                      );
                                    },
                                    child: Text("حفظ",
                                        style: TextStyle(fontFamily: kfontfamily2, fontWeight: FontWeight.w600)),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                    ),
                                  );
                                },
                              ),
                            10.horizontalSpaceRadius,
                          ],
                  ),
                  floatingActionButton: Builder(
                    builder: (context) {
                      if (state.allUsersSeries.isLoading || state.updateUsersSeriesState.isLoading()) {
                        return SizedBox.shrink();
                      }

                      return FloatingActionButton(
                        onPressed: () => _manageWithdrawalsCubit.onAddWithdrawalsManager(
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
                        child: Icon(Icons.add),
                        backgroundColor: kMainColor,
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
                                  radius: 20,
                                  backgroundColor: kMainColor,
                                  child: Center(
                                    child: Text(
                                      '${index + 1}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                10.horizontalSpace,
                                Expanded(
                                  child: DropdownButtonFormField<UserWithdrawalsManager>(
                                    isExpanded: true,
                                    items: state.handleUsersSeries.values.toList()[index].map((user) {
                                      return DropdownMenuItem(
                                        child: Text(user.name!),
                                        value: user,
                                      );
                                    }).toList(),
                                    value: state.handleUsersSeries.keys.toList()[index],
                                    onChanged: (value) {
                                      if (value == null) {
                                        return;
                                      }
                                      _manageWithdrawalsCubit.onChangeWithdrawalsManager(
                                        value,
                                        state.handleUsersSeries.keys.toList()[index],
                                      );
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(),
                                      enabledBorder: OutlineInputBorder(),
                                      disabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      focusedBorder: OutlineInputBorder(),
                                      focusedErrorBorder: InputBorder.none,
                                    ),
                                  ),
                                ),
                                if (!state.updateUsersSeriesState.isLoading()) ...{
                                  10.horizontalSpace,
                                  ClipOval(
                                    child: InkWell(
                                      onTap: () {
                                        _manageWithdrawalsCubit
                                            .onRemoveWithdrawalsManager(state.handleUsersSeries.keys.toList()[index]);
                                      },
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: Colors.red,
                                        child: Center(
                                          child: Icon(Icons.remove, color: kWhiteColor, size: 17),
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
                                  child: VerticalDivider(color: kMainColor, thickness: 1.5),
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
                        onPressed: () => _manageWithdrawalsCubit.getUsersSeries(currentUser.fkCountry!),
                        icon: Icon(Icons.refresh_rounded),
                      ),
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
