import 'package:flutter/material.dart';
import 'package:poll_dao/src/features/active_polls_page/presentation/pages/acc_tivie_pols_page.dart';
import 'package:poll_dao/src/features/discover_page/presentation/pages/dicover_page.dart';
import 'package:poll_dao/src/features/education_level_page/presentation/pages/education_level_page.dart';
import 'package:poll_dao/src/features/location_page/presentation/pages/location_page.dart';
import 'package:poll_dao/src/features/nationality_page/presentation/pages/nationality_page.dart';
import 'package:poll_dao/src/features/profile_page/presentation/pages/profile_page.dart';
import 'package:poll_dao/src/features/sign_up_page/presentation/pages/sign_up_page.dart';
import '../../features/language_page_widget/presentation/pages/language_page.dart';
import '../../features/onboarding_page/presentation/pages/onboarding_page.dart';
import '../../features/poll_result_page/presentation/pages/poll_result_page.dart';
import '../../features/sign_in_page/presentation/pages/sign_in_page.dart';
import '../../features/splash_page/presentation/pages/splashh_page.dart';
class RouteNames{
  static const String splashPage="/";
  static const String activePollsPage="/active_pols_page";
  static const String discoverPage="/discover_page";
  static const String onboardingPage="/onboarding_page";
  static const String pollResultPage="/poll_result_page";
  static const String profilePage="profile_page";
  static const String signInPage="sign_in_page";
  static const String signUpPage="sign_up_page";
  static const String nationalityPage="nationality_page";
  static const String languagePage="language_page";
  static const String locationPage="location_page";
  static const String educationLevelPage="education_language_page";
  static const String twoActivePage="two_active_page";
}
class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashPage:
        return MaterialPageRoute(builder: (context) {
          return const SplashPage();
        });
      case RouteNames.activePollsPage:
        return MaterialPageRoute(builder: (context) {
          return const ActivePolsPage();
        });
      case RouteNames.discoverPage:
        return MaterialPageRoute(builder: (context) {
          return const DisCoverPage();
        });
      case RouteNames.onboardingPage:
        return MaterialPageRoute(builder: (context) {
          return const OnboardingPage();
        });
      case RouteNames.pollResultPage:
        return MaterialPageRoute(builder: (context) {
          return const PollResultPage();
        });
      case RouteNames.profilePage:
        return MaterialPageRoute(builder: (context) {
          return const ProfilePage();
        });
      case RouteNames.signInPage:
        return MaterialPageRoute(builder: (context) {
          return const SignInPage();
        });
      case RouteNames.signUpPage:
        return MaterialPageRoute(builder: (context) {
          return const SignUpPage();
        });
      case RouteNames.nationalityPage:
        return MaterialPageRoute(builder: (context) {
          return const NationalityPage();
        });
      case RouteNames.languagePage:
        return MaterialPageRoute(builder: (context) {
          return const LanguagePage();
        });
      case RouteNames.locationPage:
        return MaterialPageRoute(builder: (context) {
          return const LocationPage();
        });
      case RouteNames.educationLevelPage:
        return MaterialPageRoute(builder: (context) {
          return const EducationLevelPage();
        });
      case RouteNames.twoActivePage:
       /* return MaterialPageRoute(builder: (context) {
          //return const ChargePercentageIndicator(chargePercentage: (){}, option: '', text: '',);
        });*/
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Маршрут недоступен"),
            ),
          ),
        );
    }
  }
}
