import 'package:dartz/dartz.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/onboarding/domain/repos/onboarding_screen_repo.dart';

import '../datasources/onboarding_screen_local_datasource.dart';

class OnBoardingScreenRepoImpl implements OnboardingScreenRepo
{

  const OnBoardingScreenRepoImpl(this._localDataSource);

  final OnboardingScreenLocalDataSource _localDataSource;
  @override
  ResultVoid cacheFirstTimer() async{
   try{
     await _localDataSource.cacheFirstTimer();
     return const Right(null);
   }
   on CacheException catch(e){
     return Left(CacheFailure.fromException(e));
   }
  }

  @override
  ResultFuture<bool> checkIfUserIsFirstTimer() async {
    try{
      final result= await _localDataSource.checkIfUserIsFirstTimer();

      return Right(result);

    }
    on CacheException catch(e){
      return Left(CacheFailure.fromException(e));
    }
  }

}