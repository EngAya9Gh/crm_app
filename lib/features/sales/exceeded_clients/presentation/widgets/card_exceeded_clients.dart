import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/extensions/build_context.dart';
import '../../../../../ui/screen/client/profileclient.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardExceededClients extends StatelessWidget {
  const CardExceededClients({
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
          AppNavigator.push(ProfileClient(idClient: client.idClients));
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
