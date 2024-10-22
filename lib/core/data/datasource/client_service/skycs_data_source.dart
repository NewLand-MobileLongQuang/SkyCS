import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/data/datasource/base/base_remote_data_source.dart';
import 'package:idnstd/core/data/models/common_model.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/rt_sky_customer_all_detail_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/rt_sky_customer_type_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_column_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_contact_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_detail_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_group_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_hist_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_info_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_partner_type_model.dart';
import 'package:idnstd/src/sky_cs/customer/data/models/sky_customer_zalo_user_model.dart';

class SkyCSSvDataSource extends BaseRemoteDataSource{
  SkyCSSvDataSource(super.client);

  @override
  String get baseUrl {
    final ss = SessionInfo.current();
    return ss.solutionAPI;
  }

  // create customer

  Future<CommonModel<List<SKY_CustomerGroupModel>>> postSearchGroup({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerGroupModel.fromMap(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<List<SKY_CustomerColumnModel>>> postSearchColumn({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerColumnModel.fromMap(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<List<SKY_CustomerColumnModel>>> postGetListOption({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerColumnModel.fromMap(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<String>> postCreateCustomerSkyCS({required String path, DataMap? params}) async {
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
      params: params,
    );
    print("CHECK RESSPONSE $response");
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {

      final res = CommonModel.fromJsonObjData(
        response['Data'] as DataMap,
              (data) => data as String
      );
      return res;
    }
  }

  Future<CommonModel<RT_SKY_CustomerTypeModel>> postGetAllCustomerType({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjData(
          response['Data'] as DataMap,
            (data) => RT_SKY_CustomerTypeModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  Future<CommonModel<List<SKY_CustomerPartnerTypeModel>>> postGetAllCustomerPartnerType({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerPartnerTypeModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<List<SKY_CustomerZaloUserModel>>> postSearchZaloUser({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjData(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerZaloUserModel.fromJson(e as DataMap)).toList(),
      );

      return res;
    }
  }

  // manage customer
  Future<CommonModel<List<SKY_CustomerInfoModel>>> postSearchCustomer({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerInfoModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<SKY_CustomerDetailModel>> postGetByCustomerCodeSys({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjData(
        response['Data'] as DataMap,
            (data) => SKY_CustomerDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  Future<CommonModel<List<SKY_CustomerHistModel>>> postSearchCustomerHist({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerHistModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<List<SKY_CustomerContactModel>>> postSearchCustomerContact({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data'] as DataMap,
            (data) => (data as List).map((e) => SKY_CustomerContactModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<RT_SKY_CustomerAllDetailModel>> postGetAllByCustomerCodeSys({required String path, DataMap? params}) async {
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
      params: params,
    );
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjData(
        response['Data'] as DataMap,
            (data) => RT_SKY_CustomerAllDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

}