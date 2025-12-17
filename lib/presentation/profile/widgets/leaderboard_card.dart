import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/presentation/profile/riverpod/gamification_provider.dart';
import 'package:mobile_flutter/utils/extensions/context_extensions.dart';

class LeaderboardCard extends ConsumerWidget {
  const LeaderboardCard({super.key});

  String _formatPoints(dynamic points) {
    final intPoints = (points is int)
        ? points
        : int.tryParse(points?.toString() ?? '0') ?? 0;
    final formatter = NumberFormat('#,###');
    return formatter.format(intPoints);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final leaderboardState = ref.watch(leaderboardProvider);
    final topUsers = leaderboardState.topUsers;
    final currentUser = leaderboardState.currentUser;
    final userRank = currentUser?['rank'] ?? 1;

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
                context.l10n.leaderboardTitle,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                context.l10n.leaderboardThisWeek(userRank),
                style: TextStyle(
                  color: const Color(0xFF22C55E),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (leaderboardState.isLoading)
            const CircularProgressIndicator(color: Color(0xFF22C55E))
          else ...[
            ...topUsers.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;
              final rank = user['rank'] ?? (index + 1);
              final name = user['fullName'] ?? 'User';
              final points = user['totalPoints'] ?? 0;

              return Column(
                children: [
                  if (index > 0)
                    Divider(color: Colors.white.withOpacity(0.1), height: 24.h),
                  _buildRankItem(
                    rank,
                    name,
                    context.l10n.leaderboardPoints(_formatPoints(points)),
                    false,
                  ),
                ],
              );
            }),
            if (currentUser != null) ...[
              Divider(color: Colors.white.withOpacity(0.1), height: 24.h),
              _buildRankItem(
                userRank,
                context.l10n.leaderboardYou,
                context.l10n.leaderboardPoints(
                  _formatPoints(currentUser['totalPoints'] ?? 0),
                ),
                true,
              ),
            ],
          ],
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
