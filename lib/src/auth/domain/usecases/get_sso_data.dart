import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/src/auth/domain/entities/sso_data.dart';

import '../../../../core/utils/typedef.dart';
import '../repos/auth_repo.dart';




class GetSSOData extends UsecaseWithoutParams<SSOData?>
{
  const GetSSOData(this._repo);
  final AuthRepo _repo;

  @override
  ResultFuture<SSOData?> call() => _repo.getSSOData();

}