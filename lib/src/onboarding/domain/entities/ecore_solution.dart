import 'package:equatable/equatable.dart';

class EcoreSolution extends Equatable{

  const EcoreSolution({required this.Code, required this.Name, required this.Image, required this.AppUrl});

  final String Code;
  final String Name;
  final String Image;
  final String AppUrl;

  @override
  List<Object?> get props => [Code, Name, Image, AppUrl];


}