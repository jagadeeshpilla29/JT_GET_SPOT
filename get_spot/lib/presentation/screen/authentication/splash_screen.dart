import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_spot/core/constants/bottomTab.dart';
import 'package:get_spot/core/constants/colors.dart';
import 'package:get_spot/core/injection.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_state.dart';
import 'package:get_spot/presentation/screen/authentication/splash_login_screen.dart';
import 'package:get_spot/presentation/screen/authentication/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    _selectedIndex = index;
  } 
  
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CurrentCustomerCubit>().GetCurrentCustomer();
    context.read<CurrentCustomerCubit>().startTimer();
    _checkSession(context);
  }

  _checkSession(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('TOKEN') ?? '';
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (token.isNotEmpty) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomTab()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SplashLoginScreen()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CurrentCustomerCubit>(),
      child: BlocListener<CurrentCustomerCubit, CurrentCustomerState>(
        listener: (context, state) {
          if (state is CurrentCustomerLoaded) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          } else if (state is CurrentCustomerError) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SplashLoginScreen()),
            );
          }
        },
        child: Scaffold(
          backgroundColor:AppColor.PrimaryColor, 
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.graphic_eq,
                  size: 100, 
                  color: AppColor.Black,
                ),
             Text(
                  "getspot",
                  style: TextStyle(
                    fontSize: 60, 
                    fontWeight: FontWeight.bold,
                    color:AppColor.Black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
