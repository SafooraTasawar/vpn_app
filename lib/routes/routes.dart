import 'package:flutter/material.dart';
import 'package:day2task/features/auth/views/login_screen.dart';
import 'package:day2task/features/onboard/views/onboarding_screen.dart';
import 'package:day2task/features/onboard/views/splash_screen.dart';
import 'package:day2task/features/auth/views/signup_screen.dart';
import 'package:day2task/features/auth/views/forgot_password_screen.dart';
import 'package:day2task/features/auth/views/check_email_screen.dart';
import 'package:day2task/features/home/views/home_screen.dart'; // Corrected import path
import 'package:day2task/features/server/views/server_list_screen.dart';
import 'package:day2task/features/speed_test/views/speed_test_screen.dart';
import 'package:day2task/features/profile/views/profile_screen.dart';
import 'package:day2task/features/settings/views/settings_screen.dart';
import 'package:day2task/features/support/views/support_screen.dart';
import 'package:day2task/features/about/views/about_screen.dart';
import 'package:day2task/features/premium/views/premium_screen.dart';
import 'package:day2task/features/notifications/notification_screen.dart';
import 'package:day2task/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case RoutesName.onboardingScreen:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RoutesName.signupScreen:
        return MaterialPageRoute(builder: (context) => const SignupScreen());

      case RoutesName.forgotPasswordScreen:
        return MaterialPageRoute(builder: (context) => const ForgotPasswordScreen());

      case RoutesName.checkEmailScreen:
        return MaterialPageRoute(builder: (context) => const CheckEmailScreen());
      case RoutesName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case RoutesName.serverListScreen:
        return MaterialPageRoute(builder: (context) => const ServerListScreen());
      case RoutesName.speedTestScreen:
        return MaterialPageRoute(builder: (context) => const SpeedTestScreen());
      case RoutesName.profileScreen:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case RoutesName.settingsScreen:
        return MaterialPageRoute(builder: (context) => const SettingsScreen());
      case RoutesName.supportScreen:
        return MaterialPageRoute(builder: (context) => const SupportScreen());
      case RoutesName.aboutScreen:
        return MaterialPageRoute(builder: (context) => const AboutScreen());
      case RoutesName.premiumScreen:
        return MaterialPageRoute(builder: (context) => const PremiumScreen());
      case RoutesName.notificationsScreen:
        return MaterialPageRoute(builder: (context) => const NotificationsScreen());

      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}
