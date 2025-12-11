import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LeaderboardCard extends StatelessWidget {
  const LeaderboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: const Color(0xFF1F2937),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Topluluk Sıralaması',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Bu hafta #42',
                style: TextStyle(
                  color: const Color(0xFF22C55E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          _buildRankItem(1, 'Mehmet K.', '3,890 puan', false),
          Divider(color: Colors.white.withOpacity(0.1), height: 24.h),
          _buildRankItem(2, 'Fatma S.', '3,245 puan', false),
          Divider(color: Colors.white.withOpacity(0.1), height: 24.h),
          _buildRankItem(42, 'Sen', '2,340 puan', true),
        ],
      ),
    );
  }

  Widget _buildRankItem(int rank, String name, String points, bool isMe) {
    return Row(
      children: [
        Container(
          width: 24.w,
          height: 24.w,
          decoration: BoxDecoration(
            color: isMe
                ? const Color(0xFF22C55E)
                : (rank == 1 ? const Color(0xFFF59E0B) : Colors.grey[700]),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              rank.toString(),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Text(
          name,
          style: TextStyle(
            color: isMe ? const Color(0xFF22C55E) : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14.sp,
          ),
        ),
        const Spacer(),
        Text(
          points,
          style: TextStyle(
            color: isMe ? const Color(0xFF22C55E) : Colors.grey[400],
            fontSize: 14.sp,
          ),
        ),
      ],
    );
  }
}
