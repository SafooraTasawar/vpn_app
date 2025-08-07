import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/routes/routes_name.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/utils/constants/image_assets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80.h),
            // App Logo
            Center(
              child: Image.asset(
                ImageAssets.appLogo,
                height: 100.h,
                width: 100.w,
              ),
            ),
            SizedBox(height: 16.h),
            // Tagline
            Text(
              'VPN App',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            Text(
              'Private & Secure',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            // Email Field
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            // Password Field
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.lock_outlined),
                suffixIcon: const Icon(Icons.visibility_off),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            // Forgot Password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigate to forgot password screen
                  Navigator.pushNamed(context, RoutesName.forgotPasswordScreen);
                },
                child: Text(
                  'Forgot password?',
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            // Login Button
            ElevatedButton(
              onPressed: () {
                // Yahan aapko login logic implement karna hoga
                // Filhal, hum is button se Home screen par ja rahe hain
                Navigator.pushReplacementNamed(context, RoutesName.homeScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            // Separator
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey.shade400)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: const Text('OR', style: TextStyle(color: Colors.grey)),
                ),
                Expanded(child: Divider(color: Colors.grey.shade400)),
              ],
            ),
            SizedBox(height: 24.h),
            // Social Login Buttons
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                side: BorderSide(color: Colors.grey.shade400),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login with Google', style: TextStyle(color: AppColors.black)),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                side: BorderSide(color: Colors.grey.shade400),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Login with Facebook', style: TextStyle(color: AppColors.black)),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Don't have an account?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account? ",
                  style: TextStyle(color: AppColors.black),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.signupScreen);
                  },
                  child: Text(
                    'Sign up',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}