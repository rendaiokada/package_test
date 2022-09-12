// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginInfo _$LoginInfoFromJson(Map<String, dynamic> json) {
  return _LoginInfo.fromJson(json);
}

/// @nodoc
mixin _$LoginInfo {
  bool? get isLoggedIn => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginInfoCopyWith<LoginInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginInfoCopyWith<$Res> {
  factory $LoginInfoCopyWith(LoginInfo value, $Res Function(LoginInfo) then) =
      _$LoginInfoCopyWithImpl<$Res>;
  $Res call({bool? isLoggedIn});
}

/// @nodoc
class _$LoginInfoCopyWithImpl<$Res> implements $LoginInfoCopyWith<$Res> {
  _$LoginInfoCopyWithImpl(this._value, this._then);

  final LoginInfo _value;
  // ignore: unused_field
  final $Res Function(LoginInfo) _then;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
  }) {
    return _then(_value.copyWith(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$$_LoginInfoCopyWith<$Res> implements $LoginInfoCopyWith<$Res> {
  factory _$$_LoginInfoCopyWith(
          _$_LoginInfo value, $Res Function(_$_LoginInfo) then) =
      __$$_LoginInfoCopyWithImpl<$Res>;
  @override
  $Res call({bool? isLoggedIn});
}

/// @nodoc
class __$$_LoginInfoCopyWithImpl<$Res> extends _$LoginInfoCopyWithImpl<$Res>
    implements _$$_LoginInfoCopyWith<$Res> {
  __$$_LoginInfoCopyWithImpl(
      _$_LoginInfo _value, $Res Function(_$_LoginInfo) _then)
      : super(_value, (v) => _then(v as _$_LoginInfo));

  @override
  _$_LoginInfo get _value => super._value as _$_LoginInfo;

  @override
  $Res call({
    Object? isLoggedIn = freezed,
  }) {
    return _then(_$_LoginInfo(
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginInfo implements _LoginInfo {
  const _$_LoginInfo({this.isLoggedIn});

  factory _$_LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$$_LoginInfoFromJson(json);

  @override
  final bool? isLoggedIn;

  @override
  String toString() {
    return 'LoginInfo(isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginInfo &&
            const DeepCollectionEquality()
                .equals(other.isLoggedIn, isLoggedIn));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isLoggedIn));

  @JsonKey(ignore: true)
  @override
  _$$_LoginInfoCopyWith<_$_LoginInfo> get copyWith =>
      __$$_LoginInfoCopyWithImpl<_$_LoginInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginInfoToJson(
      this,
    );
  }
}

abstract class _LoginInfo implements LoginInfo {
  const factory _LoginInfo({final bool? isLoggedIn}) = _$_LoginInfo;

  factory _LoginInfo.fromJson(Map<String, dynamic> json) =
      _$_LoginInfo.fromJson;

  @override
  bool? get isLoggedIn;
  @override
  @JsonKey(ignore: true)
  _$$_LoginInfoCopyWith<_$_LoginInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
