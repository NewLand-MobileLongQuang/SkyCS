import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class FinishROParams extends Equatable {
  const FinishROParams({required this.RONo, required this.FinishDTimeUser});

  final String RONo;
  final String FinishDTimeUser;

  @override
  List<Object?> get props => [RONo, FinishDTimeUser];
}

class FinishROUseCase extends UsecaseWithParams<void, FinishROParams> {
  FinishROUseCase(this._repo);
  final ES_RORepository _repo;

  @override
  ResultFuture<void> call(FinishROParams params) async {
    return _repo.finish(params: params);
  }
}