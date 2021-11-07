import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:get_ip_info/features/ip_info/data/datasources/data_source.dart';
import 'package:get_ip_info/features/ip_info/data/repos/ip_info_repository_impl.dart';
import 'package:get_ip_info/features/ip_info/domain/repos/ip_info_repository.dart';
import 'package:get_ip_info/features/ip_info/domain/use_cases/get_ip_info_usecase.dart';
import 'package:get_ip_info/features/ip_info/presentation/providers/ip_data_provider.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  getIt.registerFactory<Dio>(() => Dio());
  getIt.registerFactory<DataSource>(() => DataSourceImpl(dio: getIt()));
  getIt.registerFactory<IpInfoRepository>(() => IpInfoRepositoryImpl(dataSource: getIt()));
  getIt.registerFactory<GetIpInfoUseCase>(() => GetIpInfoUseCase(repository: getIt()));
  getIt.registerFactory<IpDataProvider>(() => IpDataProvider(getIpInfoUseCase: getIt()));
}