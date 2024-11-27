import 'package:get_spot/presentation/screen/authentication/signup_screen.dart';
import 'package:get_spot/presentation/screen/authentication/splash_login_screen.dart';
import 'package:get_spot/presentation/screen/authentication/login_screen.dart';

final routes = {
  '/splash':(context) =>  SplashLoginScreen(),
  '/login':(context) => LoginScreen(),
  '/signup':(context) => SignupScreen(),
  // '/otpScreen': (context) => OtpScreen(mobileNumber: '',otp: '',),
  // 'bottomTab' : (context) => Bottomtab(),
};