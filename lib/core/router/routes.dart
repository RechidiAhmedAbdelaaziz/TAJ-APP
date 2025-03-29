part of 'router.dart';

abstract class AppRoutes {
  static const _authPaths = [
    login,
    signup,
    forgetPassword,
    checkOtp,
    resetPassword,
    verifyAccount,
  ];

  static const String splash = '/';
  static const String home = '/home';
  static const String welcome = '/welcome';

  //* AUTH ROUTES
  static const String login = '/login';
  static const String signup = '/signup';
  static const String forgetPassword = '/forget-password';
  static const String checkOtp = '/check-otp';
  static const String resetPassword = '/reset-password';
  static const String verifyAccount = '/verify-account';

  //* PROFILE ROUTES
  static const String editProfile = '/edit-profile';
  static const String changePassword = '/change-password';

  //* NOTIFICATION ROUTES
  static const String notification = '/notification';
}
