import 'package:flutter/material.dart';

/// Raw palette (theme independent) — values come from the Stitch config, identical in all 62 screens.
class AppColors {
  static const brand50 = Color(0xFFF0F5F2);
  static const brand400 = Color(0xFF5F9A83);
  static const brand600 = Color(0xFF2E6952);
  static const brand900 = Color(0xFF132E25);
  static const onBrand = Color(0xFFFDFDFB);
  static const brandLine = Color(0xFF2F3936);

  /// Module identity colours (same in both themes; map pin "sell" turns copper in dark).
  static const repair = Color(0xFF2C5F7A);
  static const sell = Color(0xFF9A6B1F);
  static const copper300 = Color(0xFFDDA87C);
  static const copper500 = Color(0xFFB5642F);
  static const tangerine = Color(0xFFFE9F64);

  static const ink400 = Color(0xFF8A9490);
}
