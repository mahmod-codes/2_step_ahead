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
    pendingContainer: Color(0xFF5C3D00),
    pendingForeground: Color(0xFFFFDFA3),
    generatingContainer: Color(0xFF003A68),
    generatingForeground: Color(0xFFAED3FF),
    completedContainer: Color(0xFF0F4F2F),
    completedForeground: Color(0xFFA9F2C5),
  );

  static const lightStatusBadges = StatusBadgeColors(
    pendingContainer: Color(0xFFFFE3B3),
    pendingForeground: Color(0xFF4A3100),
    generatingContainer: Color(0xFFD1E4FF),
    generatingForeground: Color(0xFF003254),
    completedContainer: Color(0xFFC6F1D4),
    completedForeground: Color(0xFF063A1F),
  );
}
