class TriggerOtpModel {
  String? message;
  String? status;
  Data? data;

  TriggerOtpModel({this.message, this.status, this.data});

  TriggerOtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? otpType;
  String? creationTime;
  String? otp;

  Data({this.id, this.otpType, this.creationTime, this.otp});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    otpType = json['otpType'];
    creationTime = json['creationTime'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['otpType'] = otpType;
    data['creationTime'] = creationTime;
    data['otp'] = otp;
    return data;
  }
}
