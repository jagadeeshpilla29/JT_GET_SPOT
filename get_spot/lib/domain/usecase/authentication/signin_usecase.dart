import 'package:get_spot/domain/entity/authentication/signin_entity.dart';
import 'package:get_spot/domain/repository/authentication/signin_repository.dart';

class SignInValidationUseCase {
  final SignInRepository repository;

  SignInValidationUseCase({required this.repository});

  Future<SignInEntity> call(String mobileNumber, String otp) async {
    return await repository.logIn(mobileNumber, otp);
  }
}
