import 'package:flutter/material.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';

/// Semantic design tokens, theme-resolved (DESIGN_SYSTEM.md §1.2).
/// Access via `context.tokens` (see context_extensions.dart) instead of
/// branching on `context.isDarkMode` in widgets.
class AppTokens extends ThemeExtension<AppTokens> {
  final Color bgCanvas;
  final Color bgSurface;
  final Color bgSurfaceRaised;
  final Color bgSurfaceSunken;
  final Color bgAccentSubtle;
  final Color fgPrimary;
  final Color fgBody;
  final Color fgSecondary;
  final Color fgOnAccent;
  final Color iconDefault;
  final Color iconAccent;
  final Color borderDefault;
  final Color borderStrong;
  final Color borderAccent;
  final Color accent;
  final Color accentHover;
  final Color accentPressed;
  final Color accent2;
  final Color success;
  final Color warning;
  final Color danger;
  final Color info;
  final Color moduleRepair;
  final Color moduleSell;
  final Color moduleRecycle;
  final Color moduleReward;
  final Color devicePhone;
  final Color deviceLaptop;
  final Color deviceTablet;
  final Color deviceOther;

  const AppTokens({
    required this.bgCanvas,
    required this.bgSurface,
    required this.bgSurfaceRaised,
    required this.bgSurfaceSunken,
    required this.bgAccentSubtle,
    required this.fgPrimary,
    required this.fgBody,
    required this.fgSecondary,
    required this.fgOnAccent,
    required this.iconDefault,
    required this.iconAccent,
    required this.borderDefault,
    required this.borderStrong,
    required this.borderAccent,
    required this.accent,
    required this.accentHover,
    required this.accentPressed,
    required this.accent2,
    required this.success,
    required this.warning,
    required this.danger,
    required this.info,
    required this.moduleRepair,
    required this.moduleSell,
    required this.moduleRecycle,
    required this.moduleReward,
    required this.devicePhone,
    required this.deviceLaptop,
    required this.deviceTablet,
    required this.deviceOther,
  });

  static const light = AppTokens(
    bgCanvas: AppColors.paper50,
    bgSurface: AppColors.paper0,
    bgSurfaceRaised: AppColors.paper0,
    bgSurfaceSunken: AppColors.paper100,
    bgAccentSubtle: AppColors.patina50,
    fgPrimary: AppColors.ink800,
    fgBody: AppColors.ink700,
    fgSecondary: AppColors.ink400,
    fgOnAccent: Colors.white,
    iconDefault: AppColors.ink600,
    iconAccent: AppColors.patina600,
    borderDefault: AppColors.paper200,
    borderStrong: AppColors.paper300,
    borderAccent: AppColors.patina600,
    accent: AppColors.patina600,
    accentHover: AppColors.patina700,
    accentPressed: AppColors.patina800,
    accent2: AppColors.copper500,
    success: AppColors.successLight,
    warning: AppColors.warningLight,
    danger: AppColors.dangerLight,
    info: AppColors.infoLight,
    moduleRepair: AppColors.moduleRepairLight,
    moduleSell: AppColors.moduleSellLight,
    moduleRecycle: AppColors.moduleRecycleLight,
    moduleReward: AppColors.moduleRewardLight,
    devicePhone: AppColors.devicePhoneLight,
    deviceLaptop: AppColors.deviceLaptopLight,
    deviceTablet: AppColors.deviceTabletLight,
    deviceOther: AppColors.deviceOtherLight,
  );

  static const dark = AppTokens(
    bgCanvas: AppColors.ink900,
    bgSurface: AppColors.darkSurface1,
    bgSurfaceRaised: AppColors.darkSurface2,
    bgSurfaceSunken: AppColors.darkSurface3,
    bgAccentSubtle: AppColors.patina900,
    fgPrimary: AppColors.darkText1,
    fgBody: AppColors.darkText2,
    fgSecondary: AppColors.darkText3,
    fgOnAccent: AppColors.ink950,
    iconDefault: AppColors.darkText2,
    iconAccent: AppColors.patina400,
    borderDefault: AppColors.darkBorder,
    borderStrong: Color(0xFF3E4C47),
    borderAccent: AppColors.patina400,
    accent: AppColors.patina400,
    accentHover: AppColors.patina300,
    accentPressed: AppColors.patina500,
    accent2: AppColors.copper300,
    success: AppColors.successDark,
    warning: AppColors.warningDark,
    danger: AppColors.dangerDark,
    info: AppColors.infoDark,
    moduleRepair: AppColors.moduleRepairDark,
    moduleSell: AppColors.moduleSellDark,
    moduleRecycle: AppColors.moduleRecycleDark,
    moduleReward: AppColors.moduleRewardDark,
    devicePhone: AppColors.devicePhoneDark,
    deviceLaptop: AppColors.deviceLaptopDark,
    deviceTablet: AppColors.deviceTabletDark,
    deviceOther: AppColors.deviceOtherDark,
  );

  @override
  AppTokens copyWith({
    Color? bgCanvas,
    Color? bgSurface,
    Color? bgSurfaceRaised,
    Color? bgSurfaceSunken,
    Color? bgAccentSubtle,
    Color? fgPrimary,
    Color? fgBody,
    Color? fgSecondary,
    Color? fgOnAccent,
    Color? iconDefault,
    Color? iconAccent,
    Color? borderDefault,
    Color? borderStrong,
    Color? borderAccent,
    Color? accent,
    Color? accentHover,
    Color? accentPressed,
    Color? accent2,
    Color? success,
    Color? warning,
    Color? danger,
    Color? info,
    Color? moduleRepair,
    Color? moduleSell,
    Color? moduleRecycle,
    Color? moduleReward,
    Color? devicePhone,
    Color? deviceLaptop,
    Color? deviceTablet,
    Color? deviceOther,
  }) {
    return AppTokens(
      bgCanvas: bgCanvas ?? this.bgCanvas,
      bgSurface: bgSurface ?? this.bgSurface,
      bgSurfaceRaised: bgSurfaceRaised ?? this.bgSurfaceRaised,
      bgSurfaceSunken: bgSurfaceSunken ?? this.bgSurfaceSunken,
      bgAccentSubtle: bgAccentSubtle ?? this.bgAccentSubtle,
      fgPrimary: fgPrimary ?? this.fgPrimary,
      fgBody: fgBody ?? this.fgBody,
      fgSecondary: fgSecondary ?? this.fgSecondary,
      fgOnAccent: fgOnAccent ?? this.fgOnAccent,
      iconDefault: iconDefault ?? this.iconDefault,
      iconAccent: iconAccent ?? this.iconAccent,
      borderDefault: borderDefault ?? this.borderDefault,
      borderStrong: borderStrong ?? this.borderStrong,
      borderAccent: borderAccent ?? this.borderAccent,
      accent: accent ?? this.accent,
      accentHover: accentHover ?? this.accentHover,
      accentPressed: accentPressed ?? this.accentPressed,
      accent2: accent2 ?? this.accent2,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      danger: danger ?? this.danger,
      info: info ?? this.info,
      moduleRepair: moduleRepair ?? this.moduleRepair,
      moduleSell: moduleSell ?? this.moduleSell,
      moduleRecycle: moduleRecycle ?? this.moduleRecycle,
      moduleReward: moduleReward ?? this.moduleReward,
      devicePhone: devicePhone ?? this.devicePhone,
      deviceLaptop: deviceLaptop ?? this.deviceLaptop,
      deviceTablet: deviceTablet ?? this.deviceTablet,
      deviceOther: deviceOther ?? this.deviceOther,
    );
  }

  @override
  AppTokens lerp(ThemeExtension<AppTokens>? other, double t) {
    if (other is! AppTokens) return this;
    Color c(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppTokens(
      bgCanvas: c(bgCanvas, other.bgCanvas),
      bgSurface: c(bgSurface, other.bgSurface),
      bgSurfaceRaised: c(bgSurfaceRaised, other.bgSurfaceRaised),
      bgSurfaceSunken: c(bgSurfaceSunken, other.bgSurfaceSunken),
      bgAccentSubtle: c(bgAccentSubtle, other.bgAccentSubtle),
      fgPrimary: c(fgPrimary, other.fgPrimary),
      fgBody: c(fgBody, other.fgBody),
      fgSecondary: c(fgSecondary, other.fgSecondary),
      fgOnAccent: c(fgOnAccent, other.fgOnAccent),
      iconDefault: c(iconDefault, other.iconDefault),
      iconAccent: c(iconAccent, other.iconAccent),
      borderDefault: c(borderDefault, other.borderDefault),
      borderStrong: c(borderStrong, other.borderStrong),
      borderAccent: c(borderAccent, other.borderAccent),
      accent: c(accent, other.accent),
      accentHover: c(accentHover, other.accentHover),
      accentPressed: c(accentPressed, other.accentPressed),
      accent2: c(accent2, other.accent2),
      success: c(success, other.success),
      warning: c(warning, other.warning),
      danger: c(danger, other.danger),
      info: c(info, other.info),
      moduleRepair: c(moduleRepair, other.moduleRepair),
      moduleSell: c(moduleSell, other.moduleSell),
      moduleRecycle: c(moduleRecycle, other.moduleRecycle),
      moduleReward: c(moduleReward, other.moduleReward),
      devicePhone: c(devicePhone, other.devicePhone),
      deviceLaptop: c(deviceLaptop, other.deviceLaptop),
      deviceTablet: c(deviceTablet, other.deviceTablet),
      deviceOther: c(deviceOther, other.deviceOther),
    );
  }
}
