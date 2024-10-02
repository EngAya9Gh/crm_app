import 'package:flutter/material.dart';

import '../../../../features/app/presentation/widgets/app_text.dart';
import '../../../utils/app_colors.dart';
import '../app_icon.dart';

class PaginationControls extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;

  const PaginationControls({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIconButton(
          onPressed:
              currentPage > 1 ? () => onPageChanged(currentPage - 1) : null,
          icon: Icons.chevron_left,
        ),
        AppText('$currentPage / $totalPages'),
        _buildIconButton(
          onPressed: currentPage < totalPages
              ? () => onPageChanged(currentPage + 1)
              : null,
          icon: Icons.chevron_right,
        ),
      ],
    );
  }

  IconButton _buildIconButton({
    required void Function()? onPressed,
    required IconData icon,
  }) {
    return IconButton(
      icon: AppIcon(icon,
          color: onPressed != null ? AppColors.black : AppColors.grey),
      onPressed: onPressed,
    );
  }
}
