import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/models/file_model.dart';
import '../../../core/common/widgets/files/app_platform_image.dart';
import '../../../core/config/navigator/app_navigator.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/app_card_row.dart';
import '../../widgets/custom_widget/text_uitil.dart';
import 'edit_profile.dart';
import 'edituser.dart';

class UserScreen extends StatefulWidget {
  final UserModel user;
  final String? ismyprofile;

  const UserScreen({
    super.key,
    this.ismyprofile,
    required this.user,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          widget.ismyprofile != null
              ? IconButton(
                  onPressed: () => AppNavigator.go(
                        EditProfile(),
                        isNew: false,
                      ),
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.kWhiteColor,
                  ))
              : context.read<PrivilegesCubit>().checkPrivilege('50')
                  ? IconButton(
                      onPressed: () => AppNavigator.go(
                            EditUser(userModel: widget.user),
                            isNew: false,
                          ),
                      icon: const Icon(
                        Icons.edit,
                        color: AppColors.kWhiteColor,
                      ))
                  : Container(),
        ],
        title: TextUtilis(
          color: Colors.white,
          fontSize: 35,
          fontWeight: FontWeight.bold,
          textstring: widget.user.nameUser.toString(),
          //userVm.currentUserModel.nameUser.toString(),
          underline: TextDecoration.none,
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Consumer<UserProvider>(builder: (context, userVm, child) {
        return Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: ContainerShadows(
              padding: EdgeInsets.only(top: 15, right: 1, left: 1, bottom: 5),
              // EdgeInsets.symmetric(horizontal: 50, vertical: 50),

              margin: EdgeInsets.only(left: 1, right: 1, top: 20, bottom: 20),
              width: double.infinity,
              //height: 500,
              child: Center(
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        child: CircleAvatar(
                          radius: 60.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: AppPlatformImage(
                              fileModel: FileModel(
                                path: userVm.currentUser.path,
                                url: userVm.currentUser.img_image,
                              ),
                              width: 500,
                              height: 500,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: Column(
                            children: [
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: AppCardRow(
                                      value: userVm.currentUser.name_mange,
                                      title: 'الإدارات',
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              ContainerShadows(
                                width: double.infinity,
                                height: 50,
                                margin: EdgeInsets.only(),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    right: 10,
                                  ),
                                  child: AppCardRow(
                                    value: userVm.currentUser.nameRegoin
                                                .toString() ==
                                            "null"
                                        ? ""
                                        : userVm.currentUser.nameRegoin
                                            .toString(),
                                    title: 'الفرع',
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: AppCardRow(
                                      value:
                                          //controllerUser.userall![widget.index]
                                          userVm.currentUser.name_level
                                              .toString(),
                                      title: 'المستوى',
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  )),
                              SizedBox(height: 10),
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: AppCardRow(
                                      value:
                                          //controllerUser.userall![widget.index]
                                          userVm.currentUser.isActive == "1"
                                              ? 'نشط'
                                              : 'غير نشط',
                                      title: 'الحالة',
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextUtilis(
                                          color: Colors.black,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          textstring: userVm.currentUser.email
                                              .toString(),
                                          underline: TextDecoration.none,
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            // controllerUser.onPressEmail(
                                            //     controllerUser.userall!index].email.toString());
                                            //
                                          },
                                          icon: const Icon(
                                            Icons.email,
                                            size: 20,
                                            color: AppColors.primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppText(
                                          "الهاتف",
                                          fontWeight: FontWeight.bold,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await FlutterPhoneDirectCaller
                                                .callNumber(userVm
                                                    .currentUser.mobile
                                                    .toString());
                                          },
                                          child: AppText(
                                            userVm.currentUser.mobile,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: AppCardRow(
                                      value:
                                          //controllerUser.userall![widget.index]
                                          HelperFunctions.getNameShort(widget
                                              .user.nameuserAdd
                                              .toString()),
                                      title: 'تمت الإضافة من قبل ',
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              ContainerShadows(
                                  width: double.infinity,
                                  height: 50,
                                  margin: EdgeInsets.only(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    child: AppCardRow(
                                      value:
                                          //controllerUser.userall![widget.index]
                                          userVm.currentUser.created_at
                                              .toString(),
                                      title: 'تاريخ الإضافة',
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                    ),
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                              userVm.currentUser.nameuserupdate == null
                                  ? Container()
                                  : ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: AppCardRow(
                                          value: HelperFunctions.getNameShort(
                                              userVm.currentUser.nameuserupdate
                                                  .toString()),
                                          title: 'تم التعديل من قبل ',
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      )),
                              SizedBox(
                                height: 10,
                              ),
                              userVm.currentUser.updated_at == null
                                  ? Container()
                                  : ContainerShadows(
                                      width: double.infinity,
                                      height: 50,
                                      margin: EdgeInsets.only(),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: AppCardRow(
                                          value:
                                              //controllerUser.userall![widget.index]
                                              userVm.currentUser.updated_at
                                                  .toString(),
                                          title: 'تاريخ التعديل',
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                        ),
                                      )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
    // });
  }
}
