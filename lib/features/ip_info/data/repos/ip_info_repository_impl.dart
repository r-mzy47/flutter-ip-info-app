import 'package:dartz/dartz.dart';
import 'package:get_ip_info/features/ip_info/data/datasources/data_source.dart';
import 'package:get_ip_info/features/ip_info/domain/entities/dataModel.dart';
import 'package:get_ip_info/features/ip_info/domain/repos/ip_info_repository.dart';

class IpInfoRepositoryImpl extends IpInfoRepository {
  DataSource dataSource;

  IpInfoRepositoryImpl({required this.dataSource});

  @override
  Future<Either<String, IpDataModel>> getData() async {
    final res = await dataSource.http_get("https://api.myip.com/");
    return res.fold((l) => Left(l), (r) => Right(IpDataModel.fromJson(r)));
  }
}