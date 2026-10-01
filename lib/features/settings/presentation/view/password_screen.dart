import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/core/network/api_service.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});
  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final _current = TextEditingController(), _next = TextEditingController(), _confirm = TextEditingController();
  bool _busy = false, _done = false;
  String? _error;

  @override
  void dispose() {
    for (final c in [_current, _next, _confirm]) { c.dispose(); }
    super.dispose();
  }

  Future<void> _submit() async {
    final l = context.l10n;
    setState(() { _error = null; _done = false; });
    if (_current.text.isEmpty || _next.text.isEmpty || _confirm.text.isEmpty) return setState(() => _error = l.authFillAll);
    if (_next.text.length < 8) return setState(() => _error = l.pwTooShort);
    if (_next.text != _confirm.text) return setState(() => _error = l.authMismatch);
    setState(() => _busy = true);
    try {
      await ref.read(apiServiceProvider).changePassword(_current.text, _next.text);
      if (!mounted) return;
      _current.clear(); _next.clear(); _confirm.clear();
      setState(() => _done = true);
    } catch (e) {
      if (mounted) setState(() => _error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsBrandBar(title: l.setPassword, backLeading: true, iconColor: t.accent),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 448),
          child: ListView(padding: const EdgeInsets.all(24), children: [
            Text(l.pwHint, style: AppType.bodyMd.copyWith(color: t.fg2)),
            const SizedBox(height: 24),
            RsPasswordField(label: l.pwCurrent, controller: _current, radius: Rad.b4, fill: t.field),
            const SizedBox(height: 20),
            RsPasswordField(label: l.pwNew, controller: _next, icon: Symbols.key, radius: Rad.b4, fill: t.field, onChanged: (_) => setState(() {})),
            RsPasswordStrength(value: _next.text),
            const SizedBox(height: 20),
            RsPasswordField(label: l.regConfirm, controller: _confirm, icon: Symbols.lock_reset, radius: Rad.b4, fill: t.field, toggle: false),
            if (_error != null) Padding(padding: const EdgeInsets.only(top: 16), child: Text(_error!, style: AppType.caption.copyWith(color: t.danger))),
            if (_done) Padding(padding: const EdgeInsets.only(top: 16), child: Row(children: [RsIcon(Symbols.check_circle, size: 16, color: t.accent, filled: true), const SizedBox(width: 8), Text(l.pwChanged, style: AppType.caption.copyWith(color: t.accent))])),
            const SizedBox(height: 24),
            RsButton(l.pwSave, loading: _busy, onPressed: _submit, padding: const EdgeInsets.symmetric(vertical: 16)),
          ]),
        ),
      ),
    );
  }
}
