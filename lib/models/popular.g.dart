// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Popular _$PopularFromJson(Map<String, dynamic> json) {
  return Popular(
    page: json['page'] as int,
    totalResults: json['total_results'] as int,
    totalPages: json['total_pages'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'page': instance.page,
      'total_results': instance.totalResults,
      'total_pages': instance.totalPages,
      'results': instance.results,
    };
