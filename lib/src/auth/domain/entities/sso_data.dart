import 'package:equatable/equatable.dart';

class SSOData extends Equatable
{

  const SSOData({required this.Data});
  final String Data;

  @override
  // TODO: implement props
  List<Object?> get props => [Data];
}