import 'package:flutter/material.dart';
import 'package:mobile_flutter/core/theme/app_tokens.dart';
import 'package:mobile_flutter/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colorScheme => theme.colorScheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Semantic tokens (light/dark resolved).
  AppTokens get tokens => theme.extension<AppTokens>()!;

  AppLocalizations get l10n => AppLocalizations.of(this)!;
  bool get isTr => Localizations.localeOf(this).languageCode == 'tr';

  Size get size => MediaQuery.of(this).size;
  double get width => size.width;
  double get height => size.height;
}
