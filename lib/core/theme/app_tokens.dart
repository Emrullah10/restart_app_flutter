import 'package:flutter/material.dart';

/// Semantic design tokens (plan §3.2), theme-resolved. Access via `context.tokens`.
/// Same names as the web CSS variables (--c-*).
class AppTokens extends ThemeExtension<AppTokens> {
  final Color canvas;
  final Color surface;
  final Color raised;
  final Color subtle;
  final Color muted;
  final Color strong;
  final Color field;
  final Color fieldCanvas;
  final Color hover;
  final Color bar;
  final Color line;
  final Color lineStrong;
  final Color fg;
  final Color fg2;
  final Color fg3;
  final Color fgOutline;
  final Color fgFaint;
  final Color accent;
  final Color accentStrong;
  final Color accentHover;
  final Color onAccent;
  final Color accentSubtle;
  final Color onAccentSubtle;
  final Color accentContainer;
  final Color accentContainerDim;
  final Color onAccentContainer;
  final Color danger;
  final Color dangerSubtle;
  final Color sellTint;
  final Color repairTint;

  const AppTokens({required this.canvas, required this.surface, required this.raised, required this.subtle, required this.muted, required this.strong, required this.field, required this.fieldCanvas, required this.hover, required this.bar, required this.line, required this.lineStrong, required this.fg, required this.fg2, required this.fg3, required this.fgOutline, required this.fgFaint, required this.accent, required this.accentStrong, required this.accentHover, required this.onAccent, required this.accentSubtle, required this.onAccentSubtle, required this.accentContainer, required this.accentContainerDim, required this.onAccentContainer, required this.danger, required this.dangerSubtle, required this.sellTint, required this.repairTint});

  static const light = AppTokens(canvas: Color(0xFFF9F9F7), surface: Color(0xFFF9F9F7), raised: Color(0xFFFDFDFB), subtle: Color(0xFFF4F4F2), muted: Color(0xFFEEEEEC), strong: Color(0xFFE2E3E1), field: Color(0xFFF7F7F3), fieldCanvas: Color(0xFFF7F7F3), hover: Color(0xFFF4F4F2), bar: Color(0xF2F7F7F3), line: Color(0xFFE2E3DC), lineStrong: Color(0xFFBFC9C2), fg: Color(0xFF1A1C1B), fg2: Color(0xFF404944), fg3: Color(0xFF8A9490), fgOutline: Color(0xFF707973), fgFaint: Color(0xFFBFC9C2), accent: Color(0xFF2E6952), accentStrong: Color(0xFF11513B), accentHover: Color(0xFF132E25), onAccent: Color(0xFFFFFFFF), accentSubtle: Color(0xFFF0F5F2), onAccentSubtle: Color(0xFF132E25), accentContainer: Color(0xFFB2F0D2), accentContainerDim: Color(0xFF97D3B7), onAccentContainer: Color(0xFF11503B), danger: Color(0xFFA63A32), dangerSubtle: Color(0xFFFFDAD6), sellTint: Color(0xFFFFF8E7), repairTint: Color(0xFFE8F1F5));
  static const dark = AppTokens(canvas: Color(0xFF141C1A), surface: Color(0xFF1E2724), raised: Color(0xFF1E2724), subtle: Color(0xFF1E2724), muted: Color(0xFF2F3936), strong: Color(0xFF2F3936), field: Color(0xFF141C1A), fieldCanvas: Color(0xFF1E2724), hover: Color(0xFF2F3936), bar: Color(0xF2141C1A), line: Color(0xFF2F3936), lineStrong: Color(0xFF2F3936), fg: Color(0xFFFDFDFB), fg2: Color(0xFFE2E3DC), fg3: Color(0xFF8A9490), fgOutline: Color(0xFF8A9490), fgFaint: Color(0xFF8A9490), accent: Color(0xFF5F9A83), accentStrong: Color(0xFF5F9A83), accentHover: Color(0xFF2E6952), onAccent: Color(0xFF141C1A), accentSubtle: Color(0xFF132E25), onAccentSubtle: Color(0xFFFDFDFB), accentContainer: Color(0xFF132E25), accentContainerDim: Color(0xFF2E6952), onAccentContainer: Color(0xFFB2F0D2), danger: Color(0xFFA63A32), dangerSubtle: Color(0x1AA63A32), sellTint: Color(0xFF2A1D08), repairTint: Color(0xFF0C1F2B));

