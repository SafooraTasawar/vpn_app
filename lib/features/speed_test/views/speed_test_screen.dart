import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:day2task/utils/constants/colors.dart';
import 'dart:math' as math;

// Main widget for the speed test screen
class SpeedTestScreen extends StatelessWidget {
  const SpeedTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              'Speed Test',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
            SizedBox(height: 40.h),
            // The custom speed gauge widget
            SizedBox(
              height: 250.h,
              width: 250.w, // Gauge ko sahi se dikhane ke liye width add kiya gaya
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CustomPaint(
                    size: Size(250.w, 250.h),
                    // Progress value ko badal kar aap needle ki position change kar sakte hain
                    painter: SpeedGaugePainter(progress: 0.6),
                  ),
                  Positioned(
                    bottom: 40.h, // Central text ki position adjust ki gayi
                    child: Column(
                      children: [
                        Text(
                          '240', // Hardcoded value, aap isko dynamic kar sakte hain
                          style: TextStyle(
                            fontSize: 40.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          'Mbps',
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _SpeedValueWidget(
                  icon: Icons.file_download,
                  value: '64.8',
                  unit: 'Mbps',
                  color: Colors.purple,
                ),
                _SpeedValueWidget(
                  icon: Icons.file_upload,
                  value: '48.8',
                  unit: 'Mbps',
                  color: Colors.green,
                ),
                _SpeedValueWidget(
                  icon: Icons.wifi_protected_setup,
                  value: '10',
                  unit: 'MS',
                  color: Colors.blue,
                ),
              ],
            ),
            SizedBox(height: 40.h),
            ElevatedButton(
              onPressed: () {
                // 'Test Again' button ka logic yahan aayega
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: Text(
                'Test Again',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

// Custom painter for the speed gauge with numbers and ticks
class SpeedGaugePainter extends CustomPainter {
  final double progress;

  SpeedGaugePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;
    final paint = Paint()
      ..strokeWidth = 20
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Background Arc
    paint.color = const Color(0xFFE0E0E0);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.75, // Start angle (225 degrees)
      math.pi * 1.5, // Sweep angle (270 degrees)
      false,
      paint,
    );

    // Foreground Arc (Progress)
    paint.color = const Color(0xFF1976D2); // Progress color
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.75,
      math.pi * 1.5 * progress,
      false,
      paint,
    );

    // Needle
    final needlePaint = Paint()
      ..color = const Color(0xFF0D47A1) // Needle color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final angle = math.pi * 0.75 + math.pi * 1.5 * progress;
    const needleLengthFactor = 0.7;
    final endPoint = center + Offset(math.cos(angle) * radius * needleLengthFactor, math.sin(angle) * radius * needleLengthFactor);
    canvas.drawLine(center, endPoint, needlePaint);

    // Numbers and Ticks
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    final tickPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1;

    for (int i = 0; i <= 4; i++) {
      final value = i * 100;
      final angleForValue = math.pi * 0.75 + math.pi * 1.5 * (value / 400);
      const numberRadiusFactor = 0.85;
      final numberOffset = center + Offset(math.cos(angleForValue) * radius * numberRadiusFactor, math.sin(angleForValue) * radius * numberRadiusFactor);

      textPainter.text = TextSpan(
        text: value.toString(),
        style: const TextStyle(fontSize: 10, color: Colors.black),
      );
      textPainter.layout();
      textPainter.paint(canvas, numberOffset - Offset(textPainter.width / 2, textPainter.height / 2));

      // Ticks
      const tickRadiusFactor = 0.9;
      final tickStart = center + Offset(math.cos(angleForValue) * radius * tickRadiusFactor, math.sin(angleForValue) * radius * tickRadiusFactor);
      final tickEnd = center + Offset(math.cos(angleForValue) * radius, math.sin(angleForValue) * radius);
      canvas.drawLine(tickStart, tickEnd, tickPaint);
    }
  }

  @override
  bool shouldRepaint(covariant SpeedGaugePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

// A reusable widget to display speed values
class _SpeedValueWidget extends StatelessWidget {
  final IconData icon;
  final String value;
  final String unit;
  final Color color;

  const _SpeedValueWidget({
    required this.icon,
    required this.value,
    required this.unit,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 24.h),
        SizedBox(height: 8.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            fontSize: 12.sp,
            color: Colors.grey.shade600,
          ),
        ),
      ],
    );
  }
}

