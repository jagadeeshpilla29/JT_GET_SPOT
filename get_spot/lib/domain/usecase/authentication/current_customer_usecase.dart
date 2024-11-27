
import 'package:get_spot/domain/entity/authentication/current_customer_entity.dart';
import 'package:get_spot/domain/repository/authentication/current_customer_repository.dart';

class CurrentCustomerValidationUseCase {
  final CurrentCustomerRepository repository;

  CurrentCustomerValidationUseCase(this.repository);

  Future<CurrentCustomerEntity> call() async {
    return await repository.getCurrentCustomer();
  }
}
