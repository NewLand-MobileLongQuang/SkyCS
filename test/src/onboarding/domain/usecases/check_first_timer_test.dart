import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idnstd/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:mocktail/mocktail.dart';
import 'onboarding_screen_repo_mock.dart';

void main(){
  late HomeRepoMock repo;
  late CheckIfUserIsFirstTimer usecase;

  setUp((){
    repo= HomeRepoMock();
    usecase= CheckIfUserIsFirstTimer(repo);
  });


  test('should call [HomeRepoMock.checkIfUserIsFirstTimer] and return right data',
          () async {
        //arrange
        when(() => repo.checkIfUserIsFirstTimer())
        //.thenAnswer((invocation) async => const Right(null));
            .thenAnswer((invocation) async => const Right(true));
        //act
        final result= await usecase();

        expect(result, equals(Right(true)));

        //assert

        verify(()=> repo.checkIfUserIsFirstTimer()).called(1);
      });
}