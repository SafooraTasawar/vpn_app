import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/routes/routes_name.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/utils/constants/image_assets.dart';
import 'package:day2task/utils/constants/strings.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100.h),
            // Email Icon
            Center(
              child: Icon(
                Icons.mail_outline,
                size: 80.h,
                color: AppColors.primaryColor,
              ),
            ),
            SizedBox(height: 24.h),
            // Title
            Text(
              'Check Your Email',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            // Description
            Text(
              'We have sent a password reset link to your email address.',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            // Go to Login Button
            ElevatedButton(
              onPressed: () {
                // Navigate back to login screen
                Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Go to Login',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}