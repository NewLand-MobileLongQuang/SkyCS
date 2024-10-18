import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class DeleteWarrantyParams extends Equatable {
  const DeleteWarrantyParams({required this.strJson});

  final String strJson;

  @override
  List<Object?> get props => [strJson];
}

class DeleteWarrantyUseCase extends UsecaseWithParams <void, DeleteWarrantyParams>{
  DeleteWarrantyUseCase(this._repo);
  final ES_WarrantyRepository _repo;

  @override
  ResultFuture<void> call(DeleteWarrantyParams params) async {
    return _repo.delete(params: params);
  }
}