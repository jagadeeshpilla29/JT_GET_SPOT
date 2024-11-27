import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_spot/domain/usecase/authentication/trigger_otp_usecase.dart';
import 'package:get_spot/presentation/cubit/authentication/login/trigger_otp_state.dart';
import 'package:get_spot/presentation/screen/authentication/otp_screen.dart';


class TriggerOtpCubit extends Cubit<TriggerOtpState> {
  final TriggerOtpValidationUseCase useCase;

  TriggerOtpCubit({required this.useCase}) : super(TriggerOtpInitial());

  Future<void> fetchOtp(BuildContext context, String mobileNumber) async {
    if (mobileNumber.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter a mobile number'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    } else if (mobileNumber.length < 10) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please enter valid mobile number'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    } else {
      try {
        emit(TriggerOtpLoading());
        final otpEntity = await useCase(mobileNumber);
        emit(TriggerOtpLoaded(otpEntity));
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OtpScreen(
                    mobileNumber: mobileNumber,
                    otp: otpEntity.data!.otp!,
                  )),
        );
        print('OTP response received and stored in state');
      } catch (e) {
        emit(TriggerOtpError('Failed to load OTP data: ${e.toString()}'));
      }
    }
  }
}
