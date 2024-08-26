import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../privileges/presentation/pages/privileges_page.dart';
import '../../data/models/level_model.dart';

class LevelCard extends StatelessWidget {
  const LevelCard({super.key, required this.level});

  final LevelModel level;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => AppNavigator.push(PrivilegesPage(level: level)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: AppText(
          level.nameLevel ?? '',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
