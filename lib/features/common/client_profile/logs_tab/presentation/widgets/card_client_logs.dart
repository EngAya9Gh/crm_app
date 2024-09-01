import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/client_log_model.dart';

class CardClientLogs extends StatelessWidget {
  const CardClientLogs({
    super.key,
    required this.client,
  });

  final ClientLogModel client;

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
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: AppText(client.log),
        ),
      ),
    );
  }
}
