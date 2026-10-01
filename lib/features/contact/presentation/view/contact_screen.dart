import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/features/contact/presentation/viewmodel/contact_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

const _supportEmail = 'destek@restart.co';
const _supportPhone = '0850 000 00 00';

class ContactScreen extends ConsumerStatefulWidget {
  const ContactScreen({super.key});
  @override
  ConsumerState<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends ConsumerState<ContactScreen> {
  final _name = TextEditingController(), _email = TextEditingController(), _message = TextEditingController();

  @override
  void dispose() {
    for (final c in [_name, _email, _message]) { c.dispose(); }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final state = ref.watch(contactViewModelProvider);
    ref.listen(contactViewModelProvider, (prev, next) {
      if (next.isSuccess && !(prev?.isSuccess ?? false)) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.contactSent)));
        _name.clear(); _email.clear(); _message.clear();
        ref.read(contactViewModelProvider.notifier).resetSuccess();
      }
    });

    Widget channel(IconData icon, String label, String value, Uri uri) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: RsPressable(
            scale: 0.99,
            onTap: () => launchUrl(uri),
            child: RsCard(
              tone: RsTone.subtle,
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Container(width: 40, height: 40, decoration: BoxDecoration(color: t.accentSubtle, borderRadius: Rad.b12), alignment: Alignment.center, child: RsIcon(icon, color: t.accent)),
                const SizedBox(width: 16),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(label, style: AppType.label.copyWith(color: t.fg2)),
                  Text(value, style: AppType.headingMd.copyWith(color: t.fg)),
                ]),
              ]),
            ),
          ),
        );

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsBrandBar(title: l.contactTitle, iconColor: t.accent),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 512),
          child: ListView(padding: const EdgeInsets.fromLTRB(24, 24, 24, 24), children: [
            Text(l.contactHeadline, style: AppType.headingLg.copyWith(color: t.fg)),
            const SizedBox(height: 8),
            Text(l.contactBody, style: AppType.bodyMd.copyWith(color: t.fg2)),
            const SizedBox(height: 32),
            RsCard(
              tone: RsTone.raised,
              padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Container(padding: const EdgeInsets.only(left: 12), margin: const EdgeInsets.only(bottom: 8), decoration: BoxDecoration(border: Border(left: BorderSide(color: t.accent, width: 3))), child: Text(l.contactSend, style: AppType.headingMd.copyWith(color: t.accentStrong))),
                const SizedBox(height: 8),
                RsTextField(label: l.contactName, upperLabel: true, hint: l.contactNamePh, controller: _name, fill: t.field),
                const SizedBox(height: 16),
                RsTextField(label: l.contactEmail, upperLabel: true, hint: l.contactEmailPh, controller: _email, keyboardType: TextInputType.emailAddress, fill: t.field),
                const SizedBox(height: 16),
                RsTextField(label: l.contactMessage, upperLabel: true, labelTrailing: Text(l.contactMax.toUpperCase(), style: AppType.label.copyWith(color: t.fg3, fontWeight: FontWeight.w400)), hint: l.contactMessagePh, controller: _message, maxLines: 5, maxLength: 1000, fill: t.field),
                const SizedBox(height: 16),
                RsButton(l.contactSubmit, iconRight: Symbols.send, iconRightFilled: true, loading: state.isLoading, onPressed: () {
                  if (_name.text.trim().isEmpty || _email.text.trim().isEmpty || _message.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.authFillAll)));
                    return;
                  }
                  ref.read(contactViewModelProvider.notifier).submitForm(_name.text.trim(), _email.text.trim(), _message.text.trim());
                }),
              ]),
            ),
            const SizedBox(height: 32),
            Container(padding: const EdgeInsets.only(bottom: 8), margin: const EdgeInsets.only(bottom: 16), decoration: BoxDecoration(border: Border(bottom: BorderSide(color: t.line))), child: RsSectionLabel(l.contactChannels, letterSpacing: 1.2)),
            channel(Symbols.mail, l.contactEmailChannel, _supportEmail, Uri(scheme: 'mailto', path: _supportEmail)),
            channel(Symbols.call, l.contactPhoneChannel, _supportPhone, Uri(scheme: 'tel', path: '08500000000')),
          ]),
        ),
      ),
    );
  }
}
