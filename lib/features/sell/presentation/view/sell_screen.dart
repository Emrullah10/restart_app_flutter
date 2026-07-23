import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/active_listings_list.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/category_filter_list.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/create_listing_card.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/marketplace_grid.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/safe_selling_banner.dart';
import 'package:mobile_flutter/features/sell/presentation/widgets/sell_header.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

class SellScreen extends StatelessWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SellHeader(),
              SizedBox(height: 8.h),
              const CategoryFilterList(),
              SizedBox(height: 24.h),
              const CreateListingCard(),
              const SafeSellingBanner(),
              const ActiveListingsList(),
              SizedBox(height: 32.h),
              const MarketplaceGrid(),
              SizedBox(height: 120.h),
            ],
          ),
        ),
      ),
    );
  }
}
