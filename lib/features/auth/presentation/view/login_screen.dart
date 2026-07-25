import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';
import 'package:mobile_flutter/shared/extensions/padding_extensions.dart';
import 'package:mobile_flutter/shared/widgets/gradient_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDarkMode
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: 24.horizontalP,
          child: _LoginForm(), // Extracted to keep cleaner
        ),
      ),
    );
  }
}

class _LoginForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<_LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
      return;
    }

    final success = await ref
        .read(authViewModelProvider.notifier)
        .login(email, password);

    if (!mounted) return;

    if (success) {
      context.go(Routes.home);
    } else {
      final error = ref.read(authViewModelProvider).error;
      if (error != null) {
        final cleanError = error.toString().replaceAll('Exception: ', '');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(cleanError), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authAsync = ref.watch(authViewModelProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 40.h),
        // Branding / Header
        Center(
          child: Container(
            width: 80.w,
            height: 80.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF059669)],
              ),
            ),
            child: Icon(LucideIcons.zap, color: Colors.white, size: 40.sp),
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          context.l10n.loginWelcome,
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.isDarkMode
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.loginSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.isDarkMode
                ? AppColors.textSecondaryDark
                : AppColors.textSecondaryLight,
          ),
        ),
        SizedBox(height: 40.h),

        // Form
        AuthTextField(
          controller: _emailController,
          hintText: context.l10n.emailHint,
          prefixIcon: LucideIcons.mail,
          keyboardType: TextInputType.emailAddress,
        ),
        SizedBox(height: 16.h),
        AuthTextField(
          controller: _passwordController,
          hintText: context.l10n.passwordHint,
          prefixIcon: LucideIcons.lock,
          isPassword: true,
        ),

        SizedBox(height: 32.h),

        // Login Button
        authAsync.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF10B981)),
              )
            : GradientButton(
                text: context.l10n.loginButton,
                onPressed: _handleLogin,
              ),

        SizedBox(height: 32.h),

        // Social Login Divider
        Row(
          children: [
            Expanded(child: Divider(color: context.theme.dividerColor)),
            Padding(
              padding: 16.horizontalP,
              child: Text(
                context.l10n.orDivider,
                style: TextStyle(
                  color: context.isDarkMode
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
              ),
            ),
            Expanded(child: Divider(color: context.theme.dividerColor)),
          ],
        ),
        SizedBox(height: 24.h),

        // Social Buttons (Placeholder)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(context, LucideIcons.chrome), // Google
            SizedBox(width: 16.w),
            _buildSocialButton(context, LucideIcons.apple), // Apple
          ],
        ),

        SizedBox(height: 40.h),

        // Register Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.noAccount,
              style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
                fontSize: 14.sp,
              ),
            ),
            TextButton(
              onPressed: () {
                context.push(Routes.register);
              },
              child: Text(
                context.l10n.registerButton,
                style: TextStyle(
                  color: const Color(0xFF10B981),
                  fontWeight: FontWeight.bold,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialButton(BuildContext context, IconData icon) {
    return Container(
      width: 56.w,
      height: 56.w,
      decoration: BoxDecoration(
        color: context.isDarkMode ? AppColors.surfaceDark : AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: context.theme.dividerColor.withOpacity(0.1)),
      ),
      child: Center(
        child: Icon(
          icon,
          color: context.isDarkMode
              ? AppColors.iconDark
              : AppColors.iconLight,
          size: 24.sp,
        ),
      ),
    );
  }
}
