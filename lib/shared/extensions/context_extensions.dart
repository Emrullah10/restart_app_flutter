import 'package:flutter/material.dart';
import 'package:mobile_flutter/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  // Theme
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;

  // Localization
  AppLocalizations get l10n => AppLocalizations.of(this)!;

  // Size
  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
