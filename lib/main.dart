import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/user.dart';
import 'package:getx_clean_base/src/data/repositories/article_repo.dart';
import 'package:getx_clean_base/src/data/repositories/movie_repo.dart';
import 'package:getx_clean_base/src/data/source/local/storage/local_storage.dart';
import 'package:getx_clean_base/src/data/source/remote/api_request.dart';
import 'package:getx_clean_base/src/presentation/app.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_dang_ky/mcredit_dang_ky_controller.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_seller/mcredit_seller_controller.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/movie_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage().init();
  setup();
  runApp(const MyApp());
}

void setup() {
  final dio = Dio();

  Get.put(UserController());
  Get.put(ApiNewsClient(dio));
  Get.put(ApiMovieClient(dio));
  Get.put<IArticleRepository>(ArticleRepositoryImpl());
  Get.put<IMovieRepository>(MovieRepositoryImpl());
  Get.put<McreditSellerController>(McreditSellerController());
  Get.put<McreditDangKyController>(McreditDangKyController());
}
