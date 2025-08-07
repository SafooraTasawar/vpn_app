import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/routes/routes_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
          'Profile',
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
            // Profile Header
            Row(
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundColor: AppColors.primaryColor.withOpacity(0.1),
                  child: Icon(
                    Icons.person,
                    size: 40.h,
                    color: AppColors.primaryColor,
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Wick',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.black,
                      ),
                    ),
                    Text(
                      'Free user',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40.h),
            // Menu Options List
            _ProfileOptionTile(
              icon: Icons.account_circle_outlined,
              title: 'Account',
              onTap: () {
                // Navigate to Account Screen
              },
            ),
            _ProfileOptionTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {
                Navigator.pushNamed(context, RoutesName.settingsScreen);
              },
            ),
            _ProfileOptionTile(
              icon: Icons.headphones,
              title: 'Support',
              onTap: () {
                Navigator.pushNamed(context, RoutesName.supportScreen);
              },
            ),
            _ProfileOptionTile(
              icon: Icons.info_outline,
              title: 'About us',
              onTap: () {
                Navigator.pushNamed(context, RoutesName.aboutScreen);
              },
            ),
            _ProfileOptionTile(
              icon: Icons.logout,
              title: 'Log Out',
              onTap: () {
                // Handle Log Out functionality
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 3, // Profile screen ka index 3 hai
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Servers'),
          BottomNavigationBarItem(icon: Icon(Icons.speed), label: 'Speed Test'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

// Reusable Profile Option Tile widget
class _ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileOptionTile({
    required this.icon,
    required this.title,
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
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16.h, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}