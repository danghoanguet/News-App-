import 'package:flutter/material.dart';

import '../../../../data/source/remote/api_extend.dart';

class MovieList extends StatelessWidget {
  final List<dynamic> movieList;
  const MovieList({Key? key, required this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Movie list build run');
    return ListView.builder(
      itemBuilder: (context, index) => Image.network(
          ApiConfig.apiGetImageBaseUrl + movieList[index].posterPath!),
      itemCount: movieList.length,
    );
    ;
  }
}
