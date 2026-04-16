part of 'route_imports.dart';

class AppRoutes {
  static String splash = "/splash";
  static String welcome = "/welcome";
  static String login = "/login";
  static String forgetpassword = "/forgetpassword";
  static String otpverification = "/otpverification";
  static String resetpassword = "/resetpassword";
  static String signUp = "/signUp";
  static String sendOtp = "/sendOtp";
  static String home = "/home";
  static String notifications = "/notifications";
  static String drawer = "/drawer";
  static String bottomNav = "/bottomNav";

  static List<GetPage<dynamic>> routes = [
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
        name: login,
        page: () => SigninScreen()),
    GetPage(
        name: forgetpassword,
        page: () => ForgetPasswordScreen()),
    GetPage(
        name: otpverification,
        page: () => OtpVerificationScreen()),
    GetPage(
        name: resetpassword,
        page: () => ResetPasswordScreen()),
    GetPage(
        name: signUp,
        page: () => SignupScreen()),
    GetPage(
        name: sendOtp,
        page: () => sendOtpScreen()),
  // GetPage(
  // name: bottombar,
  // page: () =>  BottombarScreen(),
  // binding: BottomBarBinding(),
  //
  // ),
  GetPage(
  name: drawer,
  page: () =>  DrawerScreen(),
  ),
    GetPage(
  name: notifications,
  page: () =>  NotificationScreen(),
  ),
    GetPage(
        name: home,
        page: () => HomeScreen(),
        ),

    GetPage(
        name: bottomNav,
        page: () => BottomNavBarScreen(),
        ),

  ];
}
