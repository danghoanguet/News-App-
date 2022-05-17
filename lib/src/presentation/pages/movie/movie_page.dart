import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';
import 'package:getx_clean_base/src/data/source/remote/api_extend.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/widgets/cupertino_scaffold.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/movie_controller.dart';
import 'package:getx_clean_base/src/presentation/pages/movie/widgets/tab_item.dart';

import 'widgets/movie_list.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({Key? key}) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final controller = Get.put(MovieController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          }
          return Scaffold(
            appBar: AppBar(
              title: Obx(() => Text(controller.currentIndex.value == 0
                  ? "Trending Movies"
                  : 'Popular')),
              //automaticallyImplyLeading: false,
            ),
            body: RefreshIndicator(
              onRefresh: () async => controller.currentIndex.value != 0
                  ? controller.getPopularMovies()
                  : controller.getTrendingMovies(),
              child: Obx(
                () => IndexedStack(
                    index: controller.currentIndex.value,
                    children: [
                      MovieList(movieList: controller.trendingMovies),
                      MovieList(movieList: controller.popularMovies),
                    ]),
              ),
            ),
            bottomNavigationBar: Obx(
              () => BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.movie_creation_outlined),
                      label: 'trending'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.movie_creation), label: 'popular')
                ],
                currentIndex: controller.currentIndex.value,
                onTap: (value) => {controller.onTap(value)},
                //onTap: (value) => controller.onTap(value),
                selectedItemColor: AppColor.primaryColor,
              ),
            ),
          );
        });
  }
}
