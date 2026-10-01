import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

/// Backend `badge.icon` keys → Material Symbols (colour always comes from the theme).
IconData badgeIcon(String? key) => switch (key) {
      'star' => Symbols.star,
      'recycle' => Symbols.recycling,
      'wrench' => Symbols.build,
      'flame' => Symbols.local_fire_department,
      'leaf' => Symbols.energy_savings_leaf,
      'trophy' => Symbols.emoji_events,
      _ => Symbols.military_tech,
    };

enum RewardLabel { digital, transit, service, eco }

class RewardVisual {
  final IconData icon;
  final RewardLabel? label;
  const RewardVisual(this.icon, this.label);
}

/// Reward catalogue has no icon/category on the backend (plan §1.5) → resolved from title keywords.
RewardVisual rewardVisual(String title, String subtitle) {
  final s = '$title $subtitle'.toLowerCase();
  if (RegExp(r'kargo|ship|delivery').hasMatch(s)) return const RewardVisual(Symbols.local_shipping, RewardLabel.transit);
  if (RegExp(r'tamir|repair|onar').hasMatch(s)) return const RewardVisual(Symbols.handyman, RewardLabel.service);
  if (RegExp(r'ağaç|tree|fidan|forest').hasMatch(s)) return const RewardVisual(Symbols.forest, RewardLabel.eco);
  if (RegExp(r'kahve|coffee|kupon|voucher|indirim').hasMatch(s)) return const RewardVisual(Symbols.redeem, RewardLabel.digital);
  return const RewardVisual(Symbols.redeem, null);
}
