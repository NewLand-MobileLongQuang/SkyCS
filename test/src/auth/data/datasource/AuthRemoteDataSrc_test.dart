import 'dart:convert';


import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:idnstd/core/configs/app_config_base.dart';
import 'package:idnstd/core/configs/app_config_dev.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/src/auth/data/datasource/auth_data_source.dart';
import 'package:idnstd/src/auth/data/datasource/session_info_local_data_src.dart';
import 'package:idnstd/src/auth/data/models/auth_result.dart';
import 'package:idnstd/src/auth/data/repos/local_session_repo_impl.dart';
import 'package:idnstd/src/auth/domain/repos/local_session_repo.dart';
import 'package:idnstd/src/auth/domain/usecases/load_session_info.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MockClient extends Mock implements http.Client {}
class MockMultipartFile extends Mock implements http.MultipartFile {}
class MockSharedPreferences extends Mock implements SharedPreferences {}
Future<void> main() async {
  late http.Client client;
  late AuthDataSource remoteDataSrc;
  late SharedPreferences prefs;


  setUp(() async{

    prefs = MockSharedPreferences();
    final sl = GetIt.instance;
    sl
      ..registerLazySingleton(() => LoadSessionInfo(sl()))
      ..registerLazySingleton<LocalSessionRepo>(() => LocalSessionRepoImpl(sl()))

    ..registerLazySingleton<SessionInfoLocalDataSrc>(
    () => SessionInfoLocalDataSrcImpl(sl()))
    ..registerLazySingleton(() => prefs);
    sl.registerLazySingleton<AppConfigValuesBase>(() => AppConfigValuesDev());

    client = MockClient();
    remoteDataSrc = AuthRemoteDataSource(client);
    registerFallbackValue(Uri());
  });

  const tLoginResult= AuthResultModel(AccessToken: 'AccessToken', RefreshToken: 'RefreshToken', ExpiredIn: 1000);

  group('login', () {

    const kBaseUrl='https://devmobilesv.ecore.vn';
    const loginUrl='${kBaseUrl}/accountapi/login';
    test('should return [AuthResultModel] when status code is 200 or 201',
            () async {
          //arrange
          when(() => client.post(any(), body: any(named: 'body')))
              //.thenAnswer((_) async => http.Response('Not found', 404));

              .thenAnswer((_) async => http.Response(jsonEncode(tLoginResult.toMap()), 200));

          //act
          final result= await remoteDataSrc.login(email: 'email', password: 'password');
          expect(result, equals(tLoginResult));
          //assets
          verify(()=>client.post(Uri.parse(loginUrl), body: jsonEncode({'email': 'email', 'password': 'password'}))).called(1);
          verifyNoMoreInteractions(client);

        });


    test('should throw [ApiException]  when status code is not 200 or 201',
            () async {
          //arrange
          when(() => client.post(any(), headers: any(named: 'headers'), body: any(named: 'body')))
              .thenAnswer((_) async => http.Response('Not found', 404));

          //act
          final methodCall= remoteDataSrc.login;
          expect(() async=>methodCall(email: 'email', password: 'password'), throwsA(const ApiException(Message: 'Not found', Code: '404')));

          //verify(()=>client.post(Uri.parse(loginUrl), headers: any(named: 'headers'), body: jsonEncode({'email': 'email', 'password': 'password'}))).called(1);
          verify(()=>client.post(Uri.parse(loginUrl), headers: any(named: 'headers'),  body: any(named: 'body'))).called(1);
          verifyNoMoreInteractions(client);

        });
  });


}
