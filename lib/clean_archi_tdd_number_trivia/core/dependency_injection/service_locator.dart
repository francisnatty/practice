import 'package:get_it/get_it.dart';
import 'package:practice/efficient_api_calls/Network/dio_client.dart';
import '../../../efficient_api_calls/datasource/remote_datasource.dart';
import '../../../efficient_api_calls/repository/data_repository.dart';

final GetIt sl = GetIt.instance;

void setUpLocator() async {
  DataRepository dataRepository() => DataRepositorytImpl(
      remoteDataSource: RemoteDataSourceImpl(apiClient: DioClient()));
  sl.registerLazySingleton(() => dataRepository());
}
