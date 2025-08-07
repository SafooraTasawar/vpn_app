import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/utils/constants/image_assets.dart';

class ServerListScreen extends StatelessWidget {
  const ServerListScreen({super.key});

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
            // Yahan se back button dabane par home screen par wapis jayenge
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Server List',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search servers',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: const Color(0xFFF0F0FF),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Free Servers',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _ServerTile(
                    flagAsset: ImageAssets.unitedStatesFlag,
                    country: 'United States',
                    location: 'New York',
                    ping: '44ms',
                    isFree: true,
                  ),
                  _ServerTile(
                    flagAsset: ImageAssets.unitedStatesFlag,
                    country: 'United States',
                    location: 'San Francisco',
                    ping: '56ms',
                    isFree: true,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Best Servers',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  _ServerTile(
                    flagAsset: ImageAssets.canadaFlag,
                    country: 'Canada',
                    location: 'Toronto',
                    ping: '48ms',
                    isFree: false,
                  ),
                  _ServerTile(
                    flagAsset: ImageAssets.australiaFlag,
                    country: 'Australia',
                    location: 'Sydney',
                    ping: '115ms',
                    isFree: false,
                  ),
                  _ServerTile(
                    flagAsset: ImageAssets.japanFlag,
                    country: 'Japan',
                    location: 'Tokyo',
                    ping: '140ms',
                    isFree: false,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
      // Yahan par BottomNavigationBar nahi hai, taaki duplicate na ho
    );
  }
}

class _ServerTile extends StatelessWidget {
  final String flagAsset;
  final String country;
  final String location;
  final String ping;
  final bool isFree;

  const _ServerTile({
    required this.flagAsset,
    required this.country,
    required this.location,
    required this.ping,
    this.isFree = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0FF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Image.asset(
            flagAsset,
            height: 30.h,
            width: 30.w,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          if (isFree)
            Text(
              'Free',
              style: TextStyle(
                color: Colors.green,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          SizedBox(width: 10.w),
          Text(
            ping,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(width: 10.w),
          Icon(Icons.speed, color: AppColors.primaryColor, size: 20.h),
        ],
      ),
    );
  }
}