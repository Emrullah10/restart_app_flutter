import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/features/auth/presentation/viewmodel/auth_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});
  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _name = TextEditingController(), _email = TextEditingController(), _password = TextEditingController(), _confirm = TextEditingController();
  bool _terms = false;
  String? _error;

  @override
  void dispose() {
    for (final c in [_name, _email, _password, _confirm]) { c.dispose(); }
    super.dispose();
  }

  Future<void> _submit() async {
    final l = context.l10n;
    if (_name.text.trim().isEmpty || _email.text.trim().isEmpty || _password.text.isEmpty || _confirm.text.isEmpty) { setState(() => _error = l.authFillAll); return; }
    if (_password.text != _confirm.text) { setState(() => _error = l.authMismatch); return; }
    if (!_terms) { setState(() => _error = l.authTermsRequired); return; }
    setState(() => _error = null);
    final ok = await ref.read(authViewModelProvider.notifier).register(_email.text.trim(), _password.text, _name.text.trim());
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
      body: Stack(children: [
        Positioned(left: 0, right: 0, top: 0, height: MediaQuery.of(context).size.height / 3, child: DecoratedBox(decoration: BoxDecoration(color: t.subtle, border: Border(bottom: BorderSide(color: t.line))))),
        Positioned(left: -32, top: 48, child: Opacity(opacity: 0.5, child: Container(width: 64, height: 64, decoration: BoxDecoration(borderRadius: Rad.b12, border: Border.all(color: t.line))))),
        SafeArea(
          child: Column(children: [
            SizedBox(height: 64, child: Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: Row(children: [
              RsBarButton(Symbols.arrow_back, onTap: () => context.go(Routes.login)),
              Expanded(child: Center(child: Text(l.brandName, style: AppType.displayLgMobile.copyWith(color: t.accentStrong, letterSpacing: -0.3)))),
              const SizedBox(width: 40),
            ]))),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      Text(l.regTitle, textAlign: TextAlign.center, style: AppType.headingLg.copyWith(color: t.fg, letterSpacing: -0.3)),
                      const SizedBox(height: 8),
                      Text(l.regSub, textAlign: TextAlign.center, style: AppType.bodyMd.copyWith(color: t.fg2)),
                      const SizedBox(height: 32),
                      RsTextField(label: l.regName, hint: l.regNamePh, controller: _name, icon: Symbols.person, radius: Rad.b2, fill: t.field, contentPadding: const EdgeInsets.fromLTRB(40, 12, 12, 12)),
                      const SizedBox(height: 20),
                      RsTextField(label: l.regEmail, hint: l.loginEmailPh, controller: _email, icon: Symbols.mail, keyboardType: TextInputType.emailAddress, radius: Rad.b2, fill: t.field, contentPadding: const EdgeInsets.fromLTRB(40, 12, 12, 12)),
                      const SizedBox(height: 20),
                      RsPasswordField(label: l.regPassword, hint: l.regPasswordPh, controller: _password, radius: Rad.b2, fill: t.field, onChanged: (_) => setState(() {})),
                      RsPasswordStrength(value: _password.text),
                      const SizedBox(height: 20),
                      RsPasswordField(label: l.regConfirm, hint: l.regConfirmPh, controller: _confirm, icon: Symbols.lock_reset, radius: Rad.b2, fill: t.field, toggle: false),
                      const SizedBox(height: 20),
                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        SizedBox(width: 16, height: 20, child: Checkbox(value: _terms, onChanged: (v) => setState(() => _terms = v ?? false), materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, visualDensity: VisualDensity.compact)),
                        const SizedBox(width: 12),
                        Expanded(child: Text.rich(TextSpan(style: AppType.caption.copyWith(color: t.fg2), children: [
                          TextSpan(text: l.regTermsPre, style: TextStyle(color: t.accent), recognizer: TapGestureRecognizer()..onTap = () => context.push(Routes.legal('terms'))),
                          TextSpan(text: l.regTermsMid),
                          TextSpan(text: l.regPrivacy, style: TextStyle(color: t.accent), recognizer: TapGestureRecognizer()..onTap = () => context.push(Routes.legal('privacy'))),
                          TextSpan(text: l.regTermsPost),
                        ]))),
                      ]),
                      if (_error != null) Padding(padding: const EdgeInsets.only(top: 12), child: Text(_error!, style: AppType.caption.copyWith(color: t.danger))),
                      const SizedBox(height: 16),
                      RsButton(l.regAction, iconRight: Symbols.arrow_forward, loading: loading, onPressed: _submit, radius: Rad.b6, textStyle: AppType.headingMd, padding: const EdgeInsets.symmetric(vertical: 12)),
                      const SizedBox(height: 24),
                      Center(child: Text.rich(TextSpan(style: AppType.bodyMd.copyWith(color: t.fg2), children: [
                        TextSpan(text: '${l.regHave} '),
                        WidgetSpan(alignment: PlaceholderAlignment.baseline, baseline: TextBaseline.alphabetic, child: GestureDetector(onTap: () => context.go(Routes.login), child: Text(l.regLogin, style: AppType.bodyMd.copyWith(color: t.accent, fontWeight: FontWeight.w600)))),
                      ]))),
                    ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ]),
    );
  }
}
