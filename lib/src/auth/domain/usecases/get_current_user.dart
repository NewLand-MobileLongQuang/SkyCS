import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/src/auth/domain/entities/auth_result.dart';
import 'package:idnstd/core/common/app/entities/inos_user.dart';

import '../../../../core/utils/typedef.dart';
import '../repos/auth_repo.dart';




class GetCurrentUser extends UsecaseWithParams<InosUser, String>
{
  const GetCurrentUser(this._repo);
  final AuthRepo _repo;


  // ResultFuture<AuthResult> login({required String email, required String password})
  // async=> _repo.login(email: email, password: password);

  @override
  ResultFuture<InosUser> call(String params) async => _repo.getCurrentUser();
}