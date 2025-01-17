import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class UpdateWarrantyParams extends Equatable {
  const UpdateWarrantyParams({required this.strJson});
  final String strJson;

  @override
  List<Object?> get props => [strJson];
}

class UpdateWarrantyUseCase extends UsecaseWithParams<void, UpdateWarrantyParams>{
  UpdateWarrantyUseCase(this._repo);
  final ES_WarrantyRepository _repo;

  @override
  ResultFuture<void> call(UpdateWarrantyParams params) async {
    return _repo.update(params: params);
  }
}