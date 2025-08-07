import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/routes/routes_name.dart';
import 'package:day2task/utils/constants/image_assets.dart';
import 'package:day2task/utils/constants/strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Changed to white background
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              _OnboardingPage(
                image: ImageAssets.onboarding1,
                title: AppStrings.onboardingTitle1,
                description: AppStrings.onboardingDesc1,
              ),
              _OnboardingPage(
                image: ImageAssets.onboarding2,
                title: AppStrings.onboardingTitle2,
                description: AppStrings.onboardingDesc2,
              ),
              _OnboardingPage(
                image: ImageAssets.onboarding3,
                title: AppStrings.onboardingTitle3,
                description: AppStrings.onboardingDesc3,
              ),
            ],
          ),
          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                // Page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) => _buildDot(index)),
                ),
                SizedBox(height: 20.h),
                // Button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentPage == 2) {
                          // Navigate to login/signup screen
                          Navigator.pushReplacementNamed(
                              context, RoutesName.loginScreen);
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accentColor,
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text(
                        _currentPage == 2 ? 'Get Started' : 'Next',
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 8.h,
      width: _currentPage == index ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.accentColor : Colors.grey.shade400, // Dot color changed for better visibility on white background
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}

// Reusable widget for each onboarding page
class _OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(), // Spacer
          // Image
          SizedBox(
            height: 200.h,
            child: Image.asset(image),
          ),
          // Title
          Text(
            title,
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          // Description
          Text(
            description,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 13.sp,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(), // Spacer
        ],
      ),
    );
  }
}