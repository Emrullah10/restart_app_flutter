import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_tokens.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

enum RsTone { canvas, surface, raised, subtle, muted, strong, field, fieldCanvas, accentSubtle }

Color toneColor(AppTokens t, RsTone tone) => switch (tone) {
      RsTone.canvas => t.canvas,
      RsTone.surface => t.surface,
      RsTone.raised => t.raised,
      RsTone.subtle => t.subtle,
      RsTone.muted => t.muted,
      RsTone.strong => t.strong,
      RsTone.field => t.field,
      RsTone.fieldCanvas => t.fieldCanvas,
      RsTone.accentSubtle => t.accentSubtle,
    };

enum RsStripe { none, accent, brand, repair, sell, line, accentStrong, copper, tangerine }

Color? stripeColor(AppTokens t, RsStripe s) => switch (s) {
      RsStripe.none => null,
      RsStripe.accent => t.accent,
      RsStripe.brand => AppColors.brand400,
      RsStripe.repair => AppColors.repair,
      RsStripe.sell => AppColors.sell,
      RsStripe.line => t.lineStrong,
      RsStripe.accentStrong => t.accentStrong,
      RsStripe.copper => AppColors.copper500,
      RsStripe.tangerine => AppColors.tangerine,
    };

/// Material Symbols Outlined with FILL / weight axes (plan §3.6).
class RsIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color? color;
  final bool filled;
  final double weight;
  const RsIcon(this.icon, {super.key, this.size = 24, this.color, this.filled = false, this.weight = 400});

  @override
  Widget build(BuildContext context) => Icon(icon, size: size, color: color ?? context.tokens.fg2, fill: filled ? 1 : 0, weight: weight, opticalSize: 24, grade: 0);
}

/// Border-first card with optional 3px left identity stripe (module colour).
class RsCard extends StatelessWidget {
  final Widget child;
  final RsTone tone;
  final RsStripe stripe;
  final BorderRadius radius;
  final EdgeInsetsGeometry padding;
  final bool border;
  final Color? borderColor;
  final List<BoxShadow>? shadow;
  final VoidCallback? onTap;
  final bool dashed;
  const RsCard({
    super.key,
    required this.child,
    this.tone = RsTone.surface,
    this.stripe = RsStripe.none,
    this.radius = Rad.b4,
    this.padding = EdgeInsets.zero,
    this.border = true,
    this.borderColor,
    this.shadow,
    this.onTap,
    this.dashed = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final sc = stripeColor(t, stripe);
    final body = Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: toneColor(t, tone),
        borderRadius: radius,
        border: border && !dashed ? Border.all(color: borderColor ?? t.line) : null,
        boxShadow: shadow,
      ),
      child: Stack(children: [
        Padding(padding: padding, child: child),
        if (sc != null) Positioned(left: 0, top: 0, bottom: 0, width: 3, child: ColoredBox(color: sc)),
      ]),
    );
    final decorated = dashed ? CustomPaint(foregroundPainter: _DashedBorder(borderColor ?? t.lineStrong, radius), child: body) : body;
    if (onTap == null) return decorated;
    return GestureDetector(onTap: onTap, behavior: HitTestBehavior.opaque, child: decorated);
  }
}

class _DashedBorder extends CustomPainter {
  final Color color;
  final BorderRadius radius;
  _DashedBorder(this.color, this.radius);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()..addRRect(radius.toRRect(Offset.zero & size));
    final paint = Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 1;
    for (final m in path.computeMetrics()) {
      var d = 0.0;
      while (d < m.length) {
        canvas.drawPath(m.extractPath(d, d + 4), paint);
        d += 7;
      }
    }
  }

  @override
  bool shouldRepaint(covariant _DashedBorder o) => o.color != color;
}

