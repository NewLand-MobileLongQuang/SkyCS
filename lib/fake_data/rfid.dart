import 'package:idnstd/fake_data/qr_code.dart';

class RFID {
  final String id;
  final String code;
  final DateTime time;

  RFID({required this.id, required this.code, required this.time});

  static List<RFID> listRFID = [
    RFID(id: '1', code: 'RFID01', time: QrCode.toDateTime('08:00:00.000')),
    RFID(id: '2', code: 'RFID02', time: QrCode.toDateTime('08:00:02.001')),
    RFID(id: '3', code: 'RFID03', time: QrCode.toDateTime('08:00:03.800')),


    RFID(id: '7', code: 'RFID07', time: QrCode.toDateTime('08:00:12.000')),
    RFID(id: '8', code: 'RFID08', time: QrCode.toDateTime('08:00:14.000')),

    RFID(id: '13', code: 'RFID13', time: QrCode.toDateTime('08:00:22.000')),
    RFID(id: '14', code: 'RFID14', time: QrCode.toDateTime('08:00:24.010')),
    RFID(id: '15', code: 'RFID15', time: QrCode.toDateTime('08:00:26.900')),

    RFID(id: '19', code: 'RFID19', time: QrCode.toDateTime('08:00:36.000')),
    RFID(id: '20', code: 'RFID20', time: QrCode.toDateTime('08:00:38.010')),
    RFID(id: '21', code: 'RFID21', time: QrCode.toDateTime('08:00:39.900')),
    RFID(id: '22', code: 'RFID22', time: QrCode.toDateTime('08:00:40.000')),
    RFID(id: '23', code: 'RFID23', time: QrCode.toDateTime('08:00:40.010')),
  ];
}