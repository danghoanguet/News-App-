// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:getx_clean_base/src/data/source/remote/api_extend.dart';
import 'package:getx_clean_base/src/data/source/remote/responses/articles_response.dart';
import 'package:getx_clean_base/src/data/source/remote/responses/movies/popular_movie_response.dart';
import 'package:getx_clean_base/src/data/source/remote/responses/movies/trending_movie_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_request.g.dart';

@RestApi(baseUrl: ApiConfig.apiNewsBaseUrl)
abstract class ApiNewsClient {
  factory ApiNewsClient(Dio dio, {String baseUrl}) = _ApiNewsClient;

  @GET("/top-headlines")
  Future<ArticlesResponse> getTopHeadlines({
    @Query("apiKey") String apiKey = ApiConfig.apiNewsKey,
    @Query("country") required String country,
    @Query("category") required String category,
  });
}

@RestApi(baseUrl: ApiConfig.apiMovieBaseUrl)
abstract class ApiMovieClient {
  factory ApiMovieClient(Dio dio, {String baseUrl}) = _ApiMovieClient;

  @GET("/trending/movie/day")
  Future<TrendingMovieResponse> getTrendingMovies({
    @Query("api_key") String apiMoviesKey = ApiConfig.apiMovieKey,
  });

  @GET("/movie/popular")
  Future<PopularMovieResponse> getPopularMovies({
    @Query("api_key") String apiMoviesKey = ApiConfig.apiMovieKey,
    @Query("language") String language = 'en-US',
    @Query("page") String page = '1',
  });
}
