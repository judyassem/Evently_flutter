import 'package:evently/screens/home/addEventTab/EventDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../screens/Authentication/forget_password.dart';
import '../screens/Authentication/login.dart';
import '../screens/Authentication/register.dart';
import '../screens/home/homeTab/home_screen.dart';
import '../screens/home/mapTab/location_picker.dart';
import '../screens/onboardings/onBoardingMain.dart';
import '../screens/onboardings/on_boarding_system.dart';
import '../screens/splash/splash_screen.dart';

abstract final class AppRoutes {
  static Route home = MaterialPageRoute(builder: (_) => const Home());
  static Route addEvent = MaterialPageRoute(builder: (_) => const EventDetails());
  static Route<LatLng> locationPicker = MaterialPageRoute(builder: (_) => const LocationPickerScreen());
  static Route onBoardingMain = MaterialPageRoute(builder: (_) => const OnBoardingMain(),);
  static Route onBoardingSystem = MaterialPageRoute( builder: (_) => const OnBoardingSystem(),);
  static Route login = MaterialPageRoute(builder: (_) => const Login());
  static Route register = MaterialPageRoute(builder: (_) => const Register());
  static Route forgetPassword = MaterialPageRoute(builder: (_) => const ForgetPassword(),);
  static Route splash = MaterialPageRoute(builder: (_) => const Splash());
}
