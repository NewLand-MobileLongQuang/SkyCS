import 'package:idnstd/core/common/app/entities/session_info.dart';
import 'package:idnstd/core/configs/app_config.dart';
import 'package:idnstd/core/data/datasource/base/base_remote_data_source.dart';
import 'package:idnstd/core/data/models/common_model.dart';
import 'package:idnstd/core/errors/exceptions.dart';
import 'package:idnstd/core/utils/string_generate.dart';
import 'package:idnstd/core/utils/typedef.dart';
import 'package:idnstd/src/auth/data/models/data_user_model.dart';
import 'package:idnstd/src/e_service/advanced_search/data/models/adsearch_model.dart';
import 'package:idnstd/src/e_service/customer_manage/data/models/es_customer_model.dart';
import 'package:idnstd/src/e_service/customer_manage/data/models/rt_es_customer_detail_model.dart';
import 'package:idnstd/src/e_service/customer_manage/data/models/rt_es_file_upload_model.dart';
import 'package:idnstd/src/e_service/guarantee_manage/data/models/es_warranty_detail_model.dart';
import 'package:idnstd/src/e_service/guarantee_manage/data/models/rt_es_warranty_activate_by_qr_model.dart';
import 'package:idnstd/src/e_service/guarantee_manage/data/models/rt_es_warranty_detail_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_detail_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_error_type_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/es_ro_product_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/rt_es_ro_detail_model.dart';
import 'package:idnstd/src/e_service/repair_manage/data/model/rt_es_ro_error_component_model.dart';

class EServiceSvDataSource extends BaseRemoteDataSource {
  EServiceSvDataSource(super.client);

  @override
  String get baseUrl {
    final ss = SessionInfo.current();
    return ss.solutionAPI;
  }

  //Other

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

  Future<CommonModel<RT_ES_FileUploadModel>> postUploadFile({required String path, DataMap? params, required String filePath}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeadersAndFile(
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
        filePath: filePath);
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjData(
        response['Data'] as DataMap,
            (data) => RT_ES_FileUploadModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  // Customer

  Future<CommonModel<List<ES_CustomerModel>>> postSearchCustomer({required String path, DataMap? params}) async {
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
            (data) => (data as List).map((e) => ES_CustomerModel.fromMap(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<ES_CustomerModel>> postCreateCustomer({required String path, DataMap? params}) async {
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
            (data) => ES_CustomerModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  Future<CommonModel<String>> postGetCustomerCodeSys({required String path, DataMap? params}) async {
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
            (data) => data as String,
      );
      return res;
    }
  }

  Future<CommonModel<RT_ESCustomerDetailModel>> postGetByCustomerCodeSys({required String path, DataMap? params}) async {
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
            (data) => RT_ESCustomerDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  // Warranty

  Future<CommonModel<List<ES_WarrantyDetailModel>>> postSearchWarranty({required String path, DataMap? params}) async {
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
        (data) => (data as List).map((e) => ES_WarrantyDetailModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<RT_ES_WarrantyDetailModel>> postGetByWarrantyNo({required String path, DataMap? params}) async {
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
        (data) => RT_ES_WarrantyDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  Future<CommonModel<MDMetaColGroupSpecSearchModel>> postGetaAdvancedSearch({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = {
      "Data": {
        "_strTId": "01760b76-7fab-43bf-b41c-849779d5e973",
        "_strAppTId": "39dcc024-048c-4022-8a20-3adfe94d1ddc",
        "_objTTime": "2024-06-26 16:35:36.970",
        "_strType": "MDMetaColGroupSpecSearch",
        "_strErrCode": "0",
        "_objResult": {
          "PageIndex": 0,
          "PageSize": 1000,
          "PageCount": 1,
          "ItemCount": 4,
          "DataList": [
            {
              "OrgID": "7206207001",
              "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
              "ColCodeSys": "C003",
              "NetworkID": "7206207001",
              "ColOperatorType": "EQUAL",
              "OrderIdx": 14,
              "JsonRenderParams": null,
              "JsonListOption": null,
              "FlagIsNotNull": "0",
              "FlagIsCheckDuplicate": "0",
              "FlagIsQuery": "0",
              "FlagActive": "1",
              "LogLUDTimeUTC": "2024-06-03 03:51:40",
              "LogLUBy": "0317844394@INOS.VN",
              "ColCode": "C002",
              "ColCaption": "Quy mô nhân sự",
              "ColDataType": "SELECTONEDROPDOWN",
              "FlagIsColDynamic": "1",
              "SqlOperatorType": "=",
              "mdmc_JsonListOption": "[{\"Value\":\"Dưới 10\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":0},{\"Value\":\"Từ 10 - 100 \",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":1},{\"Value\":\"Từ 100 - 200\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":2},{\"Value\":\"Từ 200 - 1000\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":3},{\"Value\":\"Trên 1000\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":4}]",
              "Lst_MD_OptionValue": null
            },
            {
              "OrgID": "7206207001",
              "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
              "ColCodeSys": "C005",
              "NetworkID": "7206207001",
              "ColOperatorType": "LIKE",
              "OrderIdx": 21,
              "JsonRenderParams": null,
              "JsonListOption": null,
              "FlagIsNotNull": "0",
              "FlagIsCheckDuplicate": "0",
              "FlagIsQuery": "0",
              "FlagActive": "1",
              "LogLUDTimeUTC": "2024-06-03 03:51:40",
              "LogLUBy": "0317844394@INOS.VN",
              "ColCode": "C004",
              "ColCaption": "Chức vụ",
              "ColDataType": "TEXT",
              "FlagIsColDynamic": "1",
              "SqlOperatorType": "like",
              "mdmc_JsonListOption": "[]",
              "Lst_MD_OptionValue": null
            },
            {
              "OrgID": "7206207001",
              "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
              "ColCodeSys": "C007",
              "NetworkID": "7206207001",
              "ColOperatorType": "EQUAL",
              "OrderIdx": 7,
              "JsonRenderParams": null,
              "JsonListOption": null,
              "FlagIsNotNull": "0",
              "FlagIsCheckDuplicate": "0",
              "FlagIsQuery": "0",
              "FlagActive": "1",
              "LogLUDTimeUTC": "2024-06-03 03:51:40",
              "LogLUBy": "0317844394@INOS.VN",
              "ColCode": "C006",
              "ColCaption": "Giới tính",
              "ColDataType": "SELECTONERADIO",
              "FlagIsColDynamic": "1",
              "SqlOperatorType": "=",
              "mdmc_JsonListOption": "[{\"Value\":\"Male\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":0},{\"Value\":\"Female\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":1},{\"Value\":\"Other\",\"IsSelected\":false,\"id\":\"\",\"OrderIdx\":2},{\"Value\":\" \",\"IsSelected\":true,\"id\":\"\",\"OrderIdx\":3}]",
              "Lst_MD_OptionValue": null
            },
            {
              "OrgID": "7206207001",
              "ColGrpCodeSys": "COLGRPCODESYS.2023.01",
              "ColCodeSys": "C009",
              "NetworkID": "7206207001",
              "ColOperatorType": "RANGE",
              "OrderIdx": 9,
              "JsonRenderParams": null,
              "JsonListOption": null,
              "FlagIsNotNull": "0",
              "FlagIsCheckDuplicate": "0",
              "FlagIsQuery": "0",
              "FlagActive": "1",
              "LogLUDTimeUTC": "2024-06-03 03:51:40",
              "LogLUBy": "0317844394@INOS.VN",
              "ColCode": "C008",
              "ColCaption": "Ngày sinh",
              "ColDataType": "DATE",
              "FlagIsColDynamic": "1",
              "SqlOperatorType": "=>;<=",
              "mdmc_JsonListOption": "[]",
              "Lst_MD_OptionValue": null
            }
          ]
        },
        "_dicExcs": {},
        "_dicDebug": {}
      }
    };
    if(response == null){
      throw const ApiException(Message: 'No data');
    } else {
      final res = CommonModel.fromJsonObjDataList(
        response['Data']! as DataMap,
            (data) => MDMetaColGroupSpecSearchModel.fromMap(data as DataMap),
      );
      return res;
    }
  }

  Future<CommonModel<void>> postChange({required String path, DataMap? params}) async {
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
      throw const ApiException(Message: 'Success');
    }
  }

  Future<CommonModel<List<RT_ES_WarrrantyActivateByQRModel>>> postGetInputBySerialNo({required String path, DataMap? params}) async {
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
            (data) => (data as List).map((e) => RT_ES_WarrrantyActivateByQRModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<RT_ES_WarrantyDetailModel?>> postCreate({required String path, DataMap? params}) async {
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
      if(response['Data']['_strErrCode'] != '0'){
        return CommonModel.fromJsonObjData(
          response['Data'] as DataMap,
              (data) => null,
        );
      }
      final res = CommonModel.fromJsonObjData(
        response['Data'] as DataMap,
            (data) => RT_ES_WarrantyDetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  // RO

  Future<CommonModel<List<ES_RODetailModel>>> postSearchRO({required String path, DataMap? params}) async {
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
            (data) => (data as List).map((e) => ES_RODetailModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<RT_ES_RODetailModel>> postGetByRONo({required String path, DataMap? params}) async {
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
            (data) => RT_ES_RODetailModel.fromJson(data as DataMap),
      );
      return res;
    }
  }

  Future<CommonModel<List<ES_ROErrorTypeModel>>> postSearchErrorType({required String path, DataMap? params}) async {
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
            (data) => (data as List).map((e) => ES_ROErrorTypeModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<List<ES_ROProductModel>>> postSearchProduct({required String path, DataMap? params}) async {
    final ss = SessionInfo.current();
    final response = await doPostWithHeaders(
      path: path,
      headers: {
        'Authorization': 'Bearer ${ss.auth.AccessToken}' ?? '',
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
            (data) => (data as List).map((e) => ES_ROProductModel.fromJson(e as DataMap)).toList(),
      );
      return res;
    }
  }

  Future<CommonModel<RT_ES_ROErrorComponentModel>> postSearchErrorComponent({required String path, DataMap? params}) async {
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
            (data) => RT_ES_ROErrorComponentModel.fromJson(data as DataMap),
      );
      return res;
    }
  }
}