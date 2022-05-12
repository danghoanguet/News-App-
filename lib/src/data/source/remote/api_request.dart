// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:getx_clean_base/src/data/source/remote/api_extend.dart';
import 'package:getx_clean_base/src/data/source/remote/responses/articles_response.dart';
import 'package:getx_clean_base/src/data/source/remote/responses/movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi(baseUrl: ApiConfig.apiBaseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/top-headlines")
  Future<ArticlesResponse> getTopHeadlines({
    @Query("apiKey") String apiKey = ApiConfig.apiKey,
    @Query("country") required String country,
    @Query("category") required String category,
  });

  @GET("/trending/movie/day")
  Future<MovieResponse> getTrendingMovies({
    @Query("api_key") required String apiKey,
  });
}

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=key
