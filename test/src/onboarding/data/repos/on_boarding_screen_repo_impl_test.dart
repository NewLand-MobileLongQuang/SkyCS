import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/src/onboarding/data/datasources/onboarding_screen_local_datasource.dart';
import 'package:idnstd/src/onboarding/data/repos/on_boarding_screen_repo_impl.dart';
import 'package:idnstd/src/onboarding/domain/repos/onboarding_screen_repo.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeScreenLocalSrc extends Mock implements OnboardingScreenLocalDataSource{}

void main(){
  late OnboardingScreenLocalDataSource localDataSource;
  late OnBoardingScreenRepoImpl repoImpl;

  setUp(() {

    localDataSource= MockHomeScreenLocalSrc();
    repoImpl= OnBoardingScreenRepoImpl(localDataSource);

  });

  test('should be a subclass of [HomeRepo]', () {
    expect(repoImpl,isA<OnboardingScreenRepo>());

  });
  
  group('cacheFirstTimer', () { 
    test('should complete successfully', () async {

      //arrange
      when(()=>localDataSource.cacheFirstTimer()).thenAnswer((_) async => Right(null));
      //act
      final result= await repoImpl.cacheFirstTimer();
      //assert
      expect(result, equals(Right(null)));

      verify(()=>localDataSource.cacheFirstTimer()).called(1);

      verifyNoMoreInteractions(localDataSource);

    },);


    test('should return failure', () async{

      //arrange
      when(()=>localDataSource.cacheFirstTimer()).thenThrow(const CacheException(Message: 'Message', Code: 'Code') );
      //act
      final result= await repoImpl.cacheFirstTimer();
      //assert
      expect(result, equals(Left(const CacheFailure(Message: 'Message', Code: 'Code'))));

      verify(()=>localDataSource.cacheFirstTimer()).called(1);

      verifyNoMoreInteractions(localDataSource);

    });


  });

  group('checkIfUserIsFirsTimer', () {

    test('should complete successfully', () async {

      //arrange
      when(()=>localDataSource.checkIfUserIsFirstTimer()).thenAnswer((_) async =>false);
      //act
      final result= await repoImpl.checkIfUserIsFirstTimer();
      //assert
      expect(result, equals(Right(false)));

      verify(()=>localDataSource.checkIfUserIsFirstTimer()).called(1);

      verifyNoMoreInteractions(localDataSource);

    },);

    test('should return failure', () async {

      //arrange
      when(()=>localDataSource.checkIfUserIsFirstTimer()).thenThrow(const CacheException(Message: 'Message', Code: 'Code') );
      //act
      final result= await repoImpl.checkIfUserIsFirstTimer();
      //assert
      expect(result, equals(Left(const CacheFailure(Message: 'Message', Code: 'Code'))));

      verify(()=>localDataSource.checkIfUserIsFirstTimer()).called(1);

      verifyNoMoreInteractions(localDataSource);

    },);
  });
}

