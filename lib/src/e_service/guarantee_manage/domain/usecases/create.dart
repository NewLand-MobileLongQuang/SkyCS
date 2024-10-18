import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/guarantee_manage/domain/repos/es_warranty_repo.dart';

class CreateWarrantyParams extends Equatable {
  const CreateWarrantyParams({required this.strJson});
  final String strJson;

  @override
  List<Object?> get props => [strJson];
}

class CreateWarrantyUseCase extends UsecaseWithParams<void, CreateWarrantyParams>{
  CreateWarrantyUseCase(this._repo);
  final ES_WarrantyRepository _repo;

  @override
  ResultFuture<void> call(CreateWarrantyParams params) async {
    return _repo.create(params: params);
  }
}