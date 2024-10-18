import 'package:idnstd/core/common/app/entities/sys_user.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/domain/repos/entry_center_gate_repo.dart';

class GetForCurrentUser extends UsecaseWithoutParams<DataUser> {
  GetForCurrentUser(this._repo);
  final EntryCenterGateRepo _repo;

  @override
  ResultFuture<DataUser> call() {
    return _repo.getForCurrentUser();
  }
}