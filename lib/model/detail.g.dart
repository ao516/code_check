// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DetailImpl _$$DetailImplFromJson(Map<String, dynamic> json) => _$DetailImpl(
  name: json['name'] as String,
  language: (json['language'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  owner: _ownerFromJson(json['owner'] as Map<String, dynamic>),
  stars: (json['stargazers_count'] as num).toInt(),
  watchers: (json['watchers'] as num).toInt(),
  forks: (json['forks'] as num).toInt(),
  issues: (json['open_issues'] as num).toInt(),
);

Map<String, dynamic> _$$DetailImplToJson(_$DetailImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
      'owner': instance.owner,
      'stargazers_count': instance.stars,
      'watchers': instance.watchers,
      'forks': instance.forks,
      'open_issues': instance.issues,
    };
