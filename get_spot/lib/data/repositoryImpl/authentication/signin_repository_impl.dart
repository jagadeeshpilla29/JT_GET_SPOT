import 'package:get_spot/data/datasource/authentication/signin_remote_data_source.dart';
import 'package:get_spot/domain/entity/authentication/signin_entity.dart';
import 'package:get_spot/domain/repository/authentication/signin_repository.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInRemoteDataSource remoteDataSource;

  SignInRepositoryImpl({required this.remoteDataSource});

  @override
  Future<SignInEntity> logIn(String mobileNumber, String otp) async {
    final model = await remoteDataSource.signIn(mobileNumber, otp);
    return SignInEntity(
      message: model.message,
      status: model.status,
      data: model.data != null
          ? SignInDataEntity(
              token: model.data!.token,
              refreshToken: model.data!.refreshToken,
              type: model.data!.type,
              id: model.data!.id,
              roles: model.data!.roles,
              primaryContact: model.data!.primaryContact)
          : null,
    );
  }
}
