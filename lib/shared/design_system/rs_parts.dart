import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/core/theme/app_colors.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/core/utils/password_strength.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';

/// Mono uppercase section label (label style, tracking wider).
class RsSectionLabel extends StatelessWidget {
  final String text;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final double letterSpacing;
  const RsSectionLabel(this.text, {super.key, this.color, this.padding = EdgeInsets.zero, this.letterSpacing = 1.2});
  @override
  Widget build(BuildContext context) => Padding(padding: padding, child: Text(text, style: AppType.label.copyWith(color: color ?? context.tokens.fg2, letterSpacing: letterSpacing)));
}

class RsSectionRow extends StatelessWidget {
  final String title;
  final String? action;
  final VoidCallback? onAction;
  final bool heading;
  const RsSectionRow(this.title, {super.key, this.action, this.onAction, this.heading = false});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
      Text(title, style: heading ? AppType.headingMd.copyWith(color: t.fg) : AppType.label.copyWith(color: t.fg3, letterSpacing: 1.2)),
      if (action != null) GestureDetector(onTap: onAction, child: Text(action!, style: AppType.label.copyWith(color: t.accentStrong))),
    ]);
  }
}

/// h4 track + fill (progress / impact bars).
class RsProgressBar extends StatelessWidget {
  final double value;
  final Color? fill, track;
  final double height;
  final BorderRadius radius;
  const RsProgressBar({super.key, required this.value, this.fill, this.track, this.height = 4, this.radius = BorderRadius.zero});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return ClipRRect(
      borderRadius: radius,
      child: SizedBox(height: height, child: Stack(children: [
        Positioned.fill(child: ColoredBox(color: track ?? t.strong)),
        FractionallySizedBox(widthFactor: value.clamp(0.0, 1.0), child: ColoredBox(color: fill ?? t.accent)),
      ])),
    );
  }
}

class RsPasswordStrength extends StatelessWidget {
  final String value;
  const RsPasswordStrength({super.key, required this.value});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final s = passwordScore(value);
    final colors = [t.danger, AppColors.sell, AppColors.brand400, t.accent];
    final labels = [context.l10n.passwordStrengthIdle, context.l10n.passwordWeak, context.l10n.passwordFair, context.l10n.passwordGood, context.l10n.passwordStrong];
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Row(children: [
          for (var i = 0; i < 4; i++) ...[
            if (i > 0) const SizedBox(width: 4),
            Expanded(child: RsProgressBar(value: i < s ? 1 : 0, fill: colors[(s - 1).clamp(0, 3)], track: t.line, radius: Rad.b12)),
          ],
        ]),
        const SizedBox(height: 4),
        Text(labels[s], style: AppType.caption.copyWith(color: s == 0 ? t.fg2 : (s == 1 ? t.danger : (s == 2 ? AppColors.sell : (s == 3 ? AppColors.brand400 : t.accent))))),
      ]),
    );
  }
}

/// Filter chip (pill). `active` = filled accent.
class RsChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback? onTap;
  final IconData? icon;
  final BorderRadius radius;
  final EdgeInsetsGeometry padding;
  const RsChip(this.label, {super.key, this.active = false, this.onTap, this.icon, this.radius = Rad.b12, this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8)});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsPressable(
      onTap: onTap,
      scale: 0.97,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(color: active ? t.accent : t.muted, borderRadius: radius, border: active ? null : Border.all(color: t.line)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          if (icon != null) ...[RsIcon(icon!, size: 16, color: active ? t.onAccent : t.fg2), const SizedBox(width: 4)],
          Text(label, style: AppType.label.copyWith(color: active ? t.onAccent : t.fg2)),
        ]),
      ),
    );
  }
}

/// Small bordered tag (label 10px).
class RsTag extends StatelessWidget {
  final String text;
  final Color? bg, fg;
  final Color? border;
  const RsTag(this.text, {super.key, this.bg, this.fg, this.border});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(color: bg ?? t.strong, borderRadius: Rad.b2, border: border != null ? Border.all(color: border!) : null),
      child: Text(text, style: AppType.sized(AppType.label, 10).copyWith(color: fg ?? t.fg, letterSpacing: 0.5)),
    );
  }
}

/// Segmented control (Açık / Koyu / Sistem).
class RsSegmented extends StatelessWidget {
  final List<String> labels;
  final int selected;
  final ValueChanged<int> onChanged;
  const RsSegmented({super.key, required this.labels, required this.selected, required this.onChanged});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(color: t.strong, borderRadius: Rad.b4, border: Border.all(color: t.line)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        for (var i = 0; i < labels.length; i++)
          GestureDetector(
            onTap: () => onChanged(i),
            behavior: HitTestBehavior.opaque,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(color: i == selected ? t.raised : Colors.transparent, borderRadius: Rad.b2, border: i == selected ? Border.all(color: t.line) : null, boxShadow: i == selected ? Shadows.sm : null),
              child: Text(labels[i], style: AppType.caption.copyWith(color: i == selected ? t.fg : t.fg2)),
            ),
          ),
      ]),
    );
  }
}

/// Settings-style grouped list card.
class RsGroup extends StatelessWidget {
  final List<Widget> children;
  const RsGroup({super.key, required this.children});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final rows = <Widget>[];
    for (var i = 0; i < children.length; i++) {
      rows.add(children[i]);
      if (i < children.length - 1) rows.add(Divider(height: 1, thickness: 1, color: t.line));
    }
    return RsCard(tone: RsTone.raised, radius: Rad.b8, child: Column(children: rows));
  }
}

class RsRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;
  final bool chevron;
  const RsRow({super.key, required this.icon, required this.title, this.trailing, this.onTap, this.chevron = true});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsPressable(
      scale: 1,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(children: [
          RsIcon(icon, color: t.fg2),
          const SizedBox(width: 12),
          Expanded(child: Text(title, style: AppType.bodyMd.copyWith(color: t.fg))),
          if (trailing != null) trailing!,
          if (chevron && onTap != null) ...[const SizedBox(width: 8), RsIcon(Symbols.chevron_right, size: 20, color: t.fg2)],
        ]),
      ),
    );
  }
}

/// One 4px rounded step segment (M09 / M11 progress).
class RsProgressBarSegment extends StatelessWidget {
  final bool active;
  final Color? color;
  const RsProgressBarSegment({super.key, this.active = false, this.color});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(height: 4, decoration: BoxDecoration(color: active ? (color ?? t.accent) : t.line, borderRadius: Rad.b12));
  }
}
