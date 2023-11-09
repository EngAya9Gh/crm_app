import 'package:cached_network_image/cached_network_image.dart';
import 'package:crm_smart/features/manage_users/presentation/manager/users_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../constants.dart';
import '../../../../function_global.dart';
import '../../../../ui/screen/user/editprofile.dart';
import '../../../../ui/screen/user/row_edit2.dart';
import '../../../../ui/widgets/container_boxShadows.dart';
import '../../../../ui/widgets/custom_widget/text_uitil.dart';
import '../../../../view_model/privilge_vm.dart';
import 'action_user_page.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key, required this.userModel});

  final UserModel userModel;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    context.read<UsersCubit>().storeCurrentUser(widget.userModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isMyProfile = context.read<UserProvider>().currentUser.idUser == widget.userModel.idUser;
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        final user = state.currentUser!;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              // isMyProfile
              //     ?
              // IconButton(
              //         onPressed: () {
              //           Navigator.push(context, CupertinoPageRoute(builder: (context) => edit_profile()));
              //         },
              //         icon: const Icon(
              //           Icons.edit,
              //           color: kWhiteColor,
              //         ))
              //     :
              Provider.of<PrivilegeProvider>(context, listen: true).checkPrivilege('50') == true
                      ? IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: context.read<UsersCubit>(),
                                  child: ActionUserPage(userModel: user),
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: kWhiteColor,
                          ))
                      :
              IconButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => edit_profile()));
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: kWhiteColor,
                      )),
            ],
            title: TextUtilis(
              color: Colors.white,
              fontSize: 35.sp,
              fontWeight: FontWeight.bold,
              textstring: user.nameUser.toString(),
              underline: TextDecoration.none,
            ),
            backgroundColor: kMainColor,
            centerTitle: true,
            elevation: 0,
          ),
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                Padding(
                  padding: REdgeInsets.only(top: 20, bottom: 5),
                  child: CircleAvatar(
                      radius: 60.0,
                      child: user.img_image!.isNotEmpty
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: CachedNetworkImage(
                                width: 500,
                                height: 500,
                                fit: BoxFit.fill,
                                progressIndicatorBuilder: (context, url, progress) => Center(
                                  child: CircularProgressIndicator(
                                    value: progress.progress,
                                  ),
                                ),
                                imageUrl: user.img_image!,
                              ),
                            )
                          : Text(user.nameUser.toString().substring(0, 1))),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Column(
                      children: [
                        ContainerShadows(
                            width: double.infinity,
                            height: 50,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: REdgeInsets.only(left: 10, right: 10),
                              child: RowEdit2(des: user.name_mange.toString(), name: 'الإدارات'),
                            )),
                        10.verticalSpace,
                        ContainerShadows(
                          width: double.infinity,
                          height: 50,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: REdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: RowEdit2(
                              des: user.nameRegoin.toString() == "null" ? "" : user.nameRegoin.toString(),
                              name: 'الفرع',
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        ContainerShadows(
                          width: double.infinity,
                          height: 50,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: REdgeInsets.only(left: 10, right: 10),
                            child: RowEdit2(
                              des: user.name_level.toString(),
                              name: 'المستوى',
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        ContainerShadows(
                            width: double.infinity,
                            height: 50,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: REdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: RowEdit2(
                                des: user.isActive == "1" ? 'نشط' : 'غير نشط',
                                name: 'الحالة',
                              ),
                            )),
                        10.verticalSpace,
                        ContainerShadows(
                            width: double.infinity,
                            height: 50,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: REdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextUtilis(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    textstring: user.email.toString(),
                                    underline: TextDecoration.none,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // controllerUser.onPressEmail(
                                      //     controllerUser.userall!index].email.toString());
                                      //
                                    },
                                    icon: const Icon(Icons.email, size: 20, color: kMainColor),
                                  ),
                                ],
                              ),
                            )),
                        10.verticalSpace,
                        ContainerShadows(
                            width: double.infinity,
                            height: 50,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: REdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TextUtilis(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    textstring: 'الهاتف',
                                    underline: TextDecoration.none,
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      await FlutterPhoneDirectCaller.callNumber(user.mobile.toString());
                                    },
                                    child: Text(
                                      user.mobile.toString(),
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        10.verticalSpace,
                        ContainerShadows(
                            width: double.infinity,
                            height: 50,
                            margin: EdgeInsets.zero,
                            child: Padding(
                              padding: REdgeInsets.only(left: 10, right: 10),
                              child: RowEdit2(
                                des: getnameshort(user.nameuserAdd.toString()),
                                name: 'تمت الإضافة من قبل ',
                              ),
                            )),
                        10.verticalSpace,
                        ContainerShadows(
                          width: double.infinity,
                          height: 50,
                          margin: EdgeInsets.zero,
                          child: Padding(
                            padding: REdgeInsets.only(left: 10, right: 10),
                            child: RowEdit2(
                              des: user.created_at.toString(),
                              name: 'تاريخ الإضافة',
                            ),
                          ),
                        ),
                        10.verticalSpace,
                        user.nameuserupdate == null
                            ? Container()
                            : ContainerShadows(
                                width: double.infinity,
                                height: 50,
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: REdgeInsets.only(left: 10, right: 10),
                                  child: RowEdit2(
                                    des: getnameshort(user.nameuserupdate.toString()),
                                    name: 'تم التعديل من قبل ',
                                  ),
                                )),
                        10.verticalSpace,
                        user.updated_at == null
                            ? Container()
                            : ContainerShadows(
                                width: double.infinity,
                                height: 50,
                                margin: EdgeInsets.zero,
                                child: Padding(
                                  padding: REdgeInsets.only(left: 10, right: 10),
                                  child: RowEdit2(
                                    des: user.updated_at.toString(),
                                    name: 'تاريخ التعديل',
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
