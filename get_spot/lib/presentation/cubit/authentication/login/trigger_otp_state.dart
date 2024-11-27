
import 'package:get_spot/domain/entity/authentication/trigger_otp_entity.dart';

abstract class TriggerOtpState {}

class TriggerOtpInitial extends TriggerOtpState {}

class TriggerOtpLoading extends TriggerOtpState {}

class TriggerOtpLoaded extends TriggerOtpState {
  final TriggerOtpEntity triggerOtpEntity;
  TriggerOtpLoaded(this.triggerOtpEntity);
}

class TriggerOtpError extends TriggerOtpState {
  final String message;
  TriggerOtpError(this.message);
}
