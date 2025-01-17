import 'package:equatable/equatable.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_zalo_user.dart';
import 'package:idnstd/src/sky_cs/customer/domain/repos/sky_customer_repo.dart';

class SearchZaloUserParams extends Equatable {
  const SearchZaloUserParams({required this.ZaloUserName});

  final String ZaloUserName;

  @override
  List<Object?> get props => [ZaloUserName];
}

class SearchZaloUserUseCase extends UsecaseWithParams<List<SKY_CustomerZaloUser>, SearchZaloUserParams> {
  SearchZaloUserUseCase(this._repository);
  final SKY_CustomerRepository _repository;

  @override
  ResultFuture<List<SKY_CustomerZaloUser>> call(SearchZaloUserParams params) async {
    return await _repository.searchZaloUser(params: params);
  }
}