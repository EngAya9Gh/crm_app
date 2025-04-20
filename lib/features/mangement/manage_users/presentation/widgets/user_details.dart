import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/common/widgets/profile/profile_info_item.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: 
          SingleChildScrollView(
            child: Column(
              children: [
                ProfileInfoItem(
                icon: Icons.business_outlined,
                title: 'الإدارات',
                value: user.name_mange ?? '',
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.location_city_outlined,
                title: 'الفرع',
                value: user.nameRegoin ?? '',
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.grade_outlined,
                title: 'المستوى',
                value: user.name_level ?? '',
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.check_circle_outline,
                title: 'الحالة',
                value: user.isActive == "1" ? 'نشط' : 'غير نشط',
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.email_outlined,
                title: 'البريد الإلكتروني',
                value: user.email.toString(),
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.phone_outlined,
                title: 'الهاتف',
                value: user.mobile.toString(),
                onTap: () async {
                  await HelperFunctions.urlLauncherPhone(
                      user.mobile.toString());
                },
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.person_add_outlined,
                title: 'تمت الإضافة من قبل',
                value: user.nameuserAdd.toString(),
              ),
              Divider(height: 30),
              ProfileInfoItem(
                icon: Icons.calendar_today_outlined,
                title: 'تاريخ الإضافة',
                value: user.created_at.toString(),
              ),
              if (user.nameuserupdate != null) ...[
                Divider(height: 30),
                ProfileInfoItem(
                  icon: Icons.edit_outlined,
                  title: 'تم التعديل من قبل',
                  value: user.nameuserupdate.toString(),
                ),
                Divider(height: 30),
                ProfileInfoItem(
                  icon: Icons.update_outlined,
                  title: 'تاريخ التعديل',
                  value: user.updated_at.toString(),
                ),
              ],
           ],  ),
          ),
        ),
      ),
    );
  }
}
