import 'package:get_spot/domain/entity/authentication/trigger_otp_entity.dart';

abstract class TriggerOtpRepository {
  Future<TriggerOtpEntity> getOtp(String mobileNumber);
}
