import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/pages/home/home_page.dart';
import 'package:getx_clean_base/src/presentation/pages/sign_in/sign_in_page.dart';

abstract class AppRoutes {
  static const String splash = "/intro";

  static const String home = "/home";

  static const String signin = '/signin';
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
    )
  ];
}
