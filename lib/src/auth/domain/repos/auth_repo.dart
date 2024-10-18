import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';
import 'package:idnstd/src/auth/domain/entities/sso_data.dart';

import '../../../../core/common/app/entities/org.dart';
import '../entities/auth_result.dart';

abstract class AuthRepo {
  const AuthRepo();

  ResultFuture<AuthResult> login(
      {required String email, required String password});

  ResultFuture<InosUser> getCurrentUser();

  ResultFuture<List<Org>> getMyNetworks();

  ResultFuture<SSOData?> getSSOData();

  ResultVoid saveSSOData({required String data});

  ResultFuture<InosUser> saveUserProfile(
      {
      required String name,
      String avatar,
      String language,
      String currentPassword,
      String newPassword});
}