/// Square icon container (32/40/48/64).
class RsIconBox extends StatelessWidget {
  final IconData icon;
  final double size, iconSize;
  final RsTone tone;
  final Color? color;
  final Color? bg;
  final BorderRadius radius;
  final bool filled, border;
  const RsIconBox(this.icon, {super.key, this.size = 40, this.iconSize = 24, this.tone = RsTone.muted, this.color, this.bg, this.radius = Rad.b2, this.filled = false, this.border = false});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: bg ?? toneColor(t, tone), borderRadius: radius, border: border ? Border.all(color: t.line) : null),
      alignment: Alignment.center,
      child: RsIcon(icon, size: iconSize, color: color ?? t.fg2, filled: filled),
    );
  }
}

class RsAvatar extends StatelessWidget {
  final String name;
  final double size;
  final bool accent;
  final double? fontSize;
  final Color? borderColor;
  const RsAvatar({super.key, required this.name, this.size = 32, this.accent = false, this.fontSize, this.borderColor});

  static String initials(String s) {
    final p = s.trim().split(RegExp(r'\s+')).where((e) => e.isNotEmpty).take(2).toList();
    return p.isEmpty ? 'R' : p.map((e) => e[0].toUpperCase()).join();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: accent ? t.accent : t.strong, borderRadius: Rad.b12, border: borderColor != null ? Border.all(color: borderColor!, width: size > 60 ? 4 : 1) : null),
      child: Text(initials(name), style: (accent ? AppType.dataXl : AppType.label).copyWith(fontSize: fontSize ?? (size > 60 ? 40 : 11), color: accent ? t.onAccent : t.fg2, height: 1)),
    );
  }
}

/// Pressed-state scale used on tappable cards/buttons (Stitch `active:scale-95`).
class RsPressable extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double scale;
  const RsPressable({super.key, required this.child, this.onTap, this.scale = 0.95});
  @override
  State<RsPressable> createState() => _RsPressableState();
}

class _RsPressableState extends State<RsPressable> {
  bool _down = false;
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap == null ? null : () { HapticFeedback.selectionClick(); widget.onTap!(); },
        onTapDown: (_) => setState(() => _down = true),
        onTapUp: (_) => setState(() => _down = false),
        onTapCancel: () => setState(() => _down = false),
        child: AnimatedScale(scale: _down ? widget.scale : 1, duration: const Duration(milliseconds: 100), child: widget.child),
      );
}

enum RsButtonVariant { primary, secondary, outline, dangerOutline }

class RsButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final RsButtonVariant variant;
  final IconData? icon, iconRight;
  final bool iconRightFilled;
  final BorderRadius radius;
  final EdgeInsetsGeometry padding;
  final TextStyle? textStyle;
  final bool full, loading;
  final double? height;
  const RsButton(this.label, {super.key, this.onPressed, this.variant = RsButtonVariant.primary, this.icon, this.iconRight, this.iconRightFilled = false, this.radius = Rad.b4, this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12), this.textStyle, this.full = true, this.loading = false, this.height});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final enabled = onPressed != null && !loading;
    final (bg, fg, bd) = switch (variant) {
      RsButtonVariant.primary => (t.accent, t.onAccent, null),
      RsButtonVariant.secondary => (t.muted, t.fg, t.line),
      RsButtonVariant.outline => (t.surface, t.fg, t.line),
      RsButtonVariant.dangerOutline => (t.dangerSubtle, t.danger, t.danger),
    };
    final style = (textStyle ?? AppType.label).copyWith(color: fg);
    final content = Row(
      mainAxisSize: full ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (loading) SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2, color: fg))
        else ...[
          if (icon != null) ...[RsIcon(icon!, size: 18, color: fg), const SizedBox(width: 8)],
          Flexible(child: Text(label, style: style, textAlign: TextAlign.center)),
          if (iconRight != null) ...[const SizedBox(width: 8), RsIcon(iconRight!, size: 18, color: fg, filled: iconRightFilled)],
        ],
      ],
    );
    return Opacity(
      opacity: enabled || loading ? 1 : 0.5,
      child: RsPressable(
        scale: 0.98,
        onTap: enabled ? onPressed : null,
        child: Container(
          height: height,
          padding: padding,
          alignment: Alignment.center,
          decoration: BoxDecoration(color: bg, borderRadius: radius, border: bd != null ? Border.all(color: bd) : null),
          child: content,
        ),
      ),
    );
  }
}

