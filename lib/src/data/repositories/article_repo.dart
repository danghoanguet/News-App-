import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:getx_clean_base/src/data/source/remote/api_request.dart';
import 'package:dio/dio.dart';

abstract class IArticleRepository {
  Future<List<ArticleModel>?> getHeadlines({
    required String category,
    required String country,
  });
}

class ArticleRepositoryImpl extends IArticleRepository {
  final client = Get.find<ApiClient>();

  @override
  Future<List<ArticleModel>?> getHeadlines({
    required String category,
    required String country,
  }) async {
    try {
      final response = await client.getTopHeadlines(
        category: category,
        country: country,
      );
      return response.articles;
    } catch (e) {
      if (e is DioError) {
        final res = e.response;
        log("Got error : ${res!.statusCode} -> ${res.statusMessage}");
      }
      return null;
    }
  }
}
