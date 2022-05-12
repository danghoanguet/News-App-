import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/app_routes.dart';

class LandingController extends GetxController {
  void getToPageName(String pageName) {
    Get.toNamed(pageName);
  }

  void getToNewsPage() {
    print('i was here');
    getToPageName(AppRoutes.home);
  }
}
