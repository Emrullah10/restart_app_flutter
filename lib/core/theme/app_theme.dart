import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:teknolup/core/theme/app_tokens.dart';
import 'package:teknolup/core/theme/app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme => _build(AppTokens.light, Brightness.light);
  static ThemeData get darkTheme => _build(AppTokens.dark, Brightness.dark);

  static ThemeData _build(AppTokens t, Brightness b) {
    final dark = b == Brightness.dark;
    final scheme = ColorScheme(
      brightness: b,
      primary: t.accent,
      onPrimary: t.onAccent,
      secondary: t.accentStrong,
      onSecondary: t.onAccent,
      error: t.danger,
      onError: Colors.white,
      surface: t.surface,
      onSurface: t.fg,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: b,
      colorScheme: scheme,
      scaffoldBackgroundColor: t.canvas,
      canvasColor: t.canvas,
      fontFamily: 'Inter',
      textTheme: TextTheme(
        bodyLarge: AppType.bodyMd.copyWith(color: t.fg),
        bodyMedium: AppType.bodyMd.copyWith(color: t.fg),
        bodySmall: AppType.caption.copyWith(color: t.fg2),
        titleLarge: AppType.headingLg.copyWith(color: t.fg),
        titleMedium: AppType.headingMd.copyWith(color: t.fg),
        labelLarge: AppType.label.copyWith(color: t.fg),
      ),
      dividerColor: t.line,
      splashFactory: NoSplash.splashFactory,
      highlightColor: t.hover,
      iconTheme: IconThemeData(color: t.fg2, size: 24),
      appBarTheme: AppBarTheme(
        backgroundColor: t.bar,
        elevation: 0,
        scrolledUnderElevation: 0,
        systemOverlayStyle: dark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      ),
      checkboxTheme: CheckboxThemeData(
        side: BorderSide(color: t.lineStrong),
        fillColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? t.accent : t.fieldCanvas),
        checkColor: WidgetStatePropertyAll(t.onAccent),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(t.raised),
        trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? t.accent : t.strong),
      ),
      snackBarTheme: SnackBarThemeData(backgroundColor: t.fg, contentTextStyle: AppType.caption.copyWith(color: t.canvas), behavior: SnackBarBehavior.floating),
      extensions: [t],
    );
  }
}
