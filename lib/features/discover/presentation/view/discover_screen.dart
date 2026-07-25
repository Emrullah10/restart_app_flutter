import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/marketplace_grid.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: Icon(LucideIcons.arrowLeft, color: context.theme.iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          context.l10n.discoverTitle,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: MarketplaceGrid(),
        ),
      ),
    );
  }
}
