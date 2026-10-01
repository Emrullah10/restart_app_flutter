import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:mobile_flutter/app/router/app_routes.dart';
import 'package:mobile_flutter/core/theme/app_colors.dart';
import 'package:mobile_flutter/core/theme/app_spacing.dart';
import 'package:mobile_flutter/core/theme/app_typography.dart';
import 'package:mobile_flutter/core/utils/format.dart';
import 'package:mobile_flutter/features/sell/data/models/marketplace_product.dart';
import 'package:mobile_flutter/features/sell/presentation/viewmodel/marketplace_view_model.dart';
import 'package:mobile_flutter/shared/design_system/rs_bars.dart';
import 'package:mobile_flutter/shared/design_system/rs_core.dart';
import 'package:mobile_flutter/shared/design_system/rs_parts.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class SellScreen extends ConsumerStatefulWidget {
  const SellScreen({super.key});
  @override
  ConsumerState<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends ConsumerState<SellScreen> {
  String _cat = 'all';
  String _q = '';

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l = context.l10n;
    final fmt = Fmt(Localizations.localeOf(context).languageCode);
    final products = ref.watch(productsViewModelProvider);
    final listings = ref.watch(listingsViewModelProvider).valueOrNull ?? const [];
    final active = listings.where((e) => e.status == 'active').length;
    final pending = listings.where((e) => e.status == 'pending').length;
    final cats = [('all', l.catAll), ('phone', l.catPhone), ('laptop', l.catLaptop), ('tablet', l.catTablet), ('accessory', l.catAccessory)];
    final list = (products.valueOrNull ?? const <MarketplaceProduct>[]).where((p) => (_cat == 'all' || p.category == _cat) && (_q.isEmpty || '${p.title} ${p.subtitle}'.toLowerCase().contains(_q.toLowerCase()))).toList();

    return Scaffold(
      backgroundColor: t.canvas,
      appBar: RsAppBar(
        bg: t.canvas,
        bordered: false,
        startTitle: l.marketTitle,
        titleColor: t.accent,
        trailing: Row(mainAxisSize: MainAxisSize.min, children: [RsBarButton(Symbols.search), RsBarButton(Symbols.filter_list)]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: RsPressable(
          onTap: () => context.go(Routes.createListing),
          child: Container(width: 56, height: 56, decoration: BoxDecoration(color: t.accent, borderRadius: Rad.b12, boxShadow: Shadows.md), alignment: Alignment.center, child: RsIcon(Symbols.add, color: t.onAccent, filled: true)),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
        children: [
          RsCard(
            tone: RsTone.subtle,
            stripe: RsStripe.sell,
            padding: const EdgeInsets.all(20),
            child: SizedBox(width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [RsIcon(Symbols.verified_user, color: AppColors.sell, filled: true), const SizedBox(width: 12), Expanded(child: Text(l.marketSafeTitle, style: AppType.headingMd.copyWith(color: t.fg)))]),
              const SizedBox(height: 12),
              Text(l.marketSafeBody, style: AppType.bodyMd.copyWith(color: t.fg2)),
              const SizedBox(height: 8),
              Text(l.marketMore, style: AppType.label.copyWith(color: t.accent)),
            ])),
          ),
          const SizedBox(height: 24),
          RsTextField(hint: l.marketSearch, icon: Symbols.search, radius: Rad.b2, fill: t.fieldCanvas, onChanged: (v) => setState(() => _q = v), contentPadding: const EdgeInsets.fromLTRB(40, 12, 16, 12)),
          const SizedBox(height: 16),
          SizedBox(height: 40, child: ListView.separated(scrollDirection: Axis.horizontal, itemCount: cats.length, separatorBuilder: (_, __) => const SizedBox(width: 8), itemBuilder: (_, i) => RsChip(cats[i].$2, active: _cat == cats[i].$1, onTap: () => setState(() => _cat = cats[i].$1)))),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(child: _Mini(label: l.marketActive, value: fmt.number(active), unit: l.commonPieces)),
            const SizedBox(width: 16),
            Expanded(child: _Mini(label: l.marketPending, value: fmt.number(pending), unit: l.marketOps, valueColor: AppColors.sell)),
          ]),
          const SizedBox(height: 24),
          Text(l.marketForYou, style: AppType.headingMd.copyWith(color: t.fg)),
          const SizedBox(height: 16),
          if (products.isLoading) const Center(child: Padding(padding: EdgeInsets.all(24), child: CircularProgressIndicator())),
          if (!products.isLoading && list.isEmpty) Text(l.marketEmpty, style: AppType.caption.copyWith(color: t.fg2)),
          for (final p in list) Padding(padding: const EdgeInsets.only(bottom: 16), child: _ProductRow(p, fmt)),
        ],
      ),
    );
  }
}

class _Mini extends StatelessWidget {
  final String label, value, unit;
  final Color? valueColor;
  const _Mini({required this.label, required this.value, required this.unit, this.valueColor});
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsCard(
      tone: RsTone.raised,
      padding: const EdgeInsets.all(16),
      child: SizedBox(width: double.infinity, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label, style: AppType.label.copyWith(color: t.fg2)),
        const SizedBox(height: 8),
        Row(crossAxisAlignment: CrossAxisAlignment.baseline, textBaseline: TextBaseline.alphabetic, children: [
          Text(value, style: AppType.dataLg.copyWith(color: valueColor ?? t.fg)),
          const SizedBox(width: 8),
          Text(unit, style: AppType.caption.copyWith(color: t.fgOutline)),
        ]),
      ])),
    );
  }
}

class _ProductRow extends StatelessWidget {
  final MarketplaceProduct p;
  final Fmt fmt;
  const _ProductRow(this.p, this.fmt);
  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return RsCard(
      tone: RsTone.raised,
      child: SizedBox(
        height: 120,
        child: Row(children: [
          Container(
            width: 120,
            color: t.field,
            child: p.imageUrl == null ? Center(child: RsIcon(Symbols.image, color: t.fg3, size: 32)) : Image.network(p.imageUrl!, fit: BoxFit.cover, height: double.infinity, errorBuilder: (_, __, ___) => Center(child: RsIcon(Symbols.image, color: t.fg3, size: 32))),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Expanded(child: Text(p.title, style: AppType.headingMd.copyWith(color: t.fg), maxLines: 1, overflow: TextOverflow.ellipsis)),
                    const SizedBox(width: 8),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), decoration: BoxDecoration(color: AppColors.sell.withValues(alpha: 0.1), borderRadius: Rad.b2), child: Text(fmt.currency(p.price), style: AppType.label.copyWith(color: AppColors.sell))),
                  ]),
                  const SizedBox(height: 4),
                  Text(p.subtitle, style: AppType.caption.copyWith(color: t.fg2), maxLines: 1, overflow: TextOverflow.ellipsis),
                ]),
                if (p.location.isNotEmpty) Row(children: [RsIcon(Symbols.location_on, size: 16, color: t.fgOutline), const SizedBox(width: 4), Expanded(child: Text(p.location, style: AppType.caption.copyWith(color: t.fgOutline), maxLines: 1, overflow: TextOverflow.ellipsis))]),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
