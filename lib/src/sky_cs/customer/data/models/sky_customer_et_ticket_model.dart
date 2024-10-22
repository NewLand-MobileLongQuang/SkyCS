import 'package:idnstd/src/sky_cs/customer/domain/entities/sky_customer_et_ticket.dart';

class SKY_CustomerETTicketModel extends SKY_CustomerETTicket {
  const SKY_CustomerETTicketModel({required super.ETScrTplCodeSys, required super.TicketID, required super.OrgID, required super.NetworkID, required super.TicketStatus, required super.CustomerCodeSys, required super.TicketName, required super.TicketDetail, required super.AgentCode, required super.DepartmentCode, required super.TicketType, required super.TicketDeadline, required super.TicketPriority, required super.TicketJsonInfo, required super.ReceptionDTimeUTC, required super.TicketCustomType, required super.TicketSource, required super.ReceptionChannel, required super.ContactChannel, required super.Tags, required super.SLAID, required super.RemindWork, required super.TicketEvaluate, required super.RemindDTimeUTC, required super.ChannelId, required super.MsgDTime, required super.Description, required super.CreateDTimeUTC, required super.CreateBy, required super.LUDTimeUTC, required super.LUBy, required super.ProcessDTimeUTC, required super.ProcessBy, required super.CloseDTimeUTC, required super.CloseBy, required super.LogLUDTimeUTC, required super.LogLUBy, required super.AgentTicketStatusName, required super.CustomerTicketStatusName, required super.AgentName, required super.CustomerName, required super.CustomerCode, required super.AgentTicketPriorityName, required super.CustomerTicketPriorityName, required super.DepartmentName, required super.AgentTicketCustomTypeName, required super.CustomerTicketCustomTypeName, required super.AgentTicketSourceName, required super.CustomerTicketSourceName, required super.AgentReceptionChannelName, required super.CustomerReceptionChannelName, required super.AgentTicketTypeName, required super.CustomerTicketTypeName, required super.AgentContactChannelName, required super.CustomerContactChannelName, required super.SLALevel, required super.NNTFullName, required super.ProcessTime, required super.TicketWarning, required super.DTimeSys, required super.FirstResTime, required super.FistTicketMessage, required super.ResolutionTime, required super.CustomerPhoneNo, required super.CustomerEmail, required super.ZaloUserFollowerId, required super.ListFollowerAgentCode, required super.ListFollowerAgentName, required super.ScrTplCreateCodeSys, required super.ScrTplDetailCodeSys, required super.CustomerDateOfBirth, required super.PhoneNoUseService, required super.IdentityPaper, required super.IdentityPaperDate, required super.AccountNumber, required super.TicketPhoneNo, required super.OrgIDCreate, required super.DepartmentCodeCreate, required super.AgentCodePrevious, required super.DepartmentCodePrevious, required super.OrgIDPrevious, required super.AgentNameCreate, required super.DepartmentNameCreate, required super.NNTFullNameCreate, required super.AgentNamePrevious, required super.DepartmentNamePrevious, required super.NNTFullNamePrevious});

