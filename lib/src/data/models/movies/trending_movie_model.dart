import 'package:json_annotation/json_annotation.dart';

import '../../source/remote/api_extend.dart';

@JsonSerializable()
class TrendingMovieModel {
  String? originalTitle;
  String? posterPath;
  String? title;
  int? id;
  double? voteAverage;
  String? overview;
  String? releaseDate;
  bool? adult;
  String? backdropPath;
  int? voteCount;
  List<int>? genreIds;
  bool? video;
  String? originalLanguage;
  double? popularity;
  String? mediaType;

  TrendingMovieModel(
      {this.originalTitle,
      this.posterPath,
      this.title,
      this.id,
      this.voteAverage,
      this.overview,
      this.releaseDate,
      this.adult,
      this.backdropPath,
      this.voteCount,
      this.genreIds,
      this.video,
      this.originalLanguage,
      this.popularity,
      this.mediaType});

  TrendingMovieModel.fromJson(Map<String, dynamic> json) {
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    id = json['id'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'].cast<int>();
    video = json['video'];
    originalLanguage = json['original_language'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['video'] = this.video;
    data['original_language'] = this.originalLanguage;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
