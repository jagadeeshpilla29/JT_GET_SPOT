import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_spot/presentation/cubit/authentication/signin/sigin_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/login/trigger_otp_cubit.dart';
import 'package:pinput/pinput.dart';
import 'package:get_spot/components/custom_button.dart';

// ignore: must_be_immutable
class OtpScreen extends StatelessWidget {
  final TextEditingController otpFieldController = TextEditingController();
  final FocusNode focusNode = FocusNode();
  String otpValue = '';
  final String otp;
  final String mobileNumber;

  OtpScreen({super.key, required this.mobileNumber, required this.otp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Enter OTP',
          style: TextStyle(fontSize: 24, color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20), 
            Center(
              child: Image.asset(
                'assets/images/messageBox.png',
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.7,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20), 
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'We have sent OTP on your mobile: +91 $mobileNumber',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Text(
                      'OTP: $otp',
                      style: const TextStyle(color: Colors.grey, fontSize: 16, fontStyle: FontStyle.normal),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(child: _otpInput(context)),
                  const SizedBox(height: 32),
                  CustomButton(
                    buttonText: 'Continue',
                    onPressed: () {
                      final signInCubit = context.read<SignInCubit>();
                      signInCubit.SignIn(context, mobileNumber, otpFieldController.text);
                    },
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        final triggerOtpCubit = context.read<TriggerOtpCubit>();
                        triggerOtpCubit.fetchOtp(context, mobileNumber);
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: "Didn't receive an OTP? ",
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Resend OTP',
                              style: TextStyle(color: Color(0xFFE3B54A)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _otpInput(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Pinput(
          length: 6,
          focusNode: focusNode,
          controller: otpFieldController,
          onChanged: (val) {
            otpValue = val;
          },
          onCompleted: (val) {
            final signInCubit = context.read<SignInCubit>();
            signInCubit.SignIn(context, mobileNumber, otpFieldController.text);
          },
          obscureText: false,
          defaultPinTheme: PinTheme(
            width: 45,
            height: 45,
            textStyle: const TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFE3B54A)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      );
}
