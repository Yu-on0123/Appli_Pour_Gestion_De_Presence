import 'package:flutter/material.dart';
import '../pages/auth/login_page.dart';
import '../pages/auth/register_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../pages/face/enroll_face_page.dart';
import '../pages/face/scan_face_page.dart';
import '../pages/presence/presence_list_page.dart';
import '../pages/users/user_management_page.dart';
import '../pages/settings/settings_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String dashboard = '/dashboard';
  static const String enrollFace = '/enroll-face';
  static const String scanFace = '/scan-face';
  static const String presenceList = '/presence-list';
  static const String userManagement = '/users';
  static const String settings = '/settings';

  static Map<String, Widget Function(BuildContext)> routes = {
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    dashboard: (context) => const DashboardPage(role: "user"), // Placeholder
    enrollFace: (context) => const FaceEnrollmentPage(),
    scanFace: (context) => const FaceScanPage(),
    presenceList: (context) => const PresenceListPage(role: "user"), // Placeholder
    userManagement: (context) => const UserManagementPage(),
    settings: (context) => const SettingsPage(),
  };
}
