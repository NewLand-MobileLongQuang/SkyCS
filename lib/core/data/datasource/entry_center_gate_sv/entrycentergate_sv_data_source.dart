import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/data/datasource/base/base_remote_data_source.dart';
import 'package:idnstd/core/data/models/common_model.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/data/models/data_user_model.dart';
import 'package:idnstd/src/auth/data/models/object_result_model.dart';

class EntryCenterGateSvDataSource extends BaseRemoteDataSource {
  EntryCenterGateSvDataSource(super.client);

  @override
  String get baseUrl => AppConfig.current().entryCenterGateBaseUrl;

  @override
  Map<String, String>? getHeaders() {
    return {'accessToken': SessionInfo.current().auth.AccessToken};
  }

  Future<CommonModel<List<ObjectResultModel>>> post({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final networkId = ss.org?.ParentId == 0 ? ss.org?.Id : ss.org?.ParentId;
    final response = await doPostWithHeaders(
        path: path,
        headers: {
          'NetworkId': networkId.toString(),
          'GwUserCode': AppConfig.current().gwUserCode,
          'GwPassword': AppConfig.current().gwPassword,
        },
        params: params);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJson(
        response['Data'] as DataMap,
        (data) => (data as List).map((e) => ObjectResultModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<DataUserModel>> postUser({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
        path: path,
        headers: {
          'Authorization': 'Bearer ${ss.auth.AccessToken}',
          'NetworkId': ss.org?.Id.toString() ?? '',
          'OrgId': ss.org?.Id.toString() ?? '',
          'GwUserCode': AppConfig.current().gwUserCodeSolution,
          'GwPassword': AppConfig.current().gwPasswordSolution,
          'UtcOffset': ss.user.TimeZone.toString(),
          'AppAgent': AppConfig.current().appAgent,
          'AppLanguageCode': ss.user.Language,
          'AppVerCode': AppConfig.current().appVerCode,
          'Tid': StringGenerate.getCurrentTime(),
          'AppTId': StringGenerate.getCurrentTime(),
        },
        params: params);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonClient(
        response['Data'] as DataMap,
        (data) => DataUserModel.fromMap(data as DataMap),
      );
      return res;
    }
  }
}