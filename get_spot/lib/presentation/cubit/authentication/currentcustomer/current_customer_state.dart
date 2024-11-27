import 'package:get_spot/domain/entity/authentication/current_customer_entity.dart';

abstract class CurrentCustomerState {}

class CurrentCustomerInitial extends CurrentCustomerState {}

class CurrentCustomerLoading extends CurrentCustomerState {
  
}

class CurrentCustomerLoaded extends CurrentCustomerState {
  final CurrentCustomerEntity currentCustomerEntity;
  CurrentCustomerLoaded(this.currentCustomerEntity);
}

class CurrentCustomerError extends CurrentCustomerState {
  final String message;
  CurrentCustomerError(this.message);
}
