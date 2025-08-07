import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';

// Main widget for the Premium and Payment screens
class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  final PageController _pageController = PageController();
  bool _isMonthly = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Premium'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Text(
                'VPN',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Upgrade to Quark Premium to get these all great features:',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 30.h),
              // Monthly/Annually toggle switch
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                padding: EdgeInsets.all(5.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMonthly = true;
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            color: _isMonthly ? AppColors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'Billed Monthly',
                              style: TextStyle(
                                color: _isMonthly ? AppColors.black : Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isMonthly = false;
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            color: !_isMonthly ? AppColors.white : Colors.transparent,
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Center(
                            child: Text(
                              'Billed Annually',
                              style: TextStyle(
                                color: !_isMonthly ? AppColors.black : Colors.grey.shade600,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // Page view for monthly and annual plans
              SizedBox(
                height: 250.h,
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(), // Disables swipe
                  onPageChanged: (index) {
                    setState(() {
                      _isMonthly = index == 0;
                    });
                  },
                  children: [
                    _PremiumPlanCard(
                      title: 'Monthly Premium',
                      price: '8,99',
                      priceUnit: '/month',
                      features: const ['4 user allowed'],
                      buttonText: 'Subscribe Now',
                    ),
                    _PremiumPlanCard(
                      title: 'Annual Premium',
                      price: '70,99',
                      priceUnit: '/yearly',
                      features: const ['4 user allowed'],
                      buttonText: 'Subscribe Now',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // Common premium features list
              _FeatureListItem(
                icon: Icons.public,
                text: 'Faster worldwide location',
              ),
              _FeatureListItem(
                icon: Icons.rocket_launch,
                text: 'Superfast server connection',
              ),
              _FeatureListItem(
                icon: Icons.no_adult_content,
                text: 'No ads',
              ),
              _FeatureListItem(
                icon: Icons.search,
                text: 'Searching more secure',
              ),
              _FeatureListItem(
                icon: Icons.link_off,
                text: 'No limit connection',
              ),
              SizedBox(height: 40.h),
              // Settings screen with payment methods
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black,
                ),
              ),
              SizedBox(height: 20.h),
              _PaymentMethodItem(
                icon: Icons.credit_card,
                text: 'Credit Or Debit Card',
                onTap: () {},
              ),
              _PaymentMethodItem(
                icon: Icons.apple,
                text: 'Apple Pay',
                onTap: () {},
              ),
              _PaymentMethodItem(
                icon: Icons.payment,
                text: 'Google Pay',
                onTap: () {},
              ),
              _PaymentMethodItem(
                icon: Icons.paypal,
                text: 'Paypal',
                onTap: () {},
              ),
              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget for premium plan cards
class _PremiumPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String priceUnit;
  final List<String> features;
  final String buttonText;

  const _PremiumPlanCard({
    required this.title,
    required this.price,
    required this.priceUnit,
    required this.features,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.white,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              features.first,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                Text(
                  '\$',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  priceUnit,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                minimumSize: Size(double.infinity, 50.h),
              ),
              child: Text(
                buttonText,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget for feature list items
class _FeatureListItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureListItem({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Icon(icon, color: AppColors.black, size: 24.h),
          SizedBox(width: 15.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget for payment method list items
class _PaymentMethodItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _PaymentMethodItem({
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
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.all(15.h),
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
            const Icon(Icons.add, color: AppColors.black),
          ],
        ),
      ),
    );
  }
}
