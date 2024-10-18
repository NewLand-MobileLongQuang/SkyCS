import 'package:equatable/equatable.dart';
import 'package:idnstd/core/common/app/entities/object_result.dart';
import 'package:idnstd/core/usecases/usecase.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/data/repos/entry_center_gate_repo_impl.dart';
import 'package:idnstd/src/auth/domain/repos/entry_center_gate_repo.dart';

class GetByNetworksParams extends Equatable{
  const GetByNetworksParams({required this.networkId});

  final String networkId;

  @override
  List<Object?> get props => [networkId];
}

class GetByNetworks extends UsecaseWithParams<List<ObjectResult>, GetByNetworksParams> {
  GetByNetworks(this._repo);
  final EntryCenterGateRepo _repo;

  @override
  ResultFuture<List<ObjectResult>> call(GetByNetworksParams params) {
    return _repo.getByNetworks(networkId: params.networkId);
  }

}