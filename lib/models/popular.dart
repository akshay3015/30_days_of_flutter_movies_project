import 'package:flutter_movie_project/models/result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'popular.g.dart';

@JsonSerializable()
class Popular {
  int page;
  @JsonKey(name: 'total_results')
  int totalResults;
  @JsonKey(name: 'total_pages')
  int totalPages;
  List<Result> results;

  Popular({this.page, this.totalResults, this.totalPages, this.results});
  factory Popular.fromJson(Map<String, dynamic> json) => _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);

}
