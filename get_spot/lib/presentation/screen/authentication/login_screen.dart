import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_spot/components/custom_button.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/injection.dart';
import 'package:get_spot/presentation/cubit/authentication/login/trigger_otp_cubit.dart';
import 'package:get_spot/presentation/screen/authentication/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController mobileNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TriggerOtpCubit>(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.White,
          // leading: IconButton(
          //   icon: const Icon(Icons.arrow_back),
          //   onPressed: () {
          //     Navigator.pop(context);
          //   },
          // ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: AppColor.White,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  'Hello Again!',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Welcome back you\'ve been ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.grey),
                ),
              ),
              const Center(
                child: Text(
                  ' missed',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.grey),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  counterText: '',
                  fillColor: AppColor.White2,
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Phone Number',
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(
                        8.0), 
                    child: Image.asset(
                      'assets/images/phone.png',
                      width: 50,
                      height: 50,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16, 
                    horizontal: 16, 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 30),
              CustomButton(
                buttonText: 'Login',
                onPressed: () {
                  final triggerOtpCubit = context.read<TriggerOtpCubit>();
                  triggerOtpCubit.fetchOtp(
                      context, mobileNumberController.text);
                },
              ),
              SizedBox(
                height: 16,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder:  (context) =>  SignupScreen()));
                    // final triggerOtpCubit = context.read<TriggerOtpCubit>();
                    // triggerOtpCubit.fetchOtp(context, mobileNumber);
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Didn't have account? ",
                      style: TextStyle(color: AppColor.Black, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Signup',
                          style: TextStyle(color: AppColor.PrimaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
