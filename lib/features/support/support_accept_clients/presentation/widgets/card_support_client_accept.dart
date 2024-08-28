import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/extensions/build_context.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../ui/screen/client/client_profile.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardSupportClientAccept extends StatelessWidget {
  const CardSupportClientAccept({
    super.key,
    required this.client,
  });

  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10).r,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.1),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          AppNavigator.push(ClientProfile(idClient: client.idClients));
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppText(
            client.nameEnterprise.toString(),
            style: context.textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
