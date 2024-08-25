import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../manage_privilege/data/models/level_model.dart';
import '../../../manage_privilege/presentation/pages/privilege_page.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key, required this.level});

  final LevelModel level;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => AppNavigator.push(PrivilegePage(levelModel: level)),
      child: AppText(level.nameLevel ?? ''),
    );
  }
}
