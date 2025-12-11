import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/repair/widgets/device_category_grid.dart';
import 'package:mobile_flutter/presentation/repair/widgets/repair_header.dart';
import 'package:mobile_flutter/presentation/repair/widgets/repair_shop_list.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class RepairScreen extends StatelessWidget {
  const RepairScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          context.l10n.repairTitle,
          style: TextStyle(
            color: context.theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              LucideIcons.search,
              color: context.theme.colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RepairHeader(),
            const DeviceCategoryGrid(),
            const RepairShopList(),
          ],
        ),
      ),
    );
  }
}
