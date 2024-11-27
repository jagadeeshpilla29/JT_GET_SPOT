import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_spot/core/network/dio_client.dart';
import 'package:get_spot/core/utils/enums/enums.dart';

class BaseCubit extends Cubit<ApiStatus> {
  late DioClient dioClient;

  BaseCubit() : super(ApiStatus.SUCCESS) {
    initializeDioClient();
  }

  Future<void> initializeDioClient() async {
    final secureStorage = FlutterSecureStorage();
    dioClient = DioClient(Dio(), secureStorage: secureStorage);
  }
}
