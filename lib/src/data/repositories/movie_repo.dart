import 'dart:developer';

import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:getx_clean_base/src/data/models/movies/popular_movie_model.dart';
import 'package:getx_clean_base/src/data/models/movies/trending_movie_model.dart';
import 'package:getx_clean_base/src/data/source/remote/api_request.dart';
import 'package:dio/dio.dart';

import '../source/remote/api_extend.dart';

abstract class IMovieRepository {
  Future<List<TrendingMovieModel>?> getTrendingMovies();
  Future<List<PopularMovieModel>?> getPopularMovies();
}

class MovieRepositoryImpl extends IMovieRepository {
  final client = Get.find<ApiMovieClient>();

  @override
  Future<List<TrendingMovieModel>?> getTrendingMovies() async {
    try {
      final response = await client.getTrendingMovies();
      return response.results;
    } catch (e) {
      if (e is DioError) {
        final res = e.response;
        log("Got error : ${res!.statusCode} -> ${res.statusMessage}");
      }
      return null;
    }
  }

  @override
  Future<List<PopularMovieModel>?> getPopularMovies() async {
    try {
      final response = await client.getPopularMovies();

      return response.results;
    } catch (e) {
      print(e.toString());
      if (e is DioError) {
        final res = e.response;
        log("Got error : ${res!.statusCode} -> ${res.statusMessage}");
      }
      return null;
    }
  }
}
