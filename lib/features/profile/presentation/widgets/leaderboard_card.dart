import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mobile_flutter/features/profile/presentation/viewmodel/gamification_view_model.dart';
import 'package:mobile_flutter/shared/extensions/context_extensions.dart';

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
    final leaderboardAsync = ref.watch(leaderboardViewModelProvider);
    final leaderboard = leaderboardAsync.valueOrNull;
    final topUsers = leaderboard?.topUsers ?? const [];
    final currentUser = leaderboard?.currentUser;
    final userRank = currentUser?.rank ?? 1;

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
          if (leaderboardAsync.isLoading)
            const CircularProgressIndicator(color: Color(0xFF22C55E))
          else ...[
            ...topUsers.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;

              return Column(
                children: [
                  if (index > 0)
                    Divider(color: Colors.white.withOpacity(0.1), height: 24.h),
                  _buildRankItem(
                    user.rank,
                    user.fullName,
                    context.l10n.leaderboardPoints(
                      _formatPoints(user.totalPoints),
                    ),
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
                  _formatPoints(currentUser.totalPoints),
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
