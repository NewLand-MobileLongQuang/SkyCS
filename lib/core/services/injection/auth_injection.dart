import 'package:http/http.dart' as http;
import 'package:idnstd/core/services/injection_container.dart';
import 'package:idnstd/src/auth/data/datasource/auth_data_source.dart';
import 'package:idnstd/src/auth/data/datasource/entry_center_gate_data_source.dart';
import 'package:idnstd/src/auth/data/datasource/session_info_local_data_src.dart';
import 'package:idnstd/src/auth/data/repos/auth_repo_impl.dart';
import 'package:idnstd/src/auth/data/repos/entry_center_gate_repo_impl.dart';
import 'package:idnstd/src/auth/data/repos/local_session_repo_impl.dart';
import 'package:idnstd/src/auth/domain/repos/auth_repo.dart';
import 'package:idnstd/src/auth/domain/repos/entry_center_gate_repo.dart';
import 'package:idnstd/src/auth/domain/repos/local_session_repo.dart';
import 'package:idnstd/src/auth/domain/usecases/get_by_networks.dart';
import 'package:idnstd/src/auth/domain/usecases/get_current_user.dart';
import 'package:idnstd/src/auth/domain/usecases/get_for_current_user.dart';
import 'package:idnstd/src/auth/domain/usecases/get_my_networks.dart';
import 'package:idnstd/src/auth/domain/usecases/get_sso_data.dart';
import 'package:idnstd/src/auth/domain/usecases/load_session_info.dart';
import 'package:idnstd/src/auth/domain/usecases/login.dart';
import 'package:idnstd/src/auth/domain/usecases/save_session_info.dart';
import 'package:idnstd/src/auth/domain/usecases/save_user_profile.dart';
import 'package:idnstd/src/auth/presentation/cubit/auth_cubit.dart';
import 'package:idnstd/src/onboarding/data/datasources/onboarding_screen_local_datasource.dart';
import 'package:idnstd/src/onboarding/data/repos/on_boarding_screen_repo_impl.dart';
import 'package:idnstd/src/onboarding/domain/repos/onboarding_screen_repo.dart';
import 'package:idnstd/src/onboarding/domain/usecases/cache_first_timer.dart';
import 'package:idnstd/src/onboarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:idnstd/src/onboarding/presentation/cubit/onboarding_screen_cubit.dart';
import 'package:idnstd/src/profile/data/datasource/profile_data_source.dart';
import 'package:idnstd/src/profile/data/repos/profile_repo_impl.dart';
import 'package:idnstd/src/profile/domain/repos/profile_repo.dart';
import 'package:idnstd/src/profile/domain/usecases/change_language.dart';
import 'package:idnstd/src/profile/presentation/cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> authInit() async {
  final prefs = await SharedPreferences.getInstance();
  sl
    ..registerFactory(() => ProfileCubit(
      saveUserProfile: sl(),
      saveSessionInfo: sl(),
      changeLanguage: sl(),
      getCurrentUser: sl(),
    ))
    ..registerLazySingleton(() => ChangeLanguage(sl()))
    ..registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(sl()))
    ..registerLazySingleton<ProfileDataSource>(() => ProfileDataSource(sl()))

    ..registerFactory(() => AuthCubit(
      login: sl(),
      getCurrentUser: sl(),
      saveSessionInfo: sl(),
      getMyNetworks: sl(),
      getByNetworks: sl(),
      getSSOData: sl(),
      getForCurrentUser: sl(),
    ))
    ..registerLazySingleton(() => SaveUserProfile(sl()))
    ..registerLazySingleton(() => SaveSessionInfo(sl()))
    ..registerLazySingleton(() => LoadSessionInfo(sl()))
    ..registerLazySingleton(() => Login(sl()))
    ..registerLazySingleton(() => GetCurrentUser(sl()))
    ..registerLazySingleton(() => GetMyNetworks(sl()))
    ..registerLazySingleton(() => GetByNetworks(sl()))
    ..registerLazySingleton(() => GetSSOData(sl()))
    ..registerLazySingleton(() => GetForCurrentUser(sl()))
    ..registerLazySingleton<LocalSessionRepo>(() => LocalSessionRepoImpl(sl()))
    ..registerLazySingleton<SessionInfoLocalDataSrc>(() => SessionInfoLocalDataSrcImpl(sl()))
    ..registerLazySingleton<AuthRepo>(() => AuthRepoImpl(sl()))
    ..registerLazySingleton<AuthDataSource>(() => AuthRemoteDataSource(sl()))
    ..registerLazySingleton<EntryCenterGateRepo>(() => EntryCenterGateRepoImpl(sl()))
    ..registerLazySingleton<EntryCenterGateDataSource>(() => EntryCenterGateRemoteDataSource(sl()))
    ..registerLazySingleton<EntryCenterGateRemoteDataSource>(() => EntryCenterGateRemoteDataSource(sl()))
    ..registerLazySingleton(() => prefs)
    ..registerLazySingleton(http.Client.new);
}

Future<void> onboardingInit() async {
  sl
    ..registerFactory(() => OnboardingScreenCubit(
        cacheFirstTimer: sl(), checkIfUserIsFirstTimer: sl()))
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
    ..registerLazySingleton<OnboardingScreenRepo>(
            () => OnBoardingScreenRepoImpl(sl()))
    ..registerLazySingleton<OnboardingScreenLocalDataSource>(
            () => OnBoardingScreenLocalDataSrcImpl(sl()));
}