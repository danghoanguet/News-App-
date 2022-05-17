import 'package:json_annotation/json_annotation.dart';

import '../../../../models/movies/popular_movie_model.dart';

@JsonSerializable()
class PopularMovieResponse {
  int? page;
  List<PopularMovieModel>? results;
  int? totalPages;
  int? totalResults;

  PopularMovieResponse(
      {this.page, this.results, this.totalPages, this.totalResults});

  PopularMovieResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    results = <PopularMovieModel>[];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results!.add(new PopularMovieModel.fromJson(v));
      });
    }
    print(results);
    totalPages = json['total_pages'] ?? 0;
    totalResults = json['total_results'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = this.totalPages;
    data['total_results'] = this.totalResults;
    return data;
  }
}
