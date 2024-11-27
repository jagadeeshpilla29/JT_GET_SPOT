import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get_spot/core/constants/api_constants.dart';
import 'package:get_spot/data/model/authentication/trigger_otp_model.dart'; // Ensure you're importing the correct dio package

abstract class TriggerOtpRemoteDataSource {
  Future<TriggerOtpModel> fetchOtp(String mobileNumber);
}

class TriggerOtpRemoteDataSourceImpl implements TriggerOtpRemoteDataSource {
  final Dio client;

  TriggerOtpRemoteDataSourceImpl({required this.client});

  @override
  Future<TriggerOtpModel> fetchOtp(String mobileNumber) async {
    final payload = {
      "otpType": "SIGNIN",
      "primaryContact": mobileNumber,
    };

    try {
      final response = await client.post(
        TriggerOtp,
        data: json.encode(payload),
      );

      if (response.statusCode == 200) {
        return TriggerOtpModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load OTP data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load OTP data: ${e.toString()}');
    }
  }
}
