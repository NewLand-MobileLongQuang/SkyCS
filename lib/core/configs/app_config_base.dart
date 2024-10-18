abstract class AppConfigValuesBase
{
  // Common
  String get solutionCode;
  // MobileServiceSv
  String get appId;
  String get appSecret;
  String get mobileServiceBaseUrl;

  // EntryCenterGateSv
  String get entryCenterGateBaseUrl;
  String get gwUserCode;
  String get gwPassword;

  // ClientServiceSv
  String get gwUserCodeSolution;
  String get gwPasswordSolution;

  String get appAgent;
  String get appVerCode;

  String get scrTplCodeSys;
}

