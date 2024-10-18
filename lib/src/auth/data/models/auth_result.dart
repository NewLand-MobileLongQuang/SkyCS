import 'dart:convert';

import 'package:idnstd/src/auth/domain/entities/auth_result.dart';

import '../../../../core/utils/typedef.dart';

class AuthResultModel extends AuthResult  {
  const AuthResultModel({
    required super.AccessToken,
    required super.RefreshToken,
    required super.ExpiredIn,
  });

  AuthResultModel.fromBase(AuthResult base)
      : this(
    AccessToken: base.AccessToken,
    RefreshToken: base.RefreshToken,
    ExpiredIn: base.ExpiredIn,
  );

  AuthResultModel.fromMap(DataMap map)
      : this(
    AccessToken: map['AccessToken'] as String,
    RefreshToken: map['RefreshToken'] as String,
    ExpiredIn: map['ExpiredIn'] as int,
  );

  DataMap toMap() => {
    'AccessToken': AccessToken,
    'RefreshToken': RefreshToken,
    'ExpiredIn': ExpiredIn,
  };

  factory AuthResultModel.fromJson(String source) =>
      AuthResultModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  AuthResultModel copyWith({
    String? AccessToken,
    String? RefreshToken,
    int? ExpiredIn,
  }) {
    return AuthResultModel(
      AccessToken: AccessToken ?? this.AccessToken,
      RefreshToken: RefreshToken ?? this.RefreshToken,
      ExpiredIn: ExpiredIn ?? this.ExpiredIn,
    );
  }
}
