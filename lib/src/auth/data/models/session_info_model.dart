import 'dart:convert';

import 'package:idnstd/core/common/app/entities/org.dart';
import 'package:idnstd/src/auth/data/models/auth_result.dart';
import 'package:idnstd/src/auth/data/models/inos_user_model.dart';
import 'package:idnstd/src/auth/data/models/org_model.dart';
import 'package:idnstd/src/auth/domain/entities/auth_result.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';

import '../../../../core/utils/typedef.dart';

class SessionInfoModel extends SessionInfo {
  SessionInfoModel({required super.user, required super.auth, super.org, required super.solutionAPI});

  SessionInfoModel.fromBase(SessionInfo base)
      : this(
          user: base.user,
          auth: base.auth,
          org: base.org,
          solutionAPI: base.solutionAPI,
        );

  SessionInfoModel.fromMap(DataMap map)
      : this(
          user: UserModel.fromMap(map['user'] as DataMap),
          auth: AuthResultModel.fromMap(map['auth'] as DataMap),
          org: map.containsKey('org')
              ? OrgModel.fromMap(map['org'] as DataMap)
              : null,
          solutionAPI: map['solutionCode'].toString()
        );

  DataMap toMap() => org != null
      ? {
          'user': UserModel.fromBase(user).toMap(),
          'auth': AuthResultModel.fromBase(auth).toMap(),
          'org': OrgModel.fromBase(org!).toMap(),
          'solutionCode': solutionAPI,
        }
      : {
    'user': UserModel.fromBase(user).toMap(),
    'auth': AuthResultModel.fromBase(auth).toMap(),
        };

  factory SessionInfoModel.fromJson(String source) =>
      SessionInfoModel.fromMap(jsonDecode(source) as DataMap);

  String toJson() => jsonEncode(toMap());

  SessionInfoModel copyWith({
    InosUser? user,
    AuthResult? auth,
    Org? org,
  }) {
    return SessionInfoModel(
      user: user ?? this.user,
      auth: auth ?? this.auth,
      org: org,
      solutionAPI: solutionAPI,
    );
  }
}
