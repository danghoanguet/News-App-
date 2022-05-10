import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/pages/home/home_page.dart';

abstract class AppRoutes {
  static const String splash = "/intro";

  static const String home = "/home";
}

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    )
  ];
}
