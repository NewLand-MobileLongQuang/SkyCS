import 'package:get_it/get_it.dart';
import 'package:idnstd/core/configs/app_config_base.dart';

import '../services/injection_container.dart';

enum AppEnviroments{
  development, production
}
class AppConfig
{
  static AppConfigValuesBase current() {

 //   final sl = GetIt.instance;
    return sl<AppConfigValuesBase>();
  }


}