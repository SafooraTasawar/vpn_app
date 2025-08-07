import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'package:day2task/utils/constants/image_assets.dart';
import 'package:day2task/routes/routes_name.dart';
import 'package:day2task/features/server/views/server_list_screen.dart';
import 'package:day2task/features/speed_test/views/speed_test_screen.dart';
import 'package:day2task/features/profile/views/profile_screen.dart';
import 'package:day2task/features/premium/views/premium_screen.dart';
import 'package:day2task/features/notifications/notification_screen.dart'; // Notifications screen ka import

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isConnected = false;
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const _HomeBody(),
    const ServerListScreen(),
    const SpeedTestScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'VPN',
          style: TextStyle(
            color: AppColors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Notifications icon
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppColors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NotificationsScreen()),
              );
            },
          ),
          // Premium icon
          IconButton(
            icon: const Icon(Icons.workspace_premium, color: AppColors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PremiumScreen()),
              );
            },
          ),
          // Existing menu icon
          IconButton(
            icon: const Icon(Icons.menu, color: AppColors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Servers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.speed),
            label: 'Speed Test',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// Home screen ka body content
class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  State<_HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<_HomeBody> {
  bool isConnected = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.premiumScreen);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F0FF),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 24),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Go Premium',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.black,
                            ),
                          ),
                          Text(
                            'To unlock high speed servers',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.black,
                      size: 16.h,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 50.h),
            InkWell(
              onTap: () {
                setState(() {
                  isConnected = !isConnected;
                });
              },
              child: Container(
                height: 180.w,
                width: 180.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: isConnected
                          ? AppColors.primaryColor.withOpacity(0.2)
                          : Colors.grey.shade300,
                      blurRadius: 20,
                      spreadRadius: 5,
                    ),
                  ],
                  gradient: LinearGradient(
                    colors: isConnected
                        ? [AppColors.primaryColor, AppColors.primaryColor]
                        : [Colors.white, Colors.white],
                  ),
                  border: isConnected
                      ? Border.all(
                    color: AppColors.primaryColor,
                    width: 5,
                  )
                      : null,
                ),
                child: Center(
                  child: Icon(
                    Icons.power_settings_new,
                    size: 80.h,
                    color: isConnected ? Colors.white : AppColors.primaryColor,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              isConnected ? 'Status: Connected' : 'Status: Not Connected',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: isConnected ? AppColors.primaryColor : Colors.grey,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              isConnected ? '00:00:00' : '00:00:00',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 50.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0FF),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Image.asset(
                    ImageAssets.unitedStatesFlag,
                    height: 30.h,
                    width: 30.h,
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'United States',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          'New York',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.serverListScreen);
                    },
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
