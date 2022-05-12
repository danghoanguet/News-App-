import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/movie_model.dart';
import 'package:getx_clean_base/src/data/repositories/movie_repo.dart';
import 'package:getx_clean_base/src/data/source/remote/api_extend.dart';

class MovieController extends GetxController {
  final movieRepository = Get.find<IMovieRepository>();

  var movies = <MovieModel>[].obs;

  void init() {
    getTrendingMovies();
  }

  void getTrendingMovies({String? country}) async {
    final response =
        await movieRepository.getTrendingMovies(apiKey: ApiConfig.apiKey);
    if (response != null) {
      movies.value = response;
    }
  }
}
