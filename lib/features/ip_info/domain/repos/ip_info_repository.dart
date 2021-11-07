import 'package:get_ip_info/features/ip_info/domain/entities/dataModel.dart';

import 'package:dartz/dartz.dart';
abstract class IpInfoRepository {
  Future<Either<String, IpDataModel>> getData();
}