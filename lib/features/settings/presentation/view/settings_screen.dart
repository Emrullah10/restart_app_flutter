import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/localization/localization_provider.dart';
import 'package:mobile_flutter/core/theme/theme_provider.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';
import 'package:mobile_flutter/shared/extensions/padding_extensions.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          context.l10n.settingsTitle,
          style: context.textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.theme.brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            color: context.theme.iconTheme.color,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: 24.allP,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader(
              context,
              context.l10n.settingsAppearanceLanguage,
            ),
            SizedBox(height: 16.h),

            // Theme Setting
            _buildSettingsTile(
              context,
              icon: LucideIcons.moon,
              title: context.l10n.themeTitle,
              subtitle: _getThemeText(context, themeMode),
              trailing: Switch(
                value: themeMode == ThemeMode.dark,
                activeThumbColor: context.colorScheme.primary,
                onChanged: (value) {
                  ref
                      .read(themeProvider.notifier)
                      .setTheme(value ? ThemeMode.dark : ThemeMode.light);
                },
              ),
            ),

            SizedBox(height: 16.h),

            // Language Setting
            _buildSettingsTile(
              context,
              icon: LucideIcons.languages,
              title: context.l10n.languageTitle,
              subtitle: locale.languageCode == 'tr' ? 'Türkçe' : 'English',
              trailing: Switch(
                value: locale.languageCode == 'en',
                activeThumbColor: context.colorScheme.primary,
                onChanged: (value) {
                  ref.read(localeProvider.notifier).toggleLocale();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getThemeText(BuildContext context, ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return context.l10n.themeLight;
      case ThemeMode.dark:
        return context.l10n.themeDark;
      case ThemeMode.system:
        return context.l10n.themeSystem;
    }
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        color: context.colorScheme.primary,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget trailing,
  }) {
    return Container(
      padding: 16.allP,
      decoration: BoxDecoration(
        color: context.theme.cardColor, // Uses correct surface color from theme
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.1)),
        boxShadow: context.isDarkMode
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
      ),
      child: Row(
        children: [
          Container(
            padding: 10.allP,
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: context.colorScheme.primary, size: 20.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  subtitle,
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          trailing,
        ],
      ),
    );
  }
}
