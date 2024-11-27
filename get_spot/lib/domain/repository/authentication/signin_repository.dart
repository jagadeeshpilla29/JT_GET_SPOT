
import 'package:get_spot/domain/entity/authentication/signin_entity.dart';

abstract class SignInRepository {
  Future<SignInEntity> logIn(String mobileNumber, String otp);
}
