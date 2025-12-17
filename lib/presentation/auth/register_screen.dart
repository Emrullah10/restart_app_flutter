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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: 24.horizontalP,
          child: _RegisterForm(),
        ),
      ),
    );
  }
}

class _RegisterForm extends ConsumerStatefulWidget {
  @override
  ConsumerState<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<_RegisterForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleRegister() async {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final confirmPassword = _confirmPasswordController.text.trim();

    if (name.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen tüm alanları doldurun')),
      );
      return;
    }

    if (password != confirmPassword) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Şifreler eşleşmiyor')));
      return;
    }

    final success = await ref
        .read(authProvider.notifier)
        .register(email, password, name);

    if (success) {
      if (mounted) context.go(Routes.home);
    } else {
      final error = ref.read(authProvider).error;
      if (mounted && error != null) {
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
        SizedBox(height: 10.h),
        Text(
          context.l10n.registerTitle,
          style: context.textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          context.l10n.registerSubtitle,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.grey[400],
          ),
        ),
        SizedBox(height: 32.h),

        // Form
        AuthTextField(
          controller: _nameController,
          hintText: context.l10n.nameHint,
          prefixIcon: LucideIcons.user,
        ),
        SizedBox(height: 16.h),
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
        SizedBox(height: 16.h),
        AuthTextField(
          controller: _confirmPasswordController,
          hintText: context.l10n.passwordConfirmHint,
          prefixIcon: LucideIcons.lock,
          isPassword: true,
        ),

        SizedBox(height: 32.h),

        // Register Button
        authState.isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Color(0xFF10B981)),
              )
            : GradientButton(
                text: context.l10n.registerButton,
                onPressed: _handleRegister,
              ),

        SizedBox(height: 24.h),

        // Login Link
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.haveAccount,
              style: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
            ),
            TextButton(
              onPressed: () => context.pop(), // Go back to login
              child: Text(
                context.l10n.loginButton,
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
}
