import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/features/premium/views/premium_screen.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              _NotificationsItem(
                icon: Icons.workspace_premium,
                text: 'Upgrade to Premium',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PremiumScreen()),
                  );
                },
              ),
              _NotificationsItem(
                icon: Icons.notifications_none,
                text: 'New Offers Available',
                onTap: () {},
              ),
              _NotificationsItem(
                icon: Icons.warning_amber,
                text: 'Subscription Expiring Soon',
                onTap: () {},
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationsItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _NotificationsItem({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h),
        padding: EdgeInsets.all(15.h),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.black, size: 24.h),
            SizedBox(width: 15.w),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
            ),
            const Icon(Icons.chevron_right, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}

