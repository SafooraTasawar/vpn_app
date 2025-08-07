import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
          'Settings',
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
            // General Settings
            _SettingsOptionTile(
              icon: Icons.account_circle_outlined,
              title: 'Account',
              onTap: () {},
            ),
            _SettingsToggleTile(
              icon: Icons.alt_route_outlined,
              title: 'Split Tunneling',
              initialValue: false,
              onToggle: (value) {},
            ),
            _SettingsToggleTile(
              icon: Icons.dns_outlined,
              title: 'DNS',
              initialValue: true,
              onToggle: (value) {},
            ),
            _SettingsOptionTile(
              icon: Icons.restore_page_outlined,
              title: 'Restore Purchase',
              onTap: () {},
            ),
            _SettingsOptionTile(
              icon: Icons.delete_forever_outlined,
              title: 'Remove Data',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

// Reusable Tile for simple options
class _SettingsOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _SettingsOptionTile({
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

// Reusable Tile for options with a toggle switch
class _SettingsToggleTile extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onToggle;

  const _SettingsToggleTile({
    required this.icon,
    required this.title,
    required this.initialValue,
    required this.onToggle,
  });

  @override
  State<_SettingsToggleTile> createState() => _SettingsToggleTileState();
}

class _SettingsToggleTileState extends State<_SettingsToggleTile> {
  late bool _isEnabled;

  @override
  void initState() {
    super.initState();
    _isEnabled = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0FF),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: AppColors.primaryColor, size: 24.h),
          SizedBox(width: 20.w),
          Expanded(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
          ),
          Switch(
            value: _isEnabled,
            onChanged: (value) {
              setState(() {
                _isEnabled = value;
              });
              widget.onToggle(value);
            },
            activeColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
