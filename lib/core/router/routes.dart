part of 'router.dart';

abstract class AppRoutes {
  static const _authPaths = [
    '/login',
    '/signup',
    '/forget-password',
    '/check-otp',
    '/reset-password',
    '/verify-account',
  ];

  static const String home = 'HOME';
  static const String welcome = 'WELCOME';

  //* AUTH ROUTES
  static const String login = 'LOGIN';
  static const String signup = 'SIGNUP';
  static const String forgetPassword = 'FORGET_PASSWORD';
  static const String checkOtp = 'CHECK_OTP';
  static const String resetPassword = 'RESET_PASSWORD';
  static const String verifyAccount = 'VERIFY_ACCOUNT';


}
