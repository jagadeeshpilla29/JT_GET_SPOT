
import 'package:get_spot/domain/entity/authentication/trigger_otp_entity.dart';
import 'package:get_spot/domain/repository/authentication/trigger_otp_repository.dart';

class TriggerOtpValidationUseCase {
  final TriggerOtpRepository repository;

  TriggerOtpValidationUseCase({required this.repository});

  Future<TriggerOtpEntity> call(String mobileNumber) async {
    return await repository.getOtp(mobileNumber);
  }
}
