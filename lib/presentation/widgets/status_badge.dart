import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<StatusBadgeColors>();
    final colorScheme = theme.colorScheme;
    final (background, foreground) = switch (status) {
      'generating' => (
          colors?.generatingContainer ?? colorScheme.primaryContainer,
          colors?.generatingForeground ?? colorScheme.onPrimaryContainer,
        ),
      'completed' => (
          colors?.completedContainer ?? colorScheme.tertiaryContainer,
          colors?.completedForeground ?? colorScheme.onTertiaryContainer,
        ),
      _ => (
          colors?.pendingContainer ?? colorScheme.secondaryContainer,
          colors?.pendingForeground ?? colorScheme.onSecondaryContainer,
        ),
    };
    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          status,
          style: theme.textTheme.labelSmall?.copyWith(color: foreground),
        ),
      ),
    );
  }
}
