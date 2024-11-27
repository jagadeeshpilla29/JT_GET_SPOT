
import 'package:get_spot/data/datasource/authentication/current_customer_remote_data_source.dart';
import 'package:get_spot/domain/entity/authentication/current_customer_entity.dart';
import 'package:get_spot/domain/repository/authentication/current_customer_repository.dart';

class CurrentCustomerRepositoryImpl implements CurrentCustomerRepository {
  final CurrentCustomerRemoteDataSource remoteDataSource;

CurrentCustomerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<CurrentCustomerEntity> getCurrentCustomer() async {
    final model = await remoteDataSource.currentCustomer();
    return CurrentCustomerEntity(
        message: model.message,
        status: model.status,
        data: model.data != null
            ? CurrentCustomerDataEntity(
                id: model.data!.id,
                fullName: model.data!.fullName,
                primaryContact: model.data?.primaryContact ?? '',
                status: model.data?.status ?? '',
                roles: [],
                newUser: model.data?.newUser ?? false,
                private: model.data?.private ?? false,
              )
            : null);
  }
}
