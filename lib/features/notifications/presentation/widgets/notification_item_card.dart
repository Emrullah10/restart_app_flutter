import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationItemCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String description;
  final String time;
  final String? actionText;
  final Color? actionColor;
  final Color? actionBgColor;

  const NotificationItemCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.description,
    required this.time,
    this.actionText,
    this.actionColor,
    this.actionBgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h, left: 24.w, right: 24.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      color: iconBgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(icon, color: iconColor, size: 20.sp),
                  ),
                  SizedBox(width: 16.w),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                time,
                style: TextStyle(color: Colors.grey[500], fontSize: 11.sp),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Padding(
            // Indent description to align with text above if desired, design shows full width below
            padding: EdgeInsets.only(
              left: 46.w,
            ), // Align roughly with title text
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 13.sp,
                    height: 1.4,
                  ),
                ),
                if (actionText != null) ...[
                  SizedBox(height: 12.h),
                  if (actionBgColor != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: actionBgColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        actionText!,
                        style: TextStyle(
                          color: actionColor ?? Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  else
                    Text(
                      actionText!,
                      style: TextStyle(
                        color: actionColor ?? Colors.blue,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
