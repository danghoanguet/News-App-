import 'package:getx_clean_base/src/data/models/article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'articles_response.g.dart';

@JsonSerializable()
class ArticlesResponse {
  final String? status;
  final int? totalResults;
  final List<ArticleModel>? articles;

  ArticlesResponse(this.status, this.totalResults, this.articles);

  factory ArticlesResponse.fromJson(Map<String, dynamic> json) =>
      _$ArticlesResponseFromJson(json);
}
