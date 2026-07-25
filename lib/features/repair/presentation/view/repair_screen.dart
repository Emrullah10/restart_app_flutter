import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/repair/presentation/widgets/device_category_grid.dart';
import 'package:mobile_flutter/features/repair/presentation/widgets/repair_header.dart';
import 'package:mobile_flutter/features/repair/presentation/widgets/repair_shop_list.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class RepairScreen extends StatefulWidget {
  const RepairScreen({super.key});

  @override
  State<RepairScreen> createState() => _RepairScreenState();
}

class _RepairScreenState extends State<RepairScreen> {
  bool _isSearching = false;
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _isSearching
            ? TextField(
                controller: _searchController,
                autofocus: true,
                style: TextStyle(color: context.theme.colorScheme.onSurface),
                decoration: InputDecoration(
                  hintText: context.l10n.searchHint,
                  border: InputBorder.none,
                ),
                onChanged: (value) => setState(() => _query = value),
              )
            : Text(
                context.l10n.repairTitle,
                style: TextStyle(
                  color: context.theme.colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? LucideIcons.x : LucideIcons.search,
              color: context.theme.colorScheme.onSurface,
            ),
            onPressed: () {
              setState(() {
                if (_isSearching) {
                  _searchController.clear();
                  _query = '';
                }
                _isSearching = !_isSearching;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const RepairHeader(),
            const DeviceCategoryGrid(),
            RepairShopList(searchQuery: _query),
          ],
        ),
      ),
    );
  }
}
