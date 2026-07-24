import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/core/localization/localization_provider.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
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
            _buildThemeTile(context, ref, themeMode),

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

  Widget _buildThemeTile(
    BuildContext context,
    WidgetRef ref,
    ThemeMode themeMode,
  ) {
    return Container(
      padding: 16.allP,
      decoration: BoxDecoration(
        color: context.theme.cardColor,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: 10.allP,
                decoration: BoxDecoration(
                  color: context.colorScheme.primary.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  LucideIcons.moon,
                  color: context.colorScheme.primary,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                context.l10n.themeTitle,
                style: context.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: double.infinity,
            child: SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(
                  value: ThemeMode.light,
                  icon: Icon(LucideIcons.sun, size: 16.sp),
                  label: Text(context.l10n.themeLight),
                ),
                ButtonSegment(
                  value: ThemeMode.dark,
                  icon: Icon(LucideIcons.moon, size: 16.sp),
                  label: Text(context.l10n.themeDark),
                ),
                ButtonSegment(
                  value: ThemeMode.system,
                  icon: Icon(LucideIcons.smartphone, size: 16.sp),
                  label: Text(context.l10n.themeSystem),
                ),
              ],
              selected: {themeMode},
              showSelectedIcon: false,
              onSelectionChanged: (Set<ThemeMode> selection) {
                ref.read(themeProvider.notifier).setTheme(selection.first);
              },
            ),
          ),
        ],
      ),
    );
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
                    color: context.isDarkMode
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight,
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
