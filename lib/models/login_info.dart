import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_info.freezed.dart';
part 'login_info.g.dart';

@freezed
class LoginInfo with _$LoginInfo {
  const factory LoginInfo({
    bool? isLoggedIn,
  }) = _LoginInfo;

  factory LoginInfo.fromJson(Map<String, Object?> json)
  => _$LoginInfoFromJson(json);
}
