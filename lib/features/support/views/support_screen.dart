import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Support',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _SupportOptionTile(
              icon: Icons.restore_page_outlined,
              title: 'Restore Purchase',
              subtitle: 'Restore your purchase to unlock PRO features',
              onTap: () {},
            ),
            _SupportOptionTile(
              icon: Icons.vpn_lock_outlined,
              title: 'Profile Reinstallation',
              subtitle: 'Try to reinstall your VPN profile on your device',
              onTap: () {},
            ),
            _SupportOptionTile(
              icon: Icons.link_off_outlined,
              title: "Can't Connect",
              subtitle: "If you can't connect, you can read this article",
              onTap: () {},
            ),
            _SupportOptionTile(
              icon: Icons.chat_outlined,
              title: 'Live Chat',
              subtitle: 'Our chat support is available 24/7',
              onTap: () {},
            ),
            _SupportOptionTile(
              icon: Icons.mail_outline,
              title: 'Email Support',
              subtitle: 'Leave us a message, we will get back to you',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Support Option Tile widget
class _SupportOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _SupportOptionTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 16.h),
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0FF),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.primaryColor, size: 24.h),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.h, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}