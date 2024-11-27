

import 'package:get_spot/domain/entity/authentication/current_customer_entity.dart';

abstract class CurrentCustomerRepository {
  Future<CurrentCustomerEntity> getCurrentCustomer();
}
