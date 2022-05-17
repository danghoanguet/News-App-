import 'package:get/get.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';
import 'package:getx_clean_base/src/data/models/movies/trending_movie_model.dart';
import 'package:getx_clean_base/src/data/repositories/movie_repo.dart';
import 'package:getx_clean_base/src/data/source/remote/api_extend.dart';

import '../../../data/models/movies/popular_movie_model.dart';

class MovieController extends GetxController {
  final movieRepository = Get.find<IMovieRepository>();

  var currentIndex = 0.obs;

  var trendingMovies = <TrendingMovieModel>[].obs;

  var popularMovies = <PopularMovieModel>[].obs;

  List<dynamic> get movieList =>
      currentIndex.value == 0 ? trendingMovies : popularMovies;

  void onTap(int index) {
    currentIndex.value = index;
  }

  Future<void> init() async {
    await getTrendingMovies();
    await getPopularMovies();
  }

  Future<void> getTrendingMovies({String? country}) async {
    print('get trending movies');

    var response = await movieRepository.getTrendingMovies();
    if (response != null) {
      trendingMovies.value = response;
    }
  }

  Future<void> getPopularMovies() async {
    print('get popular movies');
    var response = await movieRepository.getPopularMovies();
    if (response != null) {
      popularMovies.value = response;
    } else {
      print('response null');
    }
  }
}
