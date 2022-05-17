import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/app_routes.dart';

class LandingController extends GetxController {
  void getToPageName(String pageName) {
    Get.toNamed(pageName);
  }

  void getToNewsPage() {
    getToPageName(AppRoutes.home);
  }

  void getToMoviesPage() {
    getToPageName(AppRoutes.movie);
  }

  void getToMcreditPage() {
    getToPageName(AppRoutes.mcredit);
  }

  void getToMcreditSignUpPage() {
    getToPageName(AppRoutes.mcreditDangky);
  }

  void getToSignInPage() {
    getToPageName(AppRoutes.signin);
  }
}
