import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/routes/routes_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  _navigateToNextScreen() async {
    // 3 seconds ka delay
    await Future.delayed(const Duration(seconds: 3), () {});
    // Onboarding screen par navigate karein
    Navigator.pushReplacementNamed(context, RoutesName.onboardingScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOGO text
            Text(
              'LOGO',
              style: TextStyle(
                color: AppColors.primaryColor, // Use the blue color from your design
                fontSize: 48.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 100.h),
            // Loading indicator
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.grey), // Grey color for loading indicator
            ),
            SizedBox(height: 16.h),
            Text(
              'v 1.0.0.1',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}