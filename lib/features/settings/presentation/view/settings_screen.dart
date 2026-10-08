import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:teknolup/app/router/app_routes.dart';
import 'package:teknolup/core/localization/localization_provider.dart';
import 'package:teknolup/core/platform/adaptive.dart';
import 'package:teknolup/core/theme/app_spacing.dart';
import 'package:teknolup/core/theme/app_typography.dart';
import 'package:teknolup/core/theme/theme_provider.dart';
import 'package:teknolup/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:teknolup/shared/design_system/rs_bars.dart';
import 'package:teknolup/shared/design_system/rs_core.dart';
import 'package:teknolup/shared/design_system/rs_parts.dart';
import 'package:teknolup/shared/extensions/context_extensions.dart';
import 'package:package_info_plus/package_info_plus.dart';

final _versionProvider = FutureProvider<String>((ref) async => 'v${(await PackageInfo.fromPlatform()).version}');

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = context.tokens;
    final l = context.l10n;
    final mode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);
    final version = ref.watch(_versionProvider).valueOrNull ?? '';

    Widget section(String title, Widget group) => Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(padding: const EdgeInsets.only(left: 8, bottom: 12), child: Text(title, style: AppType.label.copyWith(color: t.fg3))),
            group,
          ]),
        );

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: const RsBrandBar(),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: ListView(padding: const EdgeInsets.fromLTRB(24, 24, 24, 24), children: [
            Padding(padding: const EdgeInsets.only(bottom: 24), child: Text(l.setTitle, style: AppType.displayLgMobile.copyWith(color: t.fg))),
            section(l.setAppearance, RsGroup(children: [
              RsRow(icon: Symbols.palette, title: l.setTheme, chevron: false, trailing: RsSegmented(
                labels: [l.setLight, l.setDark, l.setSystem],
                selected: mode == ThemeMode.light ? 0 : (mode == ThemeMode.dark ? 1 : 2),
                onChanged: (i) => ref.read(themeProvider.notifier).setTheme([ThemeMode.light, ThemeMode.dark, ThemeMode.system][i]),
              )),
              RsRow(icon: Symbols.language, title: l.setLanguage, trailing: Text(locale.languageCode == 'tr' ? 'Türkçe' : 'English', style: AppType.bodyMd.copyWith(color: t.fg2)), onTap: () async {
                final i = await Adaptive.showActionSheet(context: context, title: l.setLanguage, actions: const ['Türkçe', 'English'], cancelLabel: l.commonRetry);
                if (i != null) await ref.read(localeProvider.notifier).setLocale(Locale(i == 0 ? 'tr' : 'en'));
              }),
            ])),
            section(l.setAccount, RsGroup(children: [
              RsRow(icon: Symbols.person, title: l.setProfile, onTap: () => context.go(Routes.profile)),
              RsRow(icon: Symbols.key, title: l.setPassword, onTap: () => context.go(Routes.settingsPassword)),
              RsRow(icon: Symbols.notifications_active, title: l.setNotifs, onTap: () => context.go(Routes.settingsNotifications)),
            ])),
            section(l.setSecurity, RsGroup(children: [
              RsRow(icon: Symbols.shield_lock, title: l.setSession, chevron: false, trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: t.accentStrong.withValues(alpha: 0.1), borderRadius: Rad.b6, border: Border.all(color: t.accentStrong.withValues(alpha: 0.2))),
                child: Row(mainAxisSize: MainAxisSize.min, children: [RsIcon(Symbols.check_circle, size: 14, color: t.accent, filled: true), const SizedBox(width: 4), Text(l.setActive, style: AppType.label.copyWith(color: t.accent))]),
              )),
            ])),
            section(l.setAbout, RsGroup(children: [
              RsRow(icon: Symbols.description, title: l.setTerms, onTap: () => context.push(Routes.legal('terms'))),
              RsRow(icon: Symbols.policy, title: l.setPrivacy, onTap: () => context.push(Routes.legal('privacy'))),
              RsRow(icon: Symbols.info, title: l.setVersion, chevron: false, trailing: Text(version, style: AppType.label.copyWith(color: t.fg2))),
            ])),
            RsButton(l.setLogout, icon: Symbols.logout, variant: RsButtonVariant.dangerOutline, textStyle: AppType.headingMd, padding: const EdgeInsets.symmetric(vertical: 16), onPressed: () => ref.read(authViewModelProvider.notifier).logout()),
            const SizedBox(height: 32),
          ]),
        ),
      ),
    );
  }
}