  factory SKY_CustomerETTicketModel.fromJson(Map<String, dynamic> json) {
    return SKY_CustomerETTicketModel(
      ETScrTplCodeSys: json['ETScrTplCodeSys'] as String? ?? '',
      TicketID: json['TicketID'] as String? ?? '',
      OrgID: json['OrgID'] as String? ?? '',
      NetworkID: json['NetworkID'] as String? ?? '',
      TicketStatus: json['TicketStatus'] as String? ?? '',
      CustomerCodeSys: json['CustomerCodeSys'] as String? ?? '',
      TicketName: json['TicketName'] as String? ?? '',
      TicketDetail: json['TicketDetail'] as String? ?? '',
      AgentCode: json['AgentCode'] as String? ?? '',
      DepartmentCode: json['DepartmentCode'] as String? ?? '',
      TicketType: json['TicketType'] as String? ?? '',
      TicketDeadline: json['TicketDeadline'] as String? ?? '',
      TicketPriority: json['TicketPriority'] as String? ?? '',
      TicketJsonInfo: json['TicketJsonInfo'] as String? ?? '',
      ReceptionDTimeUTC: json['ReceptionDTimeUTC'] as String? ?? '',
      TicketCustomType: json['TicketCustomType'] as String? ?? '',
      TicketSource: json['TicketSource'] as String? ?? '',
      ReceptionChannel: json['ReceptionChannel'] as String? ?? '',
      ContactChannel: json['ContactChannel'] as String? ?? '',
      Tags: json['Tags'] as String? ?? '',
      SLAID: json['SLAID'] as String? ?? '',
      RemindWork: json['RemindWork'] as String? ?? '',
      TicketEvaluate: json['TicketEvaluate'] as String? ?? '',
      RemindDTimeUTC: json['RemindDTimeUTC'] as String? ?? '',
      ChannelId: json['ChannelId'] as String? ?? '',
      MsgDTime: json['MsgDTime'] as String? ?? '',
      Description: json['Description'] as String? ?? '',
      CreateDTimeUTC: json['CreateDTimeUTC'] as String? ?? '',
      CreateBy: json['CreateBy'] as String? ?? '',
      LUDTimeUTC: json['LUDTimeUTC'] as String? ?? '',
      LUBy: json['LUBy'] as String? ?? '',
      ProcessDTimeUTC: json['ProcessDTimeUTC'] as String? ?? '',
      ProcessBy: json['ProcessBy'] as String? ?? '',
      CloseDTimeUTC: json['CloseDTimeUTC'] as String? ?? '',
      CloseBy: json['CloseBy'] as String? ?? '',
      LogLUDTimeUTC: json['LogLUDTimeUTC'] as String? ?? '',
      LogLUBy: json['LogLUBy'] as String? ?? '',
      AgentTicketStatusName: json['AgentTicketStatusName'] as String? ?? '',
      CustomerTicketStatusName: json['CustomerTicketStatusName'] as String? ?? '',
      AgentName: json['AgentName'] as String? ?? '',
      CustomerName: json['CustomerName'] as String? ?? '',
      CustomerCode: json['CustomerCode'] as String? ?? '',
      AgentTicketPriorityName: json['AgentTicketPriorityName'] as String? ?? '',
      CustomerTicketPriorityName: json['CustomerTicketPriorityName'] as String? ?? '',
      DepartmentName: json['DepartmentName'] as String? ?? '',
      AgentTicketCustomTypeName: json['AgentTicketCustomTypeName'] as String? ?? '',
      CustomerTicketCustomTypeName: json['CustomerTicketCustomTypeName'] as String? ?? '',
      AgentTicketSourceName: json['AgentTicketSourceName'] as String? ?? '',
      CustomerTicketSourceName: json['CustomerTicketSourceName'] as String? ?? '',
      AgentReceptionChannelName: json['AgentReceptionChannelName'] as String? ?? '',
      CustomerReceptionChannelName: json['CustomerReceptionChannelName'] as String? ?? '',
      AgentTicketTypeName: json['AgentTicketTypeName'] as String? ?? '',
      CustomerTicketTypeName: json['CustomerTicketTypeName'] as String? ?? '',
      AgentContactChannelName: json['AgentContactChannelName'] as String? ?? '',
      CustomerContactChannelName: json['CustomerContactChannelName'] as String? ?? '',
      SLALevel: json['SLALevel'] as String? ?? '',
      NNTFullName: json['NNTFullName'] as String? ?? '',
      ProcessTime: json['ProcessTime'] as String? ?? '',
      TicketWarning: json['TicketWarning'] as String? ?? '',
      DTimeSys: json['DTimeSys'] as String? ?? '',
      FirstResTime: json['FirstResTime'] as double? ?? 0.0,
      FistTicketMessage: json['FistTicketMessage'] as String? ?? '',
      ResolutionTime: json['ResolutionTime'] as double? ?? 0.0,
      CustomerPhoneNo: json['CustomerPhoneNo'] as String? ?? '',
      CustomerEmail: json['CustomerEmail'] as String? ?? '',
      ZaloUserFollowerId: json['ZaloUserFollowerId'] as String? ?? '',
      ListFollowerAgentCode: json['ListFollowerAgentCode'] as String? ?? '',
      ListFollowerAgentName: json['ListFollowerAgentName'] as String? ?? '',
      ScrTplCreateCodeSys: json['ScrTplCreateCodeSys'] as String? ?? '',
      ScrTplDetailCodeSys: json['ScrTplDetailCodeSys'] as String? ?? '',
      CustomerDateOfBirth: json['CustomerDateOfBirth'] as String? ?? '',
      PhoneNoUseService: json['PhoneNoUseService'] as String? ?? '',
      IdentityPaper: json['IdentityPaper'] as String? ?? '',
      IdentityPaperDate: json['IdentityPaperDate'] as String? ?? '',
      AccountNumber: json['AccountNumber'] as String? ?? '',
      TicketPhoneNo: json['TicketPhoneNo'] as String? ?? '',
      OrgIDCreate: json['OrgIDCreate'] as String? ?? '',
      DepartmentCodeCreate: json['DepartmentCodeCreate'] as String? ?? '',
      AgentCodePrevious: json['AgentCodePrevious'] as String? ?? '',
      DepartmentCodePrevious: json['DepartmentCodePrevious'] as String? ?? '',
      OrgIDPrevious: json['OrgIDPrevious'] as String? ?? '',
      AgentNameCreate: json['AgentNameCreate'] as String? ?? '',
      DepartmentNameCreate: json['DepartmentNameCreate'] as String? ?? '',
      NNTFullNameCreate: json['NNTFullNameCreate'] as String? ?? '',
      AgentNamePrevious: json['AgentNamePrevious'] as String? ?? '',
      DepartmentNamePrevious: json['DepartmentNamePrevious'] as String? ?? '',
      NNTFullNamePrevious: json['NNTFullNamePrevious'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ETScrTplCodeSys': ETScrTplCodeSys,
      'TicketID': TicketID,
      'OrgID': OrgID,
      'NetworkID': NetworkID,
      'TicketStatus': TicketStatus,
      'CustomerCodeSys': CustomerCodeSys,
      'TicketName': TicketName,
      'TicketDetail': TicketDetail,
      'AgentCode': AgentCode,
      'DepartmentCode': DepartmentCode,
      'TicketType': TicketType,
      'TicketDeadline': TicketDeadline,
      'TicketPriority': TicketPriority,
      'TicketJsonInfo': TicketJsonInfo,
      'ReceptionDTimeUTC': ReceptionDTimeUTC,
      'TicketCustomType': TicketCustomType,
      'TicketSource': TicketSource,
      'ReceptionChannel': ReceptionChannel,
      'ContactChannel': ContactChannel,
      'Tags': Tags,
      'SLAID': SLAID,
      'RemindWork': RemindWork,
      'TicketEvaluate': TicketEvaluate,
      'RemindDTimeUTC': RemindDTimeUTC,
      'ChannelId': ChannelId,
      'MsgDTime': MsgDTime,
      'Description': Description,
      'CreateDTimeUTC': CreateDTimeUTC,
      'CreateBy': CreateBy,
      'LUDTimeUTC': LUDTimeUTC,
      'LUBy': LUBy,
      'ProcessDTimeUTC': ProcessDTimeUTC,
      'ProcessBy': ProcessBy,
      'CloseDTimeUTC': CloseDTimeUTC,
      'CloseBy': CloseBy,
      'LogLUDTimeUTC': LogLUDTimeUTC,
      'LogLUBy': LogLUBy,
      'AgentTicketStatusName': AgentTicketStatusName,
      'CustomerTicketStatusName': CustomerTicketStatusName,
      'AgentName': AgentName,
      'CustomerName': CustomerName,
      'CustomerCode': CustomerCode,
      'AgentTicketPriorityName': AgentTicketPriorityName,
      'CustomerTicketPriorityName': CustomerTicketPriorityName,
      'DepartmentName': DepartmentName,
      'AgentTicketCustomTypeName': AgentTicketCustomTypeName,
      'CustomerTicketCustomTypeName': CustomerTicketCustomTypeName,
      'AgentTicketSourceName': AgentTicketSourceName,
      'CustomerTicketSourceName': CustomerTicketSourceName,
      'AgentReceptionChannelName': AgentReceptionChannelName,
      'CustomerReceptionChannelName': CustomerReceptionChannelName,
      'AgentTicketTypeName': AgentTicketTypeName,
      'CustomerTicketTypeName': CustomerTicketTypeName,
      'AgentContactChannelName': AgentContactChannelName,
      'CustomerContactChannelName': CustomerContactChannelName,
      'SLALevel': SLALevel,
      'NNTFullName': NNTFullName,
      'ProcessTime': ProcessTime,
      'TicketWarning': TicketWarning,
      'DTimeSys': DTimeSys,
      'FistTicketMessage': FistTicketMessage,
      'CustomerPhoneNo': CustomerPhoneNo,
      'CustomerEmail': CustomerEmail,
      'ZaloUserFollowerId': ZaloUserFollowerId,
      'ListFollowerAgentCode': ListFollowerAgentCode,
      'ListFollowerAgentName': ListFollowerAgentName,
      'ScrTplCreateCodeSys': ScrTplCreateCodeSys,
      'ScrTplDetailCodeSys': ScrTplDetailCodeSys,
      'CustomerDateOfBirth': CustomerDateOfBirth,
      'PhoneNoUseService': PhoneNoUseService,
      'IdentityPaper': IdentityPaper,
      'IdentityPaperDate': IdentityPaperDate,
      'AccountNumber': AccountNumber,
      'TicketPhoneNo': TicketPhoneNo,
      'OrgIDCreate': OrgIDCreate,
      'DepartmentCodeCreate': DepartmentCodeCreate,
      'AgentCodePrevious': AgentCodePrevious,
      'DepartmentCodePrevious': DepartmentCodePrevious,
      'OrgIDPrevious': OrgIDPrevious,
      'AgentNameCreate': AgentNameCreate,
      'DepartmentNameCreate': DepartmentNameCreate,
      'NNTFullNameCreate': NNTFullNameCreate,
      'AgentNamePrevious': AgentNamePrevious,
      'DepartmentNamePrevious': DepartmentNamePrevious,
      'NNTFullNamePrevious': NNTFullNamePrevious,
    };
  }
}