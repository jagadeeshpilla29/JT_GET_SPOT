import 'package:get_spot/domain/entity/authentication/signin_entity.dart';

abstract class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInLoaded extends SignInState {
  final SignInEntity signInEntity;
  SignInLoaded(this.signInEntity);
}

class SignInError extends SignInState {
  final String message;
  SignInError(this.message);
}
