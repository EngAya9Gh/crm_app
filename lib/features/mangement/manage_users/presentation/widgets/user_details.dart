import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../ui/widgets/custom_widget/card_row.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          _buildInfoCard('الإدارات', user.name_mange),
          10.height,
          _buildInfoCard('الفرع', user.nameRegoin),
          10.height,
          _buildInfoCard('المستوى', user.name_level),
          10.height,
          _buildInfoCard('الحالة', user.isActive == "1" ? 'نشط' : 'غير نشط'),
          10.height,
          _buildInfoCard('البريد الإلكتروني', user.email.toString()),
          10.height,
          InkWell(
            onTap: () async {
              await FlutterPhoneDirectCaller.callNumber(user.mobile.toString());
            },
            child: _buildInfoCard('الهاتف', user.mobile.toString()),
          ),
          10.height,
          _buildInfoCard('تمت الإضافة من قبل', user.nameuserAdd.toString()),
          10.height,
          _buildInfoCard('تاريخ الإضافة', user.created_at.toString()),
          10.height,
          if (user.nameuserupdate != null) ...[
            _buildInfoCard('تم التعديل من قبل', user.nameuserupdate.toString()),
            10.height,
            _buildInfoCard('تاريخ التعديل', user.updated_at.toString()),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoCard(String title, String? value) {
    return AppCardContainer(
      child: CardRow(
        title: title,
        value: value,
        withDivider: false,
      ),
    );
  }
}
