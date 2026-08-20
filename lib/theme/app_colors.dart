import 'package:flutter/material.dart';

abstract class AppColors {
  // Brand & Base (Monochrome)
  static const primary = Color(0xFF111111); // Deep crisp black instead of navy blue
  static const background = Color(0xFFFFFFFF); // Pure white canvas
  static const surface = Color(0xFFFFFFFF);
  static const container = Color(0xFFF2F2F7); // Soft light gray for pills, chips & inputs

  // Typography
  static const textPrimary = Color(0xFF111111); // High contrast sharp black
  static const textSecondary = Color(0xFF8E8E93); // Crisp neutral iOS gray
  static const textOnDark = Color(0xFFFFFFFF);

  // Accents & Structure
  static const border = Color(0xFFE5E5EA); // Ultra-subtle light divider
  static const sale = Color(0xFFE53935); // Vibrant signal red for prices & sale badges
  static const success = Color(0xFF34C759); // Modern clean green
}