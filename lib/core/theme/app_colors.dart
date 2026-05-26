import 'package:flutter/material.dart';

@immutable
class StatusBadgeColors extends ThemeExtension<StatusBadgeColors> {
  const StatusBadgeColors({
    required this.pendingContainer,
    required this.pendingForeground,
    required this.generatingContainer,
    required this.generatingForeground,
    required this.completedContainer,
    required this.completedForeground,
  });

  final Color pendingContainer;
  final Color pendingForeground;
  final Color generatingContainer;
  final Color generatingForeground;
  final Color completedContainer;
  final Color completedForeground;

  @override
  StatusBadgeColors copyWith({
    Color? pendingContainer,
    Color? pendingForeground,
    Color? generatingContainer,
    Color? generatingForeground,
    Color? completedContainer,
    Color? completedForeground,
  }) {
    return StatusBadgeColors(
      pendingContainer: pendingContainer ?? this.pendingContainer,
      pendingForeground: pendingForeground ?? this.pendingForeground,
      generatingContainer: generatingContainer ?? this.generatingContainer,
      generatingForeground: generatingForeground ?? this.generatingForeground,
      completedContainer: completedContainer ?? this.completedContainer,
      completedForeground: completedForeground ?? this.completedForeground,
    );
  }

  @override
  StatusBadgeColors lerp(ThemeExtension<StatusBadgeColors>? other, double t) {
    if (other is! StatusBadgeColors) {
      return this;
    }
    return StatusBadgeColors(
      pendingContainer:
          Color.lerp(pendingContainer, other.pendingContainer, t)!,
      pendingForeground:
          Color.lerp(pendingForeground, other.pendingForeground, t)!,
      generatingContainer:
          Color.lerp(generatingContainer, other.generatingContainer, t)!,
      generatingForeground:
          Color.lerp(generatingForeground, other.generatingForeground, t)!,
      completedContainer:
          Color.lerp(completedContainer, other.completedContainer, t)!,
      completedForeground:
          Color.lerp(completedForeground, other.completedForeground, t)!,
    );
  }
}

class AppColors {
  const AppColors._();

  static const darkStatusBadges = StatusBadgeColors(
    pendingContainer: Color(0xFFFFC107),
    pendingForeground: Color(0xFF1F1600),
    generatingContainer: Color(0xFF2196F3),
    generatingForeground: Color(0xFFFFFFFF),
    completedContainer: Color(0xFF4CAF50),
    completedForeground: Color(0xFFFFFFFF),
  );

  static const lightStatusBadges = StatusBadgeColors(
    pendingContainer: Color(0xFFFFC107),
    pendingForeground: Color(0xFF1F1600),
    generatingContainer: Color(0xFF2196F3),
    generatingForeground: Color(0xFFFFFFFF),
    completedContainer: Color(0xFF4CAF50),
    completedForeground: Color(0xFFFFFFFF),
  );
}
