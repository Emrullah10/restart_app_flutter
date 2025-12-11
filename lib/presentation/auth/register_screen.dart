import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Text(
                context.l10n.registerTitle,
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
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
                hintText: context.l10n.nameHint,
                prefixIcon: LucideIcons.user,
              ),
              SizedBox(height: 16.h),
              AuthTextField(
                hintText: context.l10n.emailHint,
                prefixIcon: LucideIcons.mail,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              AuthTextField(
                hintText: context.l10n.passwordHint,
                prefixIcon: LucideIcons.lock,
                isPassword: true,
              ),
              SizedBox(height: 16.h),
              AuthTextField(
                hintText: context.l10n.passwordConfirmHint,
                prefixIcon: LucideIcons.lock,
                isPassword: true,
              ),

              SizedBox(height: 32.h),

              // Register Button
              GradientButton(
                text: context.l10n.registerButton,
                onPressed: () {
                  // Mock register success -> Go Home or Login
                  context.go(Routes.home);
                },
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
          ),
        ),
      ),
    );
  }
}
