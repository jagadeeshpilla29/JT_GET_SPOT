// splash_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:get_spot/domain/entity/authentication/current_customer_entity.dart';
import 'package:get_spot/domain/usecase/authentication/current_customer_usecase.dart';
import 'package:get_spot/presentation/cubit/authentication/currentcustomer/current_customer_state.dart';

class CurrentCustomerCubit extends Cubit<CurrentCustomerState> {
  final CurrentCustomerValidationUseCase currentCustomerValidationUseCase;

  CurrentCustomerCubit(this.currentCustomerValidationUseCase) : super(CurrentCustomerInitial());

  void startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      emit(CurrentCustomerInitial());
    });
  }

  Future<void> GetCurrentCustomer() async {
    try {
      emit(CurrentCustomerLoading());
      final currentCustomerEntity = await currentCustomerValidationUseCase();
      emit(CurrentCustomerLoaded(currentCustomerEntity as CurrentCustomerEntity));
    } catch (e) {
      emit(CurrentCustomerError('Failed to current customer data: ${e.toString()}'));
    }
  }


}
