import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final l = context.l10n;
    if (_email.text.trim().isEmpty || _password.text.isEmpty) {
      setState(() => _error = l.authFillAll);
      return;
    }
    setState(() => _error = null);
    final ok = await ref.read(authViewModelProvider.notifier).login(_email.text.trim(), _password.text);
    if (!ok && mounted) {
      final err = ref.read(authViewModelProvider).error;
      setState(() => _error = err?.toString().replaceFirst('Exception: ', '') ?? l.commonError);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final loading = ref.watch(authViewModelProvider).isLoading;
    return Scaffold(
      backgroundColor: t.canvas,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                SizedBox(
                  height: 140,
                  child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    RsIcon(Symbols.recycling, size: 48, color: t.accent, filled: true),
                    const SizedBox(height: 12),
                    Text(l.brandName, style: AppType.displayLgMobile.copyWith(color: t.accent)),
                  ]),
                ),
                const SizedBox(height: 16),
                Text(l.loginTitle, textAlign: TextAlign.center, style: AppType.headingLg.copyWith(color: t.fg)),
                const SizedBox(height: 16),
                Text(l.loginSub, textAlign: TextAlign.center, style: AppType.bodyMd.copyWith(color: t.fg3)),
                const SizedBox(height: 32),
                RsCard(
                  radius: Rad.b8,
                  padding: const EdgeInsets.all(24),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                    RsTextField(label: l.loginEmailLabel, hint: l.loginEmailPh, controller: _email, icon: Symbols.mail, keyboardType: TextInputType.emailAddress, fill: t.field, contentPadding: const EdgeInsets.fromLTRB(40, 12, 16, 12)),
                    const SizedBox(height: 20),
                    RsPasswordField(
                      label: l.loginPasswordLabel,
                      hint: '••••••••',
                      controller: _password,
                      fill: t.field,
                      toggle: false,
                      labelTrailing: GestureDetector(onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.commonComingSoon))), child: Text(l.loginForgot, style: AppType.caption.copyWith(color: t.accent))),
                    ),
                    if (_error != null) Padding(padding: const EdgeInsets.only(top: 8), child: Text(_error!, style: AppType.caption.copyWith(color: t.danger))),
                    const SizedBox(height: 12),
                    RsButton(l.loginAction, iconRight: Symbols.arrow_forward, loading: loading, onPressed: _submit, padding: const EdgeInsets.symmetric(vertical: 16)),
                  ]),
                ),
                const SizedBox(height: 32),
                Center(
                  child: Text.rich(TextSpan(style: AppType.bodyMd.copyWith(color: t.fg3), children: [
                    TextSpan(text: '${l.loginNoAccount} '),
                    WidgetSpan(alignment: PlaceholderAlignment.baseline, baseline: TextBaseline.alphabetic, child: GestureDetector(onTap: () => context.go(Routes.register), child: Text(l.loginRegister, style: AppType.bodyMd.copyWith(color: t.accent, fontWeight: FontWeight.w600)))),
                  ])),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