  @override
  AppTokens copyWith({Color? canvas, Color? surface, Color? raised, Color? subtle, Color? muted, Color? strong, Color? field, Color? fieldCanvas, Color? hover, Color? bar, Color? line, Color? lineStrong, Color? fg, Color? fg2, Color? fg3, Color? fgOutline, Color? fgFaint, Color? accent, Color? accentStrong, Color? accentHover, Color? onAccent, Color? accentSubtle, Color? onAccentSubtle, Color? accentContainer, Color? accentContainerDim, Color? onAccentContainer, Color? danger, Color? dangerSubtle, Color? sellTint, Color? repairTint}) => AppTokens(canvas: canvas ?? this.canvas, surface: surface ?? this.surface, raised: raised ?? this.raised, subtle: subtle ?? this.subtle, muted: muted ?? this.muted, strong: strong ?? this.strong, field: field ?? this.field, fieldCanvas: fieldCanvas ?? this.fieldCanvas, hover: hover ?? this.hover, bar: bar ?? this.bar, line: line ?? this.line, lineStrong: lineStrong ?? this.lineStrong, fg: fg ?? this.fg, fg2: fg2 ?? this.fg2, fg3: fg3 ?? this.fg3, fgOutline: fgOutline ?? this.fgOutline, fgFaint: fgFaint ?? this.fgFaint, accent: accent ?? this.accent, accentStrong: accentStrong ?? this.accentStrong, accentHover: accentHover ?? this.accentHover, onAccent: onAccent ?? this.onAccent, accentSubtle: accentSubtle ?? this.accentSubtle, onAccentSubtle: onAccentSubtle ?? this.onAccentSubtle, accentContainer: accentContainer ?? this.accentContainer, accentContainerDim: accentContainerDim ?? this.accentContainerDim, onAccentContainer: onAccentContainer ?? this.onAccentContainer, danger: danger ?? this.danger, dangerSubtle: dangerSubtle ?? this.dangerSubtle, sellTint: sellTint ?? this.sellTint, repairTint: repairTint ?? this.repairTint);

  @override
  AppTokens lerp(ThemeExtension<AppTokens>? other, double t) {
    if (other is! AppTokens) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppTokens(canvas: l(canvas, other.canvas), surface: l(surface, other.surface), raised: l(raised, other.raised), subtle: l(subtle, other.subtle), muted: l(muted, other.muted), strong: l(strong, other.strong), field: l(field, other.field), fieldCanvas: l(fieldCanvas, other.fieldCanvas), hover: l(hover, other.hover), bar: l(bar, other.bar), line: l(line, other.line), lineStrong: l(lineStrong, other.lineStrong), fg: l(fg, other.fg), fg2: l(fg2, other.fg2), fg3: l(fg3, other.fg3), fgOutline: l(fgOutline, other.fgOutline), fgFaint: l(fgFaint, other.fgFaint), accent: l(accent, other.accent), accentStrong: l(accentStrong, other.accentStrong), accentHover: l(accentHover, other.accentHover), onAccent: l(onAccent, other.onAccent), accentSubtle: l(accentSubtle, other.accentSubtle), onAccentSubtle: l(onAccentSubtle, other.onAccentSubtle), accentContainer: l(accentContainer, other.accentContainer), accentContainerDim: l(accentContainerDim, other.accentContainerDim), onAccentContainer: l(onAccentContainer, other.onAccentContainer), danger: l(danger, other.danger), dangerSubtle: l(dangerSubtle, other.dangerSubtle), sellTint: l(sellTint, other.sellTint), repairTint: l(repairTint, other.repairTint));
  }
}
