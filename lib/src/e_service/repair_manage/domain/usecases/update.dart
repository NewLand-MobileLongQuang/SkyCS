import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class UpdateROParams extends Equatable {
  const UpdateROParams({required this.strJson});

  final String strJson;

  @override
  List<Object?> get props => [strJson];

}

class UpdateROUseCase extends UsecaseWithParams<void, UpdateROParams>{
  UpdateROUseCase(this._repo);
  final ES_RORepository _repo;

  @override
  ResultFuture<void> call(UpdateROParams params) async {
    return _repo.update(params: params);
  }
}