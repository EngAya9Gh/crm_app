import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../model/communication_modle.dart';
import '../helpers/is_star_client_communication.dart';

class NonAgentClient extends StatelessWidget {
  const NonAgentClient({super.key, required this.communication});

  final CommunicationModel communication;

  @override
  Widget build(BuildContext context) {
    if (!_showStar()) return SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.label_important,
          color: Colors.amberAccent,
          size: (20.0).scaleIconsSize,
        ),
        2.width,
        Flexible(
          child: AppText(
            "عميل غير مرتبط بوكيل",
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  bool _showStar() {
    return isStarClientCommunication(
      typeSeller: communication.typeSeller,
      fkRegion: communication.fk_regoin,
    );
  }
}
