import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/pages/home/home_page.dart';
import 'package:getx_clean_base/src/presentation/pages/landing/landing_page.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/movie_page.dart';
import 'package:getx_clean_base/src/presentation/pages/sign_in/sign_in_page.dart';

abstract class AppRoutes {
  static const String splash = "/intro";

  static const String home = "/home";

  static const String signin = '/signin';

  static const String landing = '/landing';

  static const String movie = '/movie';
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
    GetPage(
      name: AppRoutes.signin,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: AppRoutes.landing,
      page: () => const LandingPage(),
    ),
    GetPage(
      name: AppRoutes.movie,
      page: () => const MoviePage(),
    ),
  ];
}
