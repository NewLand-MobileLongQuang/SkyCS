import 'package:dartz/dartz.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/profile/data/datasource/profile_data_source.dart';
import 'package:idnstd/src/profile/domain/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  ProfileRepoImpl(this._dataSource);
  final ProfileDataSource _dataSource;

  @override
  ResultVoid changeLanguage({required String language}) async {
    try {
      await _dataSource.changeLanguage(language);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}