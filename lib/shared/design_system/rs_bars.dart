import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/app/router/app_routes.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

/// Stitch top bar. Heights: 56 (home) / 64 (everything else). `bg` defaults to the 95% `bar` token.
class RsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading, trailing;
  final Widget? centerTitle; // centered title (brand variants)
  final String? startTitle; // left-aligned title (title variants)
  final TextStyle? titleStyle;
  final Color? titleColor;
  final Color? bg;
  final bool bordered;
  final double barHeight;
  const RsAppBar({super.key, this.leading, this.trailing, this.centerTitle, this.startTitle, this.titleStyle, this.titleColor, this.bg, this.bordered = true, this.barHeight = 64});

  @override
  Size get preferredSize => Size.fromHeight(barHeight);

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final top = MediaQuery.of(context).padding.top;
    return Container(
      height: barHeight + top,
      padding: EdgeInsets.fromLTRB(24, top, 24, 0),
      decoration: BoxDecoration(color: bg ?? t.bar, border: bordered ? Border(bottom: BorderSide(color: t.line)) : null),
      child: Stack(alignment: Alignment.center, children: [
        if (centerTitle != null) Center(child: centerTitle),
        Row(children: [
          if (leading != null) leading!,
          if (startTitle != null) Expanded(child: Text(startTitle!, style: titleStyle ?? AppType.headingLg.copyWith(color: titleColor ?? t.fg), maxLines: 1, overflow: TextOverflow.ellipsis)) else const Spacer(),
          if (trailing != null) trailing!,
        ]),
      ]),
    );
  }
}

class RsBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final Color? color;
  final bool filled;
  final double size;
  final String? tooltip;
  const RsBarButton(this.icon, {super.key, this.onTap, this.color, this.filled = false, this.size = 24, this.tooltip});
  @override
  Widget build(BuildContext context) => Tooltip(
        message: tooltip ?? '',
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: onTap,
          child: SizedBox(width: 40, height: 40, child: Center(child: RsIcon(icon, size: size, color: color ?? context.tokens.fg2, filled: filled))),
        ),
      );
}

Widget rsBack(BuildContext context, {Color? color}) => RsBarButton(Symbols.arrow_back, color: color ?? context.tokens.accent, onTap: () => context.canPop() ? context.pop() : context.go(Routes.home));
Widget rsBell(BuildContext context, {Color? color}) => RsBarButton(Symbols.notifications, color: color, onTap: () => context.push(Routes.notifications));
Widget rsMenu(BuildContext context, {Color? color, bool filled = false}) => RsBarButton(Symbols.eco, color: color, filled: filled, onTap: () => showRsMenu(context));

/// "TeknoLup" brand bar (M08/M10/M11/M16/M17 and — with menu/bell added — M03).
class RsBrandBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool backLeading;
  final bool large;
  final Color? iconColor;
  final bool menuFilled;
  const RsBrandBar({super.key, this.title = 'TeknoLup', this.backLeading = false, this.large = true, this.iconColor, this.menuFilled = false});
  @override
  Size get preferredSize => Size.fromHeight(large ? 64 : 56);
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsAppBar(
      barHeight: large ? 64 : 56,
      bg: large ? t.bar : t.bar,
      leading: backLeading ? rsBack(context, color: iconColor) : rsMenu(context, color: iconColor ?? t.fg2, filled: menuFilled),
      centerTitle: Text(title, style: (large ? AppType.displayLgMobile : AppType.headingMd).copyWith(color: large ? t.accentStrong : t.accent, letterSpacing: large ? -0.3 : -0.2)),
      trailing: rsBell(context, color: iconColor),
    );
  }
}

/// Bottom navigation (Family B): Harita · Dönüştür · Ana Sayfa · Sat · Ödüller.
class RsBottomNav extends StatelessWidget {
  final int currentIndex; // branch order: 0 map, 1 recycle, 2 home, 3 sell, 4 rewards
  final ValueChanged<int> onTap;
  const RsBottomNav({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final items = [
      (Symbols.map, l.navMapLabel),
      (Symbols.recycling, l.navRecycleLabel),
      (Symbols.home, l.navHomeLabel),
      (Symbols.sell, l.navSellLabel),
      (Symbols.workspace_premium, l.navRewardsLabel),
    ];
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: MediaQuery.of(context).padding.bottom),
      height: 80 + MediaQuery.of(context).padding.bottom,
      decoration: BoxDecoration(color: t.bar, border: Border(top: BorderSide(color: t.line))),
      child: Row(children: [
        for (var i = 0; i < items.length; i++)
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () { HapticFeedback.selectionClick(); onTap(i); },
              child: AnimatedScale(
                scale: 0.95,
                duration: const Duration(milliseconds: 100),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RsIcon(items[i].$1, color: i == currentIndex ? t.accent : t.fg3, filled: i == currentIndex, weight: i == currentIndex ? 700 : 400),
                  const SizedBox(height: 4),
                  FittedBox(fit: BoxFit.scaleDown, child: Text(items[i].$2, maxLines: 1, softWrap: false, style: AppType.label.copyWith(color: i == currentIndex ? t.accent : t.fg3, fontWeight: i == currentIndex ? FontWeight.w700 : FontWeight.w600))),
                ]),
              ),
            ),
          ),
      ]),
    );
  }
}

/// Eco-menu: every screen that is not a bottom-nav tab.
Future<void> showRsMenu(BuildContext context) {
  final t = context.tokens;
  final l = context.l10n;
  final items = [
    (Symbols.person, l.menuProfile, Routes.profile),
    (Symbols.explore, l.menuDiscover, Routes.discover),
    (Symbols.build, l.menuRepair, Routes.repair),
    (Symbols.notifications, l.menuNotifications, Routes.notifications),
    (Symbols.settings, l.menuSettings, Routes.settings),
    (Symbols.mail, l.menuContact, Routes.contact),
  ];
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: t.raised,
    shape: RoundedRectangleBorder(borderRadius: const BorderRadius.vertical(top: Rad.r12), side: BorderSide(color: t.line)),
    builder: (ctx) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(width: 32, height: 4, decoration: BoxDecoration(color: t.lineStrong, borderRadius: Rad.b12)),
          const SizedBox(height: 16),
          Align(alignment: Alignment.centerLeft, child: Text(l.menuTitle.toUpperCase(), style: AppType.label.copyWith(color: t.fg3, letterSpacing: 1.2))),
          const SizedBox(height: 12),
          for (final it in items)
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () { Navigator.of(ctx).pop(); context.go(it.$3); },
              child: Padding(padding: const EdgeInsets.symmetric(vertical: 14), child: Row(children: [RsIcon(it.$1, color: t.fg2), const SizedBox(width: 12), Expanded(child: Text(it.$2, style: AppType.bodyMd.copyWith(color: t.fg))), RsIcon(Symbols.chevron_right, size: 20, color: t.fg3)])),
            ),
        ]),
      ),
    ),
  );
}
