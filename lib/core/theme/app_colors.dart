import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF10B981); // Emerald 500
  static const Color primaryDark = Color(0xFF059669); // Emerald 600
  static const Color primaryLight = Color(0xFF34D399); // Emerald 400

  // Secondary Colors (e.g. for accents or specific UI elements)
  static const Color secondary = Color(0xFF3B82F6); // Blue 500

  // Neutral Colors (Dark Theme)
  static const Color backgroundDark = Color(0xFF111827); // Gray 900
  static const Color surfaceDark = Color(0xFF1F2937); // Gray 800
  static const Color textPrimaryDark = Colors.white;
  static const Color textSecondaryDark = Color(0xFF9CA3AF); // Gray 400
  static const Color borderDark = Color(0xFF374151); // Gray 700
  static const Color iconDark = Colors.white;

  // Neutral Colors (Light Theme) - Soft Tech Palette (Refined)
  // Background is clearly gray (not white), items are softer darks.
  static const Color backgroundLight = Color(
    0xFFF1F5F9,
  ); // Slate 100 - Visible soft gray background
  static const Color surfaceLight =
      Colors.white; // White cards pop against the gray background
  static const Color textPrimaryLight = Color(
    0xFF334155,
  ); // Slate 700 - Soft dark gray, not harsh black
  static const Color textSecondaryLight = Color(
    0xFF64748B,
  ); // Slate 500 - Balanced secondary text
  static const Color borderLight = Color(
    0xFFCBD5E1,
  ); // Slate 300 - Distinct borders
  static const Color iconLight = Color(
    0xFF475569,
  ); // Slate 600 - Visible softer icons

  // Functional Colors
  static const Color error = Color(0xFFEF4444); // Red 500
  static const Color success = Color(0xFF10B981); // Emerald 500
  static const Color warning = Color(0xFFF59E0B); // Amber 500
  static const Color info = Color(0xFF3B82F6); // Blue 500

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
