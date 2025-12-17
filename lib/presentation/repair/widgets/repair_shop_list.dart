import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/utils/constants/app_colors.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class RepairShopList extends StatelessWidget {
  const RepairShopList({super.key});

  @override
  Widget build(BuildContext context) {
    final shops = [
      {
        'name': 'TeknoFix Kadıköy',
        'rating': 4.8,
        'reviews': 124,
        'distance': '1.2 km',
        'price': '₺₺',
        'tag': context.l10n.shopTechnologyCenter,
        'image': 'https://picsum.photos/id/1/800/600',
      },
      {
        'name': 'Mobil Servis Point',
        'rating': 4.6,
        'reviews': 89,
        'distance': '2.5 km',
        'price': '₺',
        'tag': context.l10n.shopFastRepair,
        'image': 'https://picsum.photos/id/4/800/600',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.nearestShopsTitle,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: context.theme.colorScheme.onSurface,
                ),
              ),
              Text(
                context.l10n.locationLabel,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: shops.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final shop = shops[index];
              return Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: context.theme.cardColor,
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: context.theme.dividerColor.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.network(
                        shop['image'] as String,
                        width: 80.w,
                        height: 80.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 4.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Text(
                                  shop['tag'] as String,
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    LucideIcons.star,
                                    size: 14.sp,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '${shop['rating']}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          context.theme.colorScheme.onSurface,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            shop['name'] as String,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: context.theme.colorScheme.onSurface,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            children: [
                              Icon(
                                LucideIcons.mapPin,
                                size: 14.sp,
                                color: context.theme.hintColor,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                shop['distance'] as String,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: context.theme.hintColor,
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Text(
                                context.l10n.detailButton,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
