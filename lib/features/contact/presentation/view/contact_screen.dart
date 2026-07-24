import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/contact/presentation/viewmodel/contact_view_model.dart';
import 'package:mobile_flutter/shared/widgets/glass_text_field.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});

  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      await ref
          .read(contactViewModelProvider.notifier)
          .submitForm(
            _nameController.text,
            _emailController.text,
            _messageController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Listen to provider state
    final contactState = ref.watch(contactViewModelProvider);

    // Show success snackbar if successful
    ref.listen(contactViewModelProvider, (previous, next) {
      if (next.isSuccess && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.l10n.messageSentSuccess),
            backgroundColor: AppColors.success,
          ),
        );
        ref.read(contactViewModelProvider.notifier).resetSuccess(); // Reset state
        Navigator.pop(context);
      }
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(context.l10n.contactTitle),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            color: context.isDarkMode
                ? AppColors.iconDark
                : AppColors.iconLight,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background
          Image.network(
            'https://images.unsplash.com/photo-1497366216548-37526070297c?auto=format&fit=crop&q=80',
            fit: BoxFit.cover,
          ),
          Container(
            color: context.theme.scaffoldBackgroundColor.withOpacity(0.9),
          ),

          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24.w, 100.h, 24.w, 24.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    context.l10n.contactUsHeader,
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: context.theme.colorScheme.onBackground,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    context.l10n.contactUsSub,
                    style: TextStyle(
                      color: context.theme.colorScheme.onBackground.withOpacity(
                        0.7,
                      ),
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 32.h),

                  GlassTextField(
                    controller: _nameController,
                    label: context.l10n.nameLabel,
                    icon: LucideIcons.user,
                  ),
                  SizedBox(height: 16.h),
                  GlassTextField(
                    controller: _emailController,
                    label: context.l10n.emailLabel,
                    icon: LucideIcons.mail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.h),
                  GlassTextField(
                    controller: _messageController,
                    label: context.l10n.messageLabel,
                    icon: LucideIcons.messageSquare,
                    maxLines: 4,
                  ),

                  SizedBox(height: 32.h),

                  GestureDetector(
                    onTap: contactState.isLoading ? null : _submitForm,
                    child: Container(
                      height: 56.h,
                      decoration: BoxDecoration(
                        gradient: AppColors.primaryGradient,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.3),
                            blurRadius: 12.r,
                            offset: Offset(0, 4.h),
                          ),
                        ],
                      ),
                      child: Center(
                        child: contactState.isLoading
                            ? SizedBox(
                                width: 24.w,
                                height: 24.w,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text(
                                context.l10n.sendButton,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.sp,
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
