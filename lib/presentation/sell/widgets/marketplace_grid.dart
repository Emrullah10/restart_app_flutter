import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/presentation/sell/riverpod/marketplace_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class MarketplaceGrid extends ConsumerWidget {
  const MarketplaceGrid({super.key});

  IconData _getIconForCategory(String? category) {
    switch (category?.toLowerCase()) {
      case 'camera':
      case 'kamera':
        return LucideIcons.camera;
      case 'tools':
      case 'alet':
        return LucideIcons.wrench;
      case 'cable':
      case 'kablo':
        return LucideIcons.plug;
      case 'audio':
      case 'ses':
        return LucideIcons.headphones;
      case 'phone':
      case 'telefon':
        return LucideIcons.smartphone;
      default:
        return LucideIcons.package;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsState = ref.watch(productsProvider);
    final products = productsState.products;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.marketplaceTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.l10n.filter,
                style: TextStyle(
                  color: const Color(0xFF3B82F6),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (productsState.isLoading)
            const Center(
              child: CircularProgressIndicator(color: Color(0xFF22C55E)),
            )
          else if (productsState.error != null)
            Text(
              'Hata: ${productsState.error}',
              style: TextStyle(color: Colors.red[400], fontSize: 12.sp),
            )
          else if (products.isEmpty)
            Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: const Color(0xFF1F2937),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Text(
                'Henüz ürün yok',
                style: TextStyle(color: Colors.grey[500], fontSize: 14.sp),
              ),
            )
          else
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 16.w,
              childAspectRatio: 0.75,
              children: products.take(4).map((product) {
                final category = product.category;
                final title = product.title;
                final description = product.description;
                final price = product.price;
                final rating = product.rating;
                final location = product.location;

                return _buildMarketItem(
                  icon: _getIconForCategory(category),
                  title: title,
                  subtitle: description,
                  price: '₺${price.toString()}',
                  rating: rating,
                  location: location,
                );
              }).toList(),
            ),
        ],
      ),
    );
  }

  Widget _buildMarketItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required String price,
    required double rating,
    required String location,
  }) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: const Color(0xFF3B82F6), size: 32.sp),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.star, color: const Color(0xFFF59E0B), size: 14.sp),
                  SizedBox(width: 2.w),
                  Text(
                    rating.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 4.h),
          Text(
            location,
            style: TextStyle(color: Colors.grey[500], fontSize: 11.sp),
          ),
        ],
      ),
    );
  }
}
