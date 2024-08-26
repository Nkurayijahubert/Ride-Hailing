import 'package:get/get.dart';
import 'package:ride_hailing/bindings/home.dart';
import 'package:ride_hailing/views/authentication/set_new_password.dart';
import 'package:ride_hailing/views/authentication/signin.dart';
import 'package:ride_hailing/views/authentication/signup.dart';
import 'package:ride_hailing/views/authentication/verify_otp.dart';
import 'package:ride_hailing/views/authentication/welcome_screen.dart';
import 'package:ride_hailing/views/complains/complain.dart';
import 'package:ride_hailing/views/home.dart';
import 'package:ride_hailing/views/transport/available_car.dart';
import 'package:ride_hailing/views/transport/car_details.dart';
import 'package:ride_hailing/views/transport/confirm_location.dart';
import 'package:ride_hailing/views/transport/request_rent.dart';
import 'package:ride_hailing/views/transport/select_transport.dart';
import 'package:ride_hailing/views/transport/thank_you.dart';

import '../bindings/available_cars.dart';
import '../views/onboarding/onboarding_one.dart';
import '../views/onboarding/onboarding_three.dart';
import '../views/onboarding/onboarding_two.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onBoardingOne,
      page: () => const OnboardingScreenOne(),
    ),
    GetPage(
      name: AppRoutes.onBoardingTwo,
      page: () => const OnboardingScreenTwo(),
    ),
    GetPage(
      name: AppRoutes.onBoardingThree,
      page: () => const OnboardingScreenThree(),
    ),
    GetPage(
      name: AppRoutes.welcome,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const Signup(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const Signin(),
    ),
    GetPage(
      name: AppRoutes.verifyOtp,
      page: () => VerifyOTP(),
    ),
    GetPage(
      name: AppRoutes.setNewPassword,
      page: () => const SetNewPassword(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => Home(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.selectTransport,
      page: () => const SelectTransport(),
    ),
    GetPage(
      name: AppRoutes.availableCar,
      page: () => const AvailableCar(),
      binding: AvailableCarsBinding(),
    ),
    GetPage(
      name: AppRoutes.carDetails,
      page: () => const CarDetails(),
    ),
    GetPage(
      name: AppRoutes.requestRent,
      page: () => const RequestRent(),
    ),
    GetPage(
      name: AppRoutes.thankYou,
      page: () => const ThankYou(),
    ),
    GetPage(
      name: AppRoutes.confirmLocation,
      page: () => ConfirmLocation(),
    ),
    GetPage(
      name: AppRoutes.complains,
      page: () => const Complains(),
    ),
  ];
}
