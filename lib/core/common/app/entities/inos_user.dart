import 'package:equatable/equatable.dart';

class InosUser extends Equatable {

  const InosUser({
    required this.Id,
    required this.Email,
    required this.Name,
    required this.Phone,
    required this.Language,
    required this.TimeZone,
    required this.Avatar,
  });


  final int Id;
  final String Email;
  final String Name;
  final String Phone;
  final String Language;
  final int TimeZone;
  final String Avatar;

  @override

  List<Object?> get props => [Id, Name, Email, Phone, Language, TimeZone];
}
