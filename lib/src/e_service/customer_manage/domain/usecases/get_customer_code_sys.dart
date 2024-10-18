import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';

class GetCustomerCodeSysParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();

}

class GetCustomerCodeSysUseCase extends UsecaseWithParams<String, GetCustomerCodeSysParams> {
  GetCustomerCodeSysUseCase(this._repository);
  final ES_CustomerRepository _repository;

  @override
  ResultFuture<String> call(GetCustomerCodeSysParams params) async {
    return await _repository.getCustomerCodeSys(params: params);
  }
}