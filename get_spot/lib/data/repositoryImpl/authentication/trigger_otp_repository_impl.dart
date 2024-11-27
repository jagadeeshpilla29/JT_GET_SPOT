
import 'package:get_spot/data/datasource/authentication/trigger_otp_remote_data_source.dart';
import 'package:get_spot/domain/entity/authentication/trigger_otp_entity.dart';
import 'package:get_spot/domain/repository/authentication/trigger_otp_repository.dart';

class TriggerOtpRepositoryImpl implements TriggerOtpRepository {
  final TriggerOtpRemoteDataSource remoteDataSource;

  TriggerOtpRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TriggerOtpEntity> getOtp(String mobileNumber) async {
    final model = await remoteDataSource.fetchOtp(mobileNumber);
    return TriggerOtpEntity(
      message: model.message,
      status: model.status,
      data: model.data != null
          ? DataEntity(
              id: model.data!.id,
              otpType: model.data!.otpType,
              creationTime: model.data!.creationTime,
              otp: model.data!.otp,
            )
          : null,
    );
  }
}