/// Text field with the Stitch look: bordered, optional leading icon, 2px accent focus ring.
class RsTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final IconData? icon;
  final bool obscure;
  final Widget? trailing;
  final TextInputType? keyboardType;
  final int maxLines;
  final int? maxLength;
  final BorderRadius radius;
  final Color? fill;
  final Color? borderColor;
  final ValueChanged<String>? onChanged;
  final String? error;
  final double? height;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? style;
  final Widget? labelTrailing;
  final bool upperLabel;
  const RsTextField({super.key, this.label, this.hint, this.controller, this.icon, this.obscure = false, this.trailing, this.keyboardType, this.maxLines = 1, this.maxLength, this.radius = Rad.b4, this.fill, this.borderColor, this.onChanged, this.error, this.height, this.contentPadding, this.style, this.labelTrailing, this.upperLabel = false});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    OutlineInputBorder b(Color c, [double w = 1]) => OutlineInputBorder(borderRadius: radius, borderSide: BorderSide(color: c, width: w));
    final field = TextField(
      controller: controller,
      obscureText: obscure,
      keyboardType: keyboardType,
      maxLines: obscure ? 1 : maxLines,
      maxLength: maxLength,
      onChanged: onChanged,
      cursorColor: t.accent,
      style: style ?? AppType.bodyMd.copyWith(color: t.fg),
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        hintText: hint,
        hintStyle: AppType.bodyMd.copyWith(color: t.fg3),
        filled: true,
        fillColor: fill ?? t.fieldCanvas,
        contentPadding: contentPadding ?? EdgeInsets.fromLTRB(icon != null ? 40 : 16, 12, trailing != null ? 40 : 16, 12),
        prefixIcon: icon == null ? null : Padding(padding: const EdgeInsets.only(left: 12, right: 8), child: RsIcon(icon!, size: 24, color: t.fg3)),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: trailing,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        enabledBorder: b(error != null ? t.danger : (borderColor ?? t.line)),
        focusedBorder: b(error != null ? t.danger : t.accent, 2),
        border: b(borderColor ?? t.line),
      ),
    );
    final lbl = label == null
        ? null
        : Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(upperLabel ? label!.toUpperCase() : label!, style: AppType.label.copyWith(color: t.fg2)), if (labelTrailing != null) labelTrailing!]),
          );
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (lbl != null) lbl,
      height != null ? SizedBox(height: height, child: field) : field,
      if (error != null) Padding(padding: const EdgeInsets.only(top: 4), child: Text(error!, style: AppType.caption.copyWith(color: t.danger))),
    ]);
  }
}

/// Password field with show/hide toggle.
class RsPasswordField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextEditingController controller;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final BorderRadius radius;
  final Color? fill;
  final bool toggle;
  final Widget? labelTrailing;
  const RsPasswordField({super.key, this.label, this.hint, required this.controller, this.icon = Symbols.lock, this.onChanged, this.radius = Rad.b4, this.fill, this.toggle = true, this.labelTrailing});
  @override
  State<RsPasswordField> createState() => _RsPasswordFieldState();
}

class _RsPasswordFieldState extends State<RsPasswordField> {
  bool _shown = false;
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsTextField(
      label: widget.label,
      labelTrailing: widget.labelTrailing,
      hint: widget.hint,
      controller: widget.controller,
      icon: widget.icon,
      obscure: !_shown,
      radius: widget.radius,
      fill: widget.fill,
      onChanged: widget.onChanged,
      trailing: widget.toggle ? GestureDetector(onTap: () => setState(() => _shown = !_shown), child: Padding(padding: const EdgeInsets.only(right: 12, left: 8), child: RsIcon(_shown ? Symbols.visibility_off : Symbols.visibility, color: t.fg3))) : null,
    );
  }
}
