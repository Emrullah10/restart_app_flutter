import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:mobile_flutter/features/notifications/presentation/view/notifications_screen.dart';
import 'package:mobile_flutter/features/profile/presentation/view/profile_screen.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';
import 'package:mobile_flutter/shared/extensions/padding_extensions.dart';

class HomeHeader extends StatelessWidget {
  final String fullName;
  final String? avatarUrl;

  const HomeHeader({super.key, required this.fullName, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: [24, 16].horizantalAndVerticalP,
      child: Row(
        children: [
          // Logo Icon
          Container(
            padding: 8.allP,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(LucideIcons.recycle, color: Colors.white, size: 24.sp),
          ),
          SizedBox(width: 12.w),

          // Title & Subtitle
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ReStart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  fullName.isNotEmpty
                      ? 'Merhaba, $fullName'
                      : context.l10n.appTagline,
                  style: TextStyle(color: Colors.grey[400], fontSize: 12.sp),
                ),
              ],
            ),
          ),

          // Notification Icon
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ),
                  );
                },
                icon: Icon(
                  LucideIcons.bell,
                  color: Colors.grey[300],
                  size: 24.sp,
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFFEF4444), // Red badge
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),

          // Profile Image
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Container(
              width: 40.w,
              height: 40.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 2.w,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    avatarUrl ??
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&q=80',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
