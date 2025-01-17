import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/e_service/customer_manage/domain/entities/rt_es_customer_detail.dart';
import 'package:idnstd/src/e_service/customer_manage/domain/repos/es_customer_repo.dart';

class GetByCustomerCodeSysParams extends Equatable {
  const GetByCustomerCodeSysParams({required this.ScrTplCodeSys, required this.CustomerCodeSys, required this.Ft_PageIndex, required this.Ft_PageSize});

  final String ScrTplCodeSys;
  final String CustomerCodeSys;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [ScrTplCodeSys, CustomerCodeSys, Ft_PageIndex, Ft_PageSize];
}

class GetByCustomerCodeSysUseCase extends UsecaseWithParams<RT_ESCustomerDetail, GetByCustomerCodeSysParams> {
  GetByCustomerCodeSysUseCase(this._repository);
  final ES_CustomerRepository _repository;

  @override
  ResultFuture<RT_ESCustomerDetail> call(GetByCustomerCodeSysParams params) async {
    return await _repository.getByCustomerCodeSys(params: params);
  }
}