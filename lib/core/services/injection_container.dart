import 'package:get_it/get_it.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/configs/app_config_base.dart';
import 'package:idnstd/core/configs/app_config_dev.dart';
import 'package:idnstd/core/configs/app_config_production.dart';
import 'package:idnstd/core/services/injection/auth_injection.dart';
import 'package:idnstd/core/services/injection/e_service_injection.dart';
import 'package:idnstd/core/services/injection/sky_cs_injection.dart';

final sl = GetIt.instance;

Future<void> init(AppEnviroments env) async {
  if (env == AppEnviroments.development) {
    sl.registerLazySingleton<AppConfigValuesBase>(AppConfigValuesDev.new);
  }
  else if (env == AppEnviroments.production) {
    sl.registerLazySingleton<AppConfigValuesBase>(AppConfigValuesProduction.new);
  }

  await authInit();
  await onboardingInit();
  await eServiceManageInit();
  await skyCSManageInit();
}

