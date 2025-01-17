import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/repair_manage/domain/repos/es_ro_repo.dart';

class DeleteROParams extends Equatable{
  const DeleteROParams({required this.strJson});
  final String strJson;

  @override
  List<Object?> get props => [strJson];
}

class DeleteROUseCase extends UsecaseWithParams <void, DeleteROParams>{
  DeleteROUseCase(this._repo);
  final ES_RORepository _repo;

  @override
  ResultFuture<void> call(DeleteROParams params) async {
    return _repo.delete(params: params);
  }
}