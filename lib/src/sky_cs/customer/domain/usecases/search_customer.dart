import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_info.dart';
import 'package:idnstd/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';

class SearchCustomerSkyCSParams extends Equatable {
  final String ScrTplCodeSys;
  final String KeyWord;
  final String FlagActive;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  SearchCustomerSkyCSParams({
    required this.ScrTplCodeSys,
    required this.KeyWord,
    required this.FlagActive,
    required this.Ft_PageIndex,
    required this.Ft_PageSize,
  });

  @override
  List<Object> get props => [ScrTplCodeSys, KeyWord, FlagActive, Ft_PageIndex, Ft_PageSize];
}

class SearchCustomerSkyCSUseCase extends UsecaseWithParams<List<SKY_CustomerInfo>, SearchCustomerSkyCSParams> {
  SearchCustomerSkyCSUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerInfo>> call(SearchCustomerSkyCSParams params) async {
    return await _repository.searchCustomer(params: params);
  }
}
