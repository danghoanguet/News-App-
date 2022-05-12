import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:getx_clean_base/src/data/models/movie_model.dart';
import 'package:getx_clean_base/src/presentation/pages/home/home_controller.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/movie_controller.dart';

import '../../../core/constants/app_color.dart';
import '../../../data/models/user.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  // final controller = Get.put(MovieController());
  MovieController controller = Get.find<MovieController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.init();
      print('controller movie page 1: ${controller.movies.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, welcom to up coming movies "),
        //automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
          onRefresh: () async => controller.getTrendingMovies(),
          // child: Container(),
          child: _buildMovieList()),
    );
  }

  Widget _buildMovieList() {
    return Obx(
      () => ListView.builder(
        itemBuilder: (context, index) => Text(
          controller.movies[index].title!,
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
        itemCount: controller.movies.length - (controller.movies.length - 5),
      ),
    );
  }
}
