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

  //* DOCUMENTS ROUTES
  static const String documents = '/documents';

  //* ABOUT ROUTES
  static const String aboutUs = '/about-us';
  static const String termsAndConditions = '/terms-and-conditions';
  static const String contactUs = '/contact-us';

  //* REAL STATES ROUTES
  static const String realStates = '/real-states';

  //* REQUESTS ROUTES
  static const String myRequests = '/my-requests';
  static const String createRequest = '/create-request';

  //* NOTES ROUTES
  static const String notes = '/notes/request/:requestId';
  static const String createNote = '/create-note';

  //* RATING ROUTES
  static const String createRating = '/create-rating';
}
