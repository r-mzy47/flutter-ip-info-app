import 'package:dartz/dartz.dart';
import 'package:get_ip_info/core/use_cases.dart';
import 'package:get_ip_info/features/ip_info/domain/entities/dataModel.dart';
import 'package:get_ip_info/features/ip_info/domain/repos/ip_info_repository.dart';

class GetIpInfoUseCase extends UseCase<IpDataModel , NoParams> {
  final IpInfoRepository repository;

  GetIpInfoUseCase({required this.repository});
  @override
  Future<Either<String, IpDataModel>> call(NoParams params) async {
    return await repository.getData();
  }
}