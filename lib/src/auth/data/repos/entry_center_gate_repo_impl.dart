import 'package:dartz/dartz.dart';
import 'package:idnstd/core/common/app/entities/object_result.dart';
import 'package:idnstd/core/common/app/entities/sys_user.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/data/datasource/entry_center_gate_data_source.dart';
import 'package:idnstd/src/auth/domain/repos/entry_center_gate_repo.dart';

class EntryCenterGateRepoImpl implements EntryCenterGateRepo {

  EntryCenterGateRepoImpl(this._dataSource);
  final EntryCenterGateRemoteDataSource _dataSource;

  @override
  ResultFuture<List<ObjectResult>> getByNetworks({required String networkId}) async {
    try {
      final result = await _dataSource.getByNetworks(networkId: networkId);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<DataUser> getForCurrentUser() async {
    try {
      final result = await _dataSource.getForCurrentUser();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}