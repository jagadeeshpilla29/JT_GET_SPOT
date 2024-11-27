import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:get_spot/core/network/dio_client.dart';
import 'package:get_spot/data/datasource/authentication/current_customer_remote_data_source.dart';
import 'package:get_spot/data/datasource/authentication/signin_remote_data_source.dart';
import 'package:get_spot/data/datasource/authentication/trigger_otp_remote_data_source.dart';
import 'package:get_spot/data/repositoryImpl/authentication/current_customer_repository_impl.dart';
import 'package:get_spot/data/repositoryImpl/authentication/signin_repository_impl.dart';
import 'package:get_spot/data/repositoryImpl/authentication/trigger_otp_repository_impl.dart';
import 'package:get_spot/domain/repository/authentication/current_customer_repository.dart';
import 'package:get_spot/domain/repository/authentication/signin_repository.dart';
import 'package:get_spot/domain/repository/authentication/trigger_otp_repository.dart';
import 'package:get_spot/domain/usecase/authentication/current_customer_usecase.dart';
import 'package:get_spot/domain/usecase/authentication/signin_usecase.dart';
import 'package:get_spot/domain/usecase/authentication/trigger_otp_usecase.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/signin/sigin_cubit.dart';
import 'package:get_spot/presentation/cubit/authentication/login/trigger_otp_cubit.dart';

final GetIt sl = GetIt.instance;

void init() {
  
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton<DioClient>(
    () => DioClient(sl<Dio>(), secureStorage: sl<FlutterSecureStorage>()),
  );

  //Trigger Otp
  sl.registerLazySingleton<TriggerOtpRemoteDataSource>( () => TriggerOtpRemoteDataSourceImpl(client: sl<DioClient>().dio),);
  sl.registerLazySingleton<TriggerOtpRepository>(
    () => TriggerOtpRepositoryImpl(remoteDataSource: sl<TriggerOtpRemoteDataSource>()),
  );
  sl.registerLazySingleton(
    () => TriggerOtpValidationUseCase(repository:sl<TriggerOtpRepository>()),
  );
  sl.registerFactory(() => TriggerOtpCubit(useCase: sl<TriggerOtpValidationUseCase>()));

//signin 

sl.registerLazySingleton<SignInRemoteDataSource>( () => SignInRemoteDataSourceImpl(client: sl<DioClient>().dio),);
  sl.registerLazySingleton<SignInRepository>(
    () => SignInRepositoryImpl(remoteDataSource: sl<SignInRemoteDataSource>()),
  );
  sl.registerLazySingleton(
    () => SignInValidationUseCase(repository:sl<SignInRepository>()),
  );
  sl.registerFactory(() => SignInCubit(useCase: sl<SignInValidationUseCase>()));

  //currentcustomer 

  sl.registerLazySingleton<CurrentCustomerRemoteDataSource>( () => CurrentCustomerRemoteDataSourceImpl(client: sl<DioClient>().dio),);
  sl.registerLazySingleton<CurrentCustomerRepository>(
    () => CurrentCustomerRepositoryImpl(remoteDataSource: sl<CurrentCustomerRemoteDataSource>()),
  );
  sl.registerLazySingleton(
    () => CurrentCustomerValidationUseCase(sl<CurrentCustomerRepository>()),
  );
  sl.registerFactory(() => CurrentCustomerCubit( sl<CurrentCustomerValidationUseCase>(
   
  )));

}