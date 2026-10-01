import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/platform/adaptive.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/features/sell/presentation/viewmodel/create_listing_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class CreateListingScreen extends ConsumerStatefulWidget {
  const CreateListingScreen({super.key});
  @override
  ConsumerState<CreateListingScreen> createState() => _CreateListingScreenState();
}

class _CreateListingScreenState extends ConsumerState<CreateListingScreen> {
  final _title = TextEditingController(), _desc = TextEditingController(), _price = TextEditingController(), _location = TextEditingController();
  final _photos = <String>[];
  String? _category;

  @override
  void dispose() {
    for (final c in [_title, _desc, _price, _location]) { c.dispose(); }
    super.dispose();
  }

  Future<void> _pick() async {
    final l = context.l10n;
    final choice = await Adaptive.showActionSheet(context: context, title: l.listingPhotoTitle, actions: [l.listingCamera, l.listingGallery], cancelLabel: l.commonRetry);
    if (choice == null) return;
    final picker = ImagePicker();
    if (choice == 0) {
      final x = await picker.pickImage(source: ImageSource.camera, imageQuality: 85);
      if (x != null) setState(() => _photos.add(x.path));
    } else {
      final xs = await picker.pickMultiImage(imageQuality: 85);
      setState(() => _photos.addAll(xs.map((e) => e.path)));
    }
    if (_photos.length > 5) setState(() => _photos.removeRange(5, _photos.length));
  }

  Future<void> _publish() async {
    final l = context.l10n;
    final price = double.tryParse(_price.text.replaceAll(',', '.'));
    if (_title.text.trim().isEmpty || price == null || _category == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l.authFillAll)));
      return;
    }
    final ok = await ref.read(createListingViewModelProvider.notifier).publish(title: _title.text.trim(), description: _desc.text.trim(), category: _category!, price: price, location: _location.text.trim(), imageFilePaths: _photos);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ok ? l.listingSuccess : l.listingFailed)));
    if (ok) context.go(Routes.sell);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final busy = ref.watch(createListingViewModelProvider).isLoading;
    final cats = [('phone', l.catPhone), ('laptop', l.catLaptop), ('tablet', l.catTablet), ('accessory', l.catAccessory)];
    final ph = AppType.bodyMd.copyWith(color: t.fg3);

    Widget field(String label, Widget child) => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: AppType.label.copyWith(color: t.fg2)), const SizedBox(height: 4), child]);
    Widget slot({bool cover = false, int? index}) {
      final path = index != null && index < _photos.length ? _photos[index] : null;
      return GestureDetector(
        onTap: path == null ? _pick : () => setState(() => _photos.removeAt(index!)),
        child: SizedBox(
          width: 96,
          height: 96,
          child: RsCard(
            dashed: path == null,
            border: path != null,
            tone: cover ? RsTone.accentSubtle : RsTone.subtle,
            radius: Rad.b4,
            borderColor: cover ? AppColors.brand400 : t.lineStrong,
            child: path != null
                ? Stack(fit: StackFit.expand, children: [Image.file(File(path), fit: BoxFit.cover), Positioned(top: 4, right: 4, child: Container(width: 20, height: 20, decoration: BoxDecoration(color: t.raised.withValues(alpha: 0.9), borderRadius: Rad.b2), child: RsIcon(Symbols.close, size: 14, color: t.fg)))])
                : Center(child: cover ? Column(mainAxisSize: MainAxisSize.min, children: [RsIcon(Symbols.add_photo_alternate, color: t.accent), Text(l.listingCover, style: AppType.sized(AppType.label, 10).copyWith(color: t.accent))]) : RsIcon(Symbols.add, color: t.fg3)),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsAppBar(leading: rsBack(context), centerTitle: Text(l.listingTitle, style: AppType.headingMd.copyWith(color: t.fg))),
      body: Column(children: [
        Expanded(
          child: ListView(padding: const EdgeInsets.fromLTRB(24, 16, 24, 24), children: [
            Text(l.listingPhotos(_photos.length.toString()), style: AppType.label.copyWith(color: t.fg2)),
            const SizedBox(height: 8),
            SizedBox(height: 96, child: ListView.separated(scrollDirection: Axis.horizontal, itemCount: 5, separatorBuilder: (_, __) => const SizedBox(width: 12), itemBuilder: (_, i) => slot(cover: i == 0 && _photos.isEmpty, index: i))),
            const SizedBox(height: 8),
            Text(l.listingPhotoHint, style: AppType.caption.copyWith(color: t.fg3)),
            const SizedBox(height: 24),
            field(l.listingTitleLabel, RsTextField(hint: l.listingTitlePh, controller: _title, radius: Rad.b2, fill: t.fieldCanvas, borderColor: t.lineStrong, contentPadding: const EdgeInsets.all(12))),
            const SizedBox(height: 16),
            field(l.listingCategory, DropdownButtonFormField<String>(
              initialValue: _category,
              isExpanded: true,
              icon: RsIcon(Symbols.expand_more, color: t.fg3),
              dropdownColor: t.raised,
              style: AppType.bodyMd.copyWith(color: t.fg),
              hint: Text(l.listingCategoryPh, style: ph),
              decoration: InputDecoration(isDense: true, filled: true, fillColor: t.fieldCanvas, contentPadding: const EdgeInsets.all(12), enabledBorder: OutlineInputBorder(borderRadius: Rad.b2, borderSide: BorderSide(color: t.lineStrong)), focusedBorder: OutlineInputBorder(borderRadius: Rad.b2, borderSide: BorderSide(color: t.accent, width: 2))),
              items: [for (final c in cats) DropdownMenuItem(value: c.$1, child: Text(c.$2))],
              onChanged: (v) => setState(() => _category = v),
            )),
            const SizedBox(height: 16),
            field(l.listingDescription, RsTextField(hint: l.listingDescriptionPh, controller: _desc, maxLines: 4, radius: Rad.b2, fill: t.fieldCanvas, borderColor: t.lineStrong, contentPadding: const EdgeInsets.all(12))),
            const SizedBox(height: 16),
            field(l.listingPrice, RsTextField(hint: '0,00', controller: _price, keyboardType: const TextInputType.numberWithOptions(decimal: true), radius: Rad.b2, fill: t.fieldCanvas, borderColor: t.lineStrong, contentPadding: const EdgeInsets.all(12))),
            const SizedBox(height: 16),
            field(l.listingLocation, RsTextField(hint: l.listingLocationPh, controller: _location, icon: Symbols.location_on, radius: Rad.b2, fill: t.fieldCanvas, borderColor: t.lineStrong, contentPadding: const EdgeInsets.fromLTRB(40, 12, 12, 12))),
            const SizedBox(height: 24),
            RsCard(
              tone: RsTone.subtle,
              stripe: RsStripe.sell,
              padding: const EdgeInsets.all(16),
              child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                RsIcon(Symbols.security, color: AppColors.sell),
                const SizedBox(width: 12),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(l.listingTipsTitle, style: AppType.sized(AppType.headingMd, 16).copyWith(color: t.fg)),
                  const SizedBox(height: 4),
                  Text(l.listingTipsBody, style: AppType.caption.copyWith(color: t.fg2)),
                ])),
              ]),
            ),
          ]),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(color: t.canvas, border: Border(top: BorderSide(color: t.line))),
          child: SafeArea(top: false, child: RsButton(l.listingPublish, icon: Symbols.publish, loading: busy, onPressed: _publish, textStyle: AppType.sized(AppType.headingMd, 16), padding: const EdgeInsets.symmetric(vertical: 12))),
        ),
      ]),
    );
  }
}
