import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:crm_smart/features/manage_users/presentation/manager/users_cubit.dart';
import 'package:crm_smart/features/manage_users/presentation/pages/user_profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../constants.dart';
import 'action_user_page.dart';

class ManageUserPage extends StatefulWidget {
  const ManageUserPage({Key? key}) : super(key: key);

  @override
  State<ManageUserPage> createState() => _ManageUserPageState();
}

class _ManageUserPageState extends State<ManageUserPage> {
  late UsersCubit _usersCubit;
  late TextEditingController _searchTextField;

  @override
  void initState() {
    _searchTextField = TextEditingController()..addListener(onSearch);
    _usersCubit = GetIt.I<UsersCubit>()..getAllUsers();
    super.initState();
  }

  @override
  void dispose() {
    _searchTextField
      ..removeListener(onSearch)
      ..dispose();
    super.dispose();
  }

  void onSearch() {
    _usersCubit.onSearch(_searchTextField.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _usersCubit,
      child: Builder(
        builder: (context) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => BlocProvider.value(
                          value: _usersCubit,
                          child: ActionUserPage(),
                        )),
              ),
              child: Icon(CupertinoIcons.add),
              heroTag: "add user",
              backgroundColor: kMainColor,
            ),
            appBar: AppBar(
              title: Text('إدارة المستخدمين', style: TextStyle(color: kWhiteColor)),
              centerTitle: true,
              backgroundColor: kMainColor,
            ),
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: BlocBuilder<UsersCubit, UsersState>(
                builder: (context, state) {
                  return state.allUsersList.when(
                    init: () => Center(child: CircularProgressIndicator()),
                    loading: () => Center(child: CircularProgressIndicator()),
                    loaded: (data) {
                      return Column(
                        children: [
                          15.verticalSpace,
                          Padding(
                            padding: REdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              controller: _searchTextField,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10).r,
                                      borderSide: BorderSide(color: Colors.grey.shade200, width: 0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10).r,
                                      borderSide: BorderSide(color: Colors.grey.shade200, width: 0)),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10).r,
                                      borderSide: BorderSide(color: Colors.grey.shade200, width: 0)),
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: "اسم الموظف...",
                                  isDense: true,
                                  prefixIcon: Icon(CupertinoIcons.search, size: 25.r)),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              padding: REdgeInsets.symmetric(horizontal: 20, vertical: 20),
                              itemBuilder: (context, index) {
                                final user = data[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => BlocProvider.value(
                                          value: _usersCubit,
                                          child: UserProfile(userModel: user),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 30,
                                            child: user.img_image.toString().trim().length == 0
                                                ? user.nameUser.toString().isEmpty || user.nameUser == null
                                                    ? Icon(
                                                        Icons.person,
                                                        size: 50,
                                                        color: Colors.lightBlueAccent,
                                                      )
                                                    : Text(user.nameUser.toString().substring(0, 1))
                                                : ClipRRect(
                                                    borderRadius: BorderRadius.circular(45),
                                                    child: CachedNetworkImage(
                                                      width: 500,
                                                      height: 500,
                                                      fit: BoxFit.fill,
                                                      placeholder: (context, url) => const CircularProgressIndicator(),
                                                      imageUrl: user.img_image!,
                                                    ),
                                                  ),
                                          ),
                                          25.horizontalSpace,
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(user.nameUser ?? '', style: context.textTheme.labelLarge),
                                              8.verticalSpace,
                                              Text(user.name_mange ?? '',
                                                  style: context.textTheme.bodyLarge
                                                      ?.copyWith(color: Colors.grey, fontWeight: FontWeight.w600)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              CircleAvatar(radius: 6.r, backgroundColor: user.isActive == '1' ? Colors.green : Colors.red),
                                              5.horizontalSpace,
                                              Text(user.isActive == '1' ? 'Active' : 'UnActive',
                                                  style: context.textTheme.labelLarge),
                                            ],
                                          ),
                                          if (user.fkRegoin != null) ...{
                                            8.verticalSpace,
                                            Text(user.nameRegoin.toString(),
                                                style: context.textTheme.bodyLarge?.copyWith(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          },
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) => Divider(
                                height: 20.h,
                                thickness: 1.5,
                                indent: 10.w,
                              ),
                              itemCount: data.length,
                            ),
                          )
                        ],
                      );
                    },
                    empty: () => Center(child: Text("No Users")),
                    error: (exception) => Center(child: Text("Something wrong!!")),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
