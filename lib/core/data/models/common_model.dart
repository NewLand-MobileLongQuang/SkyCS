class CommonModel <T> {
  CommonModel({
    required this.strTId,
    required this.strAppTId,
    required this.objTTime,
    required this.strType,
    required this.strErrCode,
    required this.objResult,
  });

  factory CommonModel.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic) create,
  ) {
    return CommonModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']),
    );
  }

  factory CommonModel.fromJsonClient(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return CommonModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']['Data']['Sys_User']),
    );
  }

  factory CommonModel.fromJsonObjDataList(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return CommonModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']['DataList']),
    );
  }

  factory CommonModel.fromJsonObjData(
      Map<String, dynamic> json,
      T Function(dynamic) create,
      ) {
    return CommonModel(
      strTId: json['_strTId'] as String? ?? '',
      strAppTId: json['_strAppTId'] as String? ?? '',
      objTTime: json['_objTTime'] as String? ?? '',
      strType: json['_strType'] as String? ?? '',
      strErrCode: json['_strErrCode'] as String? ?? '',
      objResult: create(json['_objResult']['Data']),
    );
  }

  final String strTId;
  final String strAppTId;
  final String objTTime;
  final String strType;
  final String strErrCode;
  final T? objResult;
  List<T> getDataList<T>(T Function(dynamic) fromMap) {
    final dataList = objResult as List<dynamic>? ?? [];
    return dataList.map(fromMap).toList();
  }
}