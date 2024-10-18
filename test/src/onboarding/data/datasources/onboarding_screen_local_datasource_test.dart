import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/src/onboarding/data/datasources/onboarding_screen_local_datasource.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  late OnboardingScreenLocalDataSource localDataSource;
  late SharedPreferences pref;

  setUp(() {
    pref = MockSharedPreferences();

    localDataSource = OnBoardingScreenLocalDataSrcImpl(pref);
  });

  group('cacheFirstTimer', () {
    test('return OK', () async {
      //arrange
      when(() => pref.setBool(any(), any()))
          .thenAnswer((invocation) async => false);
      //act
      await localDataSource.cacheFirstTimer();
      //assert

      verify(() => pref.setBool(kCacheFirstTimer, false)).called(1);
      verifyNoMoreInteractions(pref);
    });

    test('should throw a [CacheException]', () async {
      when(() => pref.setBool(any(), any())).thenThrow(Exception());
      //act
      final methodCall = localDataSource.cacheFirstTimer;
      //assert
      expect(methodCall, throwsA(isA<CacheException>()));
      verify(() => pref.setBool(kCacheFirstTimer, false)).called(1);
      verifyNoMoreInteractions(pref);
    });
  });

  group('checkIfUserIsFirstTimer', () {
    test('return OK', () async {
      //arrange
      when(() => pref.getBool(any())).thenReturn(false);
      //act
      final result = await localDataSource.checkIfUserIsFirstTimer();
      //assert

      expect(result, false);

      verify(() => pref.getBool(kCacheFirstTimer)).called(1);
      verifyNoMoreInteractions(pref);
    });

    test('return true', () async {
      //arrange
      when(() => pref.getBool(any())).thenReturn(null);
      //act
      final result = await localDataSource.checkIfUserIsFirstTimer();
      //assert

      expect(result, true);

      verify(() => pref.getBool(kCacheFirstTimer)).called(1);
      verifyNoMoreInteractions(pref);
    });

    test('should throw CacheException  when failure', () async {
      when(() => pref.getBool(any())).thenThrow(Exception());
      final methodCall = localDataSource.checkIfUserIsFirstTimer;
      //assert
      expect(methodCall, throwsA(isA<CacheException>()));
      verify(() => pref.getBool(kCacheFirstTimer)).called(1);
      verifyNoMoreInteractions(pref);
    });
  });
}
