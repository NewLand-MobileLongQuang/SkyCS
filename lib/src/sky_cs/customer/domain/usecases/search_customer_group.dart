import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_group.dart';
import 'package:idnstd/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';

class SearchCustomerGroupParams extends Equatable {
  const SearchCustomerGroupParams({
    required this.ScrTplCodeSys,
    required this.FlagActive,
    required this.Ft_PageIndex,
    required this.Ft_PageSize,
  });

  final String ScrTplCodeSys;
  final String FlagActive;
  final String Ft_PageIndex;
  final String Ft_PageSize;

  @override
  List<Object?> get props => [
    ScrTplCodeSys,
    FlagActive,
    Ft_PageIndex,
    Ft_PageSize,
  ];
}

class SearchCustomerGroupUseCase extends UsecaseWithParams<List<SKY_CustomerGroup>, SearchCustomerGroupParams> {
  SearchCustomerGroupUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerGroup>> call(SearchCustomerGroupParams params) async {
    return await _repository.searchCustomerGroup(params: params);
  }
}