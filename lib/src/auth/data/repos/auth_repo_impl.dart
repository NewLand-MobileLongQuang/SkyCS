import 'package:dartz/dartz.dart';
import 'package:idnstd/core/common/app/entities/org.dart';
import 'package:idnstd/src/auth/domain/entities/auth_result.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';
import 'package:idnstd/src/auth/domain/entities/sso_data.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/repos/auth_repo.dart';
import '../datasource/auth_data_source.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl(this._datasource);

  final AuthDataSource _datasource;

  @override
  ResultFuture<AuthResult> login(
      {required String email, required String password}) async {
    try {
      final result = await _datasource.login(email: email, password: password);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }

  }

  @override
  ResultFuture<InosUser> getCurrentUser() async {
    try {
      final result = await _datasource.getCurrentUser();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<InosUser> saveUserProfile(
      {
      required String name,
      String avatar = '',
      String language = '',
      String currentPassword = '',
      String newPassword = ''}) async {
    try {
      final result = await _datasource.saveUserProfile(
          name: name,
          avatar: avatar,
          currentPassword: currentPassword,
          language: language,
          newPassword: newPassword);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<SSOData?> getSSOData() async {
    try {
      final result = await _datasource.getSSOData();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveSSOData({required String data}) async {
    try {
      final result = await _datasource.saveSSOData(data: data);

      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<Org>> getMyNetworks() async {
    try {
      final result = await _datasource.getMyNetworks();
      return Right(result);
    }

    on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
    on Exception catch(x)
    {


      return Left(ApiFailure(Message: x.toString(), Code:''));

    }
  }


// @override
// ResultFuture<InosUser> saveUserProfile({required String accessToken, required String name, required String avatar, required int timeZone}) async{
//   try {
//     final result =
//     await this._datasource.saveUserProfile(accessToken: accessToken, name: name, avatar: avatar, timeZone: timeZone);
//
//     return Right(result);
//   }
//   on ApiException catch(e)
//   {
//     return Left(ApiFailure.fromException(e));
//   }
// }
}
