// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Results {

 String get name; String get owner; String get language; int get stars; int get watchers; int get forks; int get issues;
/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultsCopyWith<Results> get copyWith => _$ResultsCopyWithImpl<Results>(this as Results, _$identity);

  /// Serializes this Results to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Results&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.language, language) || other.language == language)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.watchers, watchers) || other.watchers == watchers)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.issues, issues) || other.issues == issues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,owner,language,stars,watchers,forks,issues);

@override
String toString() {
  return 'Results(name: $name, owner: $owner, language: $language, stars: $stars, watchers: $watchers, forks: $forks, issues: $issues)';
}


}

/// @nodoc
abstract mixin class $ResultsCopyWith<$Res>  {
  factory $ResultsCopyWith(Results value, $Res Function(Results) _then) = _$ResultsCopyWithImpl;
@useResult
$Res call({
 String name, String owner, String language, int stars, int watchers, int forks, int issues
});




}
/// @nodoc
class _$ResultsCopyWithImpl<$Res>
    implements $ResultsCopyWith<$Res> {
  _$ResultsCopyWithImpl(this._self, this._then);

  final Results _self;
  final $Res Function(Results) _then;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? owner = null,Object? language = null,Object? stars = null,Object? watchers = null,Object? forks = null,Object? issues = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,watchers: null == watchers ? _self.watchers : watchers // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Results].
extension ResultsPatterns on Results {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Results value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Results value)  $default,){
final _that = this;
switch (_that) {
case _Results():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Results value)?  $default,){
final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String owner,  String language,  int stars,  int watchers,  int forks,  int issues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that.name,_that.owner,_that.language,_that.stars,_that.watchers,_that.forks,_that.issues);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String owner,  String language,  int stars,  int watchers,  int forks,  int issues)  $default,) {final _that = this;
switch (_that) {
case _Results():
return $default(_that.name,_that.owner,_that.language,_that.stars,_that.watchers,_that.forks,_that.issues);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String owner,  String language,  int stars,  int watchers,  int forks,  int issues)?  $default,) {final _that = this;
switch (_that) {
case _Results() when $default != null:
return $default(_that.name,_that.owner,_that.language,_that.stars,_that.watchers,_that.forks,_that.issues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Results implements Results {
  const _Results({required this.name, required this.owner, required this.language, required this.stars, required this.watchers, required this.forks, required this.issues});
  factory _Results.fromJson(Map<String, dynamic> json) => _$ResultsFromJson(json);

@override final  String name;
@override final  String owner;
@override final  String language;
@override final  int stars;
@override final  int watchers;
@override final  int forks;
@override final  int issues;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultsCopyWith<_Results> get copyWith => __$ResultsCopyWithImpl<_Results>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Results&&(identical(other.name, name) || other.name == name)&&(identical(other.owner, owner) || other.owner == owner)&&(identical(other.language, language) || other.language == language)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.watchers, watchers) || other.watchers == watchers)&&(identical(other.forks, forks) || other.forks == forks)&&(identical(other.issues, issues) || other.issues == issues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,owner,language,stars,watchers,forks,issues);

@override
String toString() {
  return 'Results(name: $name, owner: $owner, language: $language, stars: $stars, watchers: $watchers, forks: $forks, issues: $issues)';
}


}

/// @nodoc
abstract mixin class _$ResultsCopyWith<$Res> implements $ResultsCopyWith<$Res> {
  factory _$ResultsCopyWith(_Results value, $Res Function(_Results) _then) = __$ResultsCopyWithImpl;
@override @useResult
$Res call({
 String name, String owner, String language, int stars, int watchers, int forks, int issues
});




}
/// @nodoc
class __$ResultsCopyWithImpl<$Res>
    implements _$ResultsCopyWith<$Res> {
  __$ResultsCopyWithImpl(this._self, this._then);

  final _Results _self;
  final $Res Function(_Results) _then;

/// Create a copy of Results
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? owner = null,Object? language = null,Object? stars = null,Object? watchers = null,Object? forks = null,Object? issues = null,}) {
  return _then(_Results(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,owner: null == owner ? _self.owner : owner // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,watchers: null == watchers ? _self.watchers : watchers // ignore: cast_nullable_to_non_nullable
as int,forks: null == forks ? _self.forks : forks // ignore: cast_nullable_to_non_nullable
as int,issues: null == issues ? _self.issues : issues // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
