import 'package:dartz/dartz.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/data/datasource/session_info_local_data_src.dart';
import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/src/auth/domain/repos/local_session_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';

class LocalSessionRepoImpl implements LocalSessionRepo {
  const LocalSessionRepoImpl(this._localDataSource);

  final SessionInfoLocalDataSrc _localDataSource;

  @override
  ResultSync<SessionInfo?> loadSessionInfo() {
    try {
      final result = _localDataSource.loadSessionInfo();
      return Right(result);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }

  @override
  ResultVoid saveSessionInfo({required SessionInfo? info}) async {
    try {
      await _localDataSource.saveSessionInfo(info);
      SessionInfo.reset();
      return Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure.fromException(e));
    }
  }
}
