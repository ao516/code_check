// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Results _$ResultsFromJson(Map<String, dynamic> json) => _Results(
  name: json['name'] as String,
  owner: json['owner'] as String,
  language: json['language'] as String,
  stars: (json['stars'] as num).toInt(),
  watchers: (json['watchers'] as num).toInt(),
  forks: (json['forks'] as num).toInt(),
  issues: (json['issues'] as num).toInt(),
);

Map<String, dynamic> _$ResultsToJson(_Results instance) => <String, dynamic>{
  'name': instance.name,
  'owner': instance.owner,
  'language': instance.language,
  'stars': instance.stars,
  'watchers': instance.watchers,
  'forks': instance.forks,
  'issues': instance.issues,
};
