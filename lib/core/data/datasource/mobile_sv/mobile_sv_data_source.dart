import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/data/datasource/base/base_remote_data_source.dart';
import 'package:idnstd/core/data/models/common_model.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/data/models/auth_result.dart';
import 'package:idnstd/src/auth/data/models/data_user_model.dart';
import 'package:idnstd/src/auth/data/models/inos_user_model.dart';
import 'package:idnstd/src/auth/data/models/org_model.dart';

import '../../../configs/app_config.dart';
import '../../models/mobilesv_model.dart';

class MobileSvDataSource extends BaseRemoteDataSource {
  const MobileSvDataSource(super._client);

  @override
  String get baseUrl => AppConfig.current().mobileServiceBaseUrl;

  @override
  Map<String, String>? getHeaders() {
    return {'accessToken': SessionInfo.current().auth.AccessToken};
  }

  Future<CommonModel<DataUserModel>> post({required String path, DataMap? params}) async {
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

  Future<MobileSvModel<AuthResultModel>> postAuth({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();

    final response = await doPostWithHeaders(
        path: path,
        headers: {
          'accessToken': ss.isAuthenticated() ? ss.auth.AccessToken : ''
        },
        params: params);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = MobileSvModel.fromJson(
        response as DataMap,
            (data) => AuthResultModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  Future<MobileSvModel<UserModel>> postUser({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();

    final response = await doPostWithHeaders(
        path: path,
        headers: {
          'accessToken': ss.isAuthenticated() ? ss.auth.AccessToken : ''
        },
        params: params);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = MobileSvModel.fromJson(
        response as DataMap,
            (data) => UserModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  Future<MobileSvModel<List<OrgModel>>> postList({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();

    final response = await doPostWithHeaders(
        path: path,
        headers: {
          'accessToken': ss.isAuthenticated() ? ss.auth.AccessToken : ''
        },
        params: params);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = MobileSvModel.fromJson(
        response as DataMap,
            (data) => (data as List).map((e) => OrgModel.fromMap(e as DataMap)).toList(),
      );
      return res;
    }
  }
}
