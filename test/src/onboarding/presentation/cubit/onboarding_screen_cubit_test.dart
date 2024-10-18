import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idnstd/core/errors/failure.dart';
import 'package:idnstd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:idnstd/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:idnstd/src/onboarding/presentation/cubit/onboarding_screen_cubit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';
class MockCacheFirstTimer extends Mock implements CacheFirstTimer{}
class MockCheckIfUserIsFirstTimer extends Mock implements CheckIfUserIsFirstTimer{}

void main(){
  late CacheFirstTimer cacheFirstTimer;
  late CheckIfUserIsFirstTimer checkIfUserIsFirstTimer;
  late OnboardingScreenCubit  cubit;

  setUp(() {
    cacheFirstTimer= MockCacheFirstTimer();
    checkIfUserIsFirstTimer=MockCheckIfUserIsFirstTimer();
    cubit= OnboardingScreenCubit(cacheFirstTimer: cacheFirstTimer, checkIfUserIsFirstTimer: checkIfUserIsFirstTimer);

  });
  
  test('initial state should be [HomeScreenInitial]', (){
    
    expect(cubit.state, const OnboardingScreenInitial());

  });
  
  group('cacheFirstTimer', () { 
    blocTest<OnboardingScreenCubit, OnboardingScreenState>(
      'should emit [CachingFirstTimer], [UserCached] when success',
      build: (){
        when(()=>cacheFirstTimer()).thenAnswer((invocation) async => Right(null));
        return cubit;
      },
      act: (cubit) =>cubit.cacheFirstTimer(),
      expect: () => const [
        CachingFirstTimer(), UserCached()

      ],
      verify: (_){
        verify(()=>cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);
    }
    );

    blocTest<OnboardingScreenCubit, OnboardingScreenState>(
        'should emit [CachingFirstTimer], Error',
        build: (){
          when(()=>cacheFirstTimer()).thenAnswer((invocation) async => const Left(CacheFailure(Message: 'Message', Code:'Code')));
          return cubit;
        },
        act: (cubit) =>cubit.cacheFirstTimer(),
        expect: () => const [
          CachingFirstTimer(), OnboardingScreenError(message: 'Message')

        ],
              verify: (_){
            verify(()=>cacheFirstTimer()).called(1);
            verifyNoMoreInteractions(cacheFirstTimer);
        }
    );
  });

  group('checkIfUserIsFirstTimer', () {

    blocTest<OnboardingScreenCubit, OnboardingScreenState>(
        'should emit [CheckingIfUserIsFirstTimer], [HomeScreenStatus] when success',
        build: (){
          when(()=>checkIfUserIsFirstTimer()).thenAnswer((invocation) async => Right(false));
          return cubit;
        },
        act: (cubit) =>cubit.checkIfUserIsFirstTimer(),
        expect: () => const [
           CheckingIfUserIsFirstTimer(),  OnboardingScreenStatus(isFirstTimer: false)

        ],
        verify: (_){
          verify(()=>checkIfUserIsFirstTimer()).called(1);
          verifyNoMoreInteractions(checkIfUserIsFirstTimer);
        }
    );

    blocTest<OnboardingScreenCubit, OnboardingScreenState>(
        'should emit [CheckingIfUserIsFirstTimer], [HomeScreenStatus(true)] when fail',
        build: (){
          when(()=>checkIfUserIsFirstTimer()).thenAnswer((invocation) async => const Left(CacheFailure(Message: 'Message', Code:'Code')));
          return cubit;
        },
        act: (cubit) =>cubit.checkIfUserIsFirstTimer(),
        expect: () => const [
          CheckingIfUserIsFirstTimer(),  OnboardingScreenStatus(isFirstTimer: true)

        ],
        verify: (_){
          verify(()=>checkIfUserIsFirstTimer()).called(1);
          verifyNoMoreInteractions(checkIfUserIsFirstTimer);
        }
    );

  });
}