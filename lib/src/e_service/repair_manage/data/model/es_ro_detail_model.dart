import 'package:idnstd/src/e_service/repair_manage/domain/entities/es_ro_detail.dart';

class ES_RODetailModel extends ES_RODetail {
  ES_RODetailModel({required super.RONo, required super.OrgID, required super.NetworkID, required super.CustomerCodeSys, required super.CustomerName, required super.CustomerPhoneNo, required super.CustomerAddress, required super.CustomerAvatarPath, required super.ReceptionDTimeUTC, required super.AgentCode, required super.RODesc, required super.Deadline, required super.ROStatus, required super.ProductCode, required super.SerialNo, required super.FactoryCode, required super.ErrorTypeCode, required super.AppointmentDTimeUTC, required super.CreateDTimeUTC, required super.CreateBy, required super.Remark, required super.FinishDTimeUser, required super.FinishDTimeUTC, required super.FinishBy, required super.LUDTimeUTC, required super.LUBy, required super.LogLUDTimeUTC, required super.LogLUBy, required super.AgentName, required super.AgentAvatar, required super.ListComponentCode});

  factory ES_RODetailModel.fromJson(Map<String, dynamic> json) {
    return ES_RODetailModel(
      RONo: json['RONo'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerPhoneNo: json['CustomerPhoneNo'] as String? ?? '',
      CustomerAddress: json['CustomerAddress'] as String? ?? '',
      CustomerAvatarPath: json['CustomerAvatarPath'] as String? ?? '',
      ReceptionDTimeUTC: json['ReceptionDTimeUTC'] as String? ?? '',
      AgentCode: json['AgentCode'] as String? ?? '',
      RODesc: json['RODesc'] as String? ?? '',
      Deadline: json['Deadline'] as String? ?? '',
      ROStatus: json['ROStatus'] as String? ?? '',
      ProductCode: json['ProductCode'] as String? ?? '',
      SerialNo: json['SerialNo'] as String? ?? '',
      FactoryCode: json['FactoryCode'] as String? ?? '',
      ErrorTypeCode: json['ErrorTypeCode'] as String? ?? '',
      AppointmentDTimeUTC: json['AppointmentDTimeUTC'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      Remark: json['Remark'] as String? ?? '',
      FinishDTimeUser: json['FinishDTimeUser'] as String? ?? '',
      FinishDTimeUTC: json['FinishDTimeUTC'] as String? ?? '',
      FinishBy: json['FinishBy'] as String? ?? '',
      LUDTimeUTC: json['LUDTimeUTC'] as String? ?? '',
      LUBy: json['LUBy'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      AgentName: json['AgentName'] as String? ?? '',
      AgentAvatar: json['AgentAvatar'] as String? ?? '',
      ListComponentCode: json['ListComponentCode'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'RONo': RONo,
      'OrgID': OrgID,
      'NetworkID': NetworkID,
      'CustomerCodeSys': CustomerCodeSys,
      'CustomerName': CustomerName,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerAddress': CustomerAddress,
      'CustomerAvatarPath': CustomerAvatarPath,
      'ReceptionDTimeUTC': ReceptionDTimeUTC,
      'AgentCode': AgentCode,
      'RODesc': RODesc,
      'Deadline': Deadline,
      'ROStatus': ROStatus,
      'ProductCode': ProductCode,
      'SerialNo': SerialNo,
      'FactoryCode': FactoryCode,
      'ErrorTypeCode': ErrorTypeCode,
      'AppointmentDTimeUTC': AppointmentDTimeUTC,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateBy': CreateBy,
      'Remark': Remark,
      'FinishDTimeUser': FinishDTimeUser,
      'FinishDTimeUTC': FinishDTimeUTC,
      'FinishBy': FinishBy,
      'LUDTimeUTC': LUDTimeUTC,
      'LUBy': LUBy,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
      'AgentName': AgentName,
      'AgentAvatar': AgentAvatar,
      'ListComponentCode': ListComponentCode,
    };
  }
}