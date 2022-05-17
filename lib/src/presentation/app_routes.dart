import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/pages/home/home_page.dart';
import 'package:getx_clean_base/src/presentation/pages/landing/landing_page.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_dang_ky/mcredit_dang_ky_page.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_seller/mcredit_seller_page.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/movie_page.dart';
import 'package:getx_clean_base/src/presentation/pages/sign_in/sign_in_page.dart';

abstract class AppRoutes {
  static const String splash = "/intro";

  static const String home = "/home";

  static const String signin = '/signin';

  static const String landing = '/landing';

  static const String movie = '/movie';

  static const String mcredit = '/mcredit';

  static const String mcreditDangky = '/mcreditDangKy';
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
    GetPage(
      name: AppRoutes.mcredit,
      page: () => const McreditSellerPage(),
    ),
    GetPage(
      name: AppRoutes.mcreditDangky,
      page: () => const McreditDangKy(),
    ),
  ];
}
