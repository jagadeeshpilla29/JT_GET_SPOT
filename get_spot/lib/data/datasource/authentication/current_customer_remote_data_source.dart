import 'package:dio/dio.dart';
import 'package:get_spot/core/constants/api_constants.dart';
import 'package:get_spot/data/model/authentication/current_customer_model.dart';

abstract class CurrentCustomerRemoteDataSource {
  Future<CurrentCustomerModel> currentCustomer();
}

class CurrentCustomerRemoteDataSourceImpl implements CurrentCustomerRemoteDataSource {
  final Dio client;

  CurrentCustomerRemoteDataSourceImpl({required this.client});

  @override
  Future<CurrentCustomerModel> currentCustomer() async {
    try {
      final response = await client.get(CurrentCustomer);
      if (response.statusCode == 200) {
        print('responce of current customer:: $response');
        return CurrentCustomerModel.fromJson(response.data);
      } else {
        throw Exception(
            'Failed to load current customer data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load current customer data: ${e.toString()}');
    }
  }
}
