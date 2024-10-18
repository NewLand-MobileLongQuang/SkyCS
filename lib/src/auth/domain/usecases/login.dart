import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/src/auth/domain/entities/auth_result.dart';

import '../../../../core/utils/typedef.dart';
import '../repos/auth_repo.dart';


class LoginParams extends Equatable{
  const LoginParams({
    required this.email,
    required this.password
  });
  final String email;
  final String password;
  @override
  List<Object?> get props => [email, password];

}

class Login extends UsecaseWithParams<AuthResult, LoginParams>
{
  const Login(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<AuthResult> call(LoginParams params) async => _repo.login(email: params.email, password: params.password);
}