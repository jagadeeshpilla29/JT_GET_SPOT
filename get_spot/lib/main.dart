import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/signin/sigin_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/login/trigger_otp_cubit.dart';
import 'package:get_spot/presentation/screen/authentication/splash_screen.dart';
import 'package:get_spot/presentation/screen/profile/profile.dart';
import 'package:get_spot/presentation/screen/profile/refer_a_friend.dart';
import 'core/injection.dart' as di;

void main() {
   di.init(); 
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<TriggerOtpCubit>()),
        BlocProvider(create: (_) => di.sl<SignInCubit>()),
        BlocProvider(create: (_) => di.sl<CurrentCustomerCubit>()),
      ],
      child: MaterialApp(
        title: 'Get Spot',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
          // appBarTheme: AppBarTheme(
          //   color: Colors.white,
          //   elevation: 0,
          //   iconTheme: const IconThemeData(color: Colors.white),
          //   titleTextStyle: const TextStyle(
          //     color: Colors.white,
          //     fontSize: 20,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
        ),
        home:  ReferFriendScreen(),
      ),
    );
  }
}

