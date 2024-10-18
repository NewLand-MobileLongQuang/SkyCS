import 'package:idnstd/core/configs/app_config_base.dart';

class AppConfigValuesDev extends AppConfigValuesBase
{
  @override
  String get appId => 'igoss';

  @override
  String get appSecret => '';

  @override
  String get mobileServiceBaseUrl => 'https://devmobilesv.ecore.vn';

  @override
  String get entryCenterGateBaseUrl => r'https://devwebapi228.ecore.vn/idocNet.Test.EntryCenterGate.WA';

  @override
  String get gwPassword => 'idocNet.idn.EntryCenterGate.Sv';

  @override
  String get gwUserCode => 'idocNet.idn.EntryCenterGate.Sv';

  @override
  String get solutionCode => 'ESERVICE';

  @override
  String get appAgent => 'Mobile-eService';

  @override
  String get appVerCode => 'V1';

  @override
  String get gwPasswordSolution => 'idocNet.idn.eService.Sv';

  @override
  String get gwUserCodeSolution => 'idocNet.idn.eService.Sv';

  @override
  String get scrTplCodeSys => 'SCRTPLCODESYS.2023';
}
