import 'package:equatable/equatable.dart';
import 'package:idnstd/src/auth/domain/entities/auth_result.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';

import '../../../../src/auth/domain/usecases/load_session_info.dart';
import '../../../services/injection_container.dart';
import 'org.dart';

class SessionInfo extends Equatable {
  const SessionInfo({required this.user, required this.auth, this.org, required this.solutionAPI});

  SessionInfo._empty()
      : auth =
            const AuthResult(AccessToken: '', RefreshToken: '', ExpiredIn: 0),
        user = const InosUser(
            Id: 0, Email: '', Name: '', Phone: '', Language: '', Avatar: '', TimeZone: 0),
        org = null,
        solutionAPI = '';

  final InosUser user;
  final AuthResult auth;
  final Org? org;
  final String solutionAPI;

  bool isAuthenticated() {
    return auth.AccessToken.isNotEmpty;
  }

  @override
  List<Object?> get props => [user, auth];

  static SessionInfo _instance = SessionInfo._empty();

  static void reset() {
    _instance = SessionInfo._empty();
  }

  static SessionInfo current() {
    if (!_instance.isAuthenticated()) {
      final cResult = sl<LoadSessionInfo>()();

      cResult.fold((l) {}, (r) {
        if (r != null) {
          _instance = r as SessionInfo;
        }
      });
    }

    return _instance;
  }
}
