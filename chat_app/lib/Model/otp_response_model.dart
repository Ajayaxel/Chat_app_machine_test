class OtpResponseModel {
  final int? data;
  final bool status;
  final String message;

  OtpResponseModel({
    this.data,
    required this.status,
    required this.message,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      data: json['data'],
      status: json['status'] ?? false,
      message: json['message'] ?? 'Unknown error occurred',
    );
  }
}

class OtpRequestModel {
  final String phone;

  OtpRequestModel({required this.phone});

  Map<String, dynamic> toJson() {
    return {
      "data": {
        "type": "registration_otp_codes",
        "attributes": {
          "phone": phone
        }
      }
    };
  }
}