class MobileSvModel<T>{

  MobileSvModel({
    required this.Data,
    required this.Success,
    required this.ErrorMessage,
    required this.ErrorCode,
    required this.ErrorDetail,
  });

  factory MobileSvModel.fromJson(
      Map<String, dynamic> json,
      T Function(dynamic) create,
  ) {
    return MobileSvModel(
      Success: json['Success'] as bool,
      Data: create(json['Data']),
      ErrorMessage: '',
      ErrorCode: '',
      ErrorDetail: '',
    );
  }

  final T? Data;
  final bool Success;
  final String ErrorMessage;
  final String ErrorCode;
  final String ErrorDetail;
}
