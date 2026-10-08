import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/core/theme/app_colors.dart';
import 'package:teknolup/core/theme/app_tokens.dart';

/// Module identity (icon + colour) shared by activities, services and map pins.
class ModuleStyle {
  final IconData icon;
  final Color Function(AppTokens) color;
  const ModuleStyle(this.icon, this.color);
}

ModuleStyle moduleOf(String? type) {
  switch (type) {
    case 'repair':
      return ModuleStyle(Symbols.build, (_) => AppColors.repair);
    case 'sell':
      return ModuleStyle(Symbols.sell, (_) => AppColors.sell);
    case 'reward':
      return ModuleStyle(Symbols.workspace_premium, (t) => t.accent);
    case 'recycle':
      return ModuleStyle(Symbols.recycling, (t) => t.accent);
    default:
      return ModuleStyle(Symbols.eco, (t) => t.accent);
  }
}
