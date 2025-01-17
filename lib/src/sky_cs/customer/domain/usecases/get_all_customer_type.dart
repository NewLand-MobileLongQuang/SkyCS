import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/rt_sky_customer_type.dart';
import 'package:idnstd/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';

class GetAllCustomerTypeParams extends Equatable {
  const GetAllCustomerTypeParams();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllCustomerTypeUseCase extends UsecaseWithParams<RT_SKY_CustomerType, GetAllCustomerTypeParams> {
  GetAllCustomerTypeUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<RT_SKY_CustomerType> call(GetAllCustomerTypeParams params) async {
    return await _repository.getAllCustomerType(params: params);
  }

}