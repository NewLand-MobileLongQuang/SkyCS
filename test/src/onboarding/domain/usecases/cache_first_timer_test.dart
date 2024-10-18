import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/src/onboarding/domain/repos/onboarding_screen_repo.dart';
import 'package:idnstd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:mocktail/mocktail.dart';

import 'onboarding_screen_repo_mock.dart';

void main() {
  late OnboardingScreenRepo repo;
  late CacheFirstTimer usecase;


  setUp(() {
    repo = HomeRepoMock();
    usecase = CacheFirstTimer(repo);
  });
  test('should call [HomeRepoMock.cacheFirstTimer] and return right data',
      () async {
    //arrange
    when(() => repo.cacheFirstTimer())
        //.thenAnswer((invocation) async => const Right(null));
        .thenAnswer((invocation) async => const Left(const ApiFailure(Code: 'Code', Message: 'Message')));
    //act
        final result= await usecase();

        expect(result, equals(Left(const ApiFailure(Code: 'Code', Message: 'Message'))));
    //assert

        verify(()=> repo.cacheFirstTimer()).called(1);
  });
}
