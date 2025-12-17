import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/auth/riverpod/auth_provider.dart';
import 'package:mobile_flutter/presentation/auth/widgets/auth_text_field.dart';
import 'package:mobile_flutter/presentation/auth/widgets/gradient_button.dart';
import 'package:mobile_flutter/routes/routes.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';
import 'package:mobile_flutter/utils/extensions/padding_extensions.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    // Basic Consumer to listen to state if needed directly, or just use ConsumerWidget.
    // Converting to ConsumerWidget or using local Consumer for the button.
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('E-posta ve şifre gereklidir')));
      return;
    }

    final success = await ref
        .read(authProvider.notifier)
        .login(email, password);

    if (success) {
      if (mounted) context.go(Routes.home);
    } else {
      final error = ref.read(authProvider).error;
      if (mounted && error != null) {
        // Clean up error message (remove "Exception: ")
        final cleanError = error.replaceAll('Exception: ', '');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(cleanError), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

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
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.loginSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[400],
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
        authState.isLoading
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
            Expanded(child: Divider(color: Colors.grey[800])),
            Padding(
              padding: 16.horizontalP,
              child: Text(
                context.l10n.orDivider,
                style: TextStyle(color: Colors.grey[500]),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[800])),
          ],
        ),
        SizedBox(height: 24.h),

        // Social Buttons (Placeholder)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialButton(LucideIcons.chrome), // Google
            SizedBox(width: 16.w),
            _buildSocialButton(LucideIcons.apple), // Apple
          ],
        ),

        SizedBox(height: 40.h),

        // Register Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.noAccount,
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
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

  Widget _buildSocialButton(IconData icon) {
    return Container(
      width: 56.w,
      height: 56.w,
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Center(
        child: Icon(icon, color: Colors.white, size: 24.sp),
      ),
    );
  }
}
