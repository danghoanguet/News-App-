import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:getx_clean_base/src/data/models/movie_model.dart';
import 'package:getx_clean_base/src/data/source/remote/api_request.dart';
import 'package:dio/dio.dart';

import '../source/remote/api_extend.dart';

abstract class IMovieRepository {
  Future<List<MovieModel>?> getTrendingMovies({required String apiKey});
}

class MovieRepositoryImpl extends IMovieRepository {
  final client = Get.find<ApiClient>();

  @override
  Future<List<MovieModel>?> getTrendingMovies({required String apiKey}) async {
    try {
      final response = await client.getTrendingMovies(apiKey: ApiConfig.apiKey);
      return response.results;
    } catch (e) {
      if (e is DioError) {
        final res = e.response;
        log("Got error : ${res!.statusCode} -> ${res.statusMessage}");
      }
      return null;
    }
  }
}
