import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:provider/provider.dart';

import '../../../core/common/helpers/helper_functions.dart';
import '../../../core/common/widgets/app_cached_network_image.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_navigator.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/text_uitil.dart';
import 'edit_profile.dart';
import 'edituser.dart';
import 'row_edit2.dart';

class UserScreen extends StatefulWidget {
  final UserModel userModel;
  final String? ismyprofile;

  const UserScreen({
    super.key,
    this.ismyprofile,
    required this.userModel,
  });

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late int index;
  late var controllerUser;

  @override
  void initState() {
    index = Provider.of<UserProvider>(context, listen: false)
        .allUsers
        .indexWhere((element) => element.idUser == widget.userModel.idUser);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UserModel useredit =
        Provider.of<UserProvider>(context, listen: true).allUsers[index];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          widget.ismyprofile != null
              ? IconButton(
                  onPressed: () => AppNavigator.push(EditProfile()),
                  icon: const Icon(
                    Icons.edit,
                    color: AppColors.kWhiteColor,
                  ))
              : context.read<PrivilegesCubit>().checkPrivilege('50')
                  ? IconButton(
                      onPressed: () =>
                          AppNavigator.push(EditUser(userModel: useredit)),
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
          textstring: useredit.nameUser.toString(),
          //widget.userModel.nameUser.toString(),
          underline: TextDecoration.none,
        ),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: ContainerShadows(
            padding: EdgeInsets.only(
                top: 15,
                right: 1,
                left: 1,
                bottom:
                    5), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),

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
                          child: AppCachedNetworkImage(
                            width: 500,
                            height: 500,
                            fit: BoxFit.fill,
                            imageUrl: useredit.img_image,
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
                                  child: RowEdit2(
                                    des:
                                        //controllerUser.userall![widget.index]
                                        useredit.name_mange.toString(),
                                    name: 'الإدارات',
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
                                child: RowEdit2(
                                  des: useredit.nameRegoin.toString() == "null"
                                      ? ""
                                      : useredit.nameRegoin.toString(),
                                  name: 'الفرع',
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
                                  child: RowEdit2(
                                    des:
                                        //controllerUser.userall![widget.index]
                                        useredit.name_level.toString(),
                                    name: 'المستوى',
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
                                  child: RowEdit2(
                                    des:
                                        //controllerUser.userall![widget.index]
                                        useredit.isActive == "1"
                                            ? 'نشط'
                                            : 'غير نشط',
                                    name: 'الحالة',
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
                                        textstring: useredit.email.toString(),
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
                                              .callNumber(
                                                  useredit.mobile.toString());
                                        },
                                        child: AppText(
                                          useredit.mobile,
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
                                  child: RowEdit2(
                                    des:
                                        //controllerUser.userall![widget.index]
                                        HelperFunctions.getNameShort(
                                            useredit.nameuserAdd.toString()),
                                    name: 'تمت الإضافة من قبل ',
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
                                  child: RowEdit2(
                                    des:
                                        //controllerUser.userall![widget.index]
                                        useredit.created_at.toString(),
                                    name: 'تاريخ الإضافة',
                                  ),
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            useredit.nameuserupdate == null
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
                                      child: RowEdit2(
                                        des: HelperFunctions.getNameShort(
                                            useredit.nameuserupdate.toString()),
                                        name: 'تم التعديل من قبل ',
                                      ),
                                    )),
                            SizedBox(
                              height: 10,
                            ),
                            useredit.updated_at == null
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
                                      child: RowEdit2(
                                        des:
                                            //controllerUser.userall![widget.index]
                                            useredit.updated_at.toString(),
                                        name: 'تاريخ التعديل',
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
      ),
    );
    // });
  }
}
