import 'package:flutter/material.dart';

/// Stitch type scale (plan §3.3). Line height is CSS-equivalent (`even` leading distribution).
class AppType {
  static const _tight = 'InterTight', _body = 'Inter', _mono = 'JetBrainsMono';

  static TextStyle _s(String family, double size, double height, double w, {double ls = 0, bool tabular = false}) => TextStyle(
        fontFamily: family,
        fontSize: size,
        height: height,
        fontWeight: _weightFor(w),
        fontVariations: [FontVariation('wght', w)],
        letterSpacing: ls,
        leadingDistribution: TextLeadingDistribution.even,
        fontFeatures: tabular ? const [FontFeature.tabularFigures()] : null,
      );

  static FontWeight _weightFor(double w) => w >= 700 ? FontWeight.w700 : (w >= 600 ? FontWeight.w600 : (w >= 500 ? FontWeight.w500 : FontWeight.w400));

  static final displayLg = _s(_tight, 48, 1.1, 700);
  static final displayLgMobile = _s(_tight, 32, 1.1, 700);
  static final headingLg = _s(_tight, 24, 1.25, 650);
  static final headingMd = _s(_tight, 20, 1.3, 650);
  static final bodyMd = _s(_body, 15, 1.65, 400);
  static final caption = _s(_body, 13, 1.5, 400);
  static final label = _s(_mono, 12, 1.3, 600, ls: 0.96);
  static final dataXl = _s(_tight, 40, 1.0, 700, tabular: true);
  static final dataLg = _s(_tight, 28, 1.05, 700, tabular: true);

  /// Convenience: same style with a different size (e.g. headingMd at 16px, label at 10px).
  static TextStyle sized(TextStyle s, double size) => s.copyWith(fontSize: size);
}
