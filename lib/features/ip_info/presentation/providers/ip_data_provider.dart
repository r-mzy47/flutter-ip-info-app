import 'package:flutter/cupertino.dart';
import 'package:get_ip_info/core/use_cases.dart';
import 'package:get_ip_info/features/ip_info/domain/entities/dataModel.dart';
import 'package:get_ip_info/features/ip_info/domain/repos/ip_info_repository.dart';
import 'package:get_ip_info/features/ip_info/domain/use_cases/get_ip_info_usecase.dart';

abstract class IpDataState {}

class LoadingIpDataState  extends IpDataState {}

class ErrorIpDataState extends IpDataState{
  final String message;
  ErrorIpDataState({required this.message});
}

class LoadedIpDateState extends IpDataState{
  final IpDataModel ipDataModel;
  LoadedIpDateState({required this.ipDataModel});
}

class IpDataProvider extends ChangeNotifier {
  IpDataState _state = LoadingIpDataState();
  final GetIpInfoUseCase getIpInfoUseCase;

  IpDataProvider({required this.getIpInfoUseCase});

  IpDataState get state => _state;

  void load() async {
    _state = LoadingIpDataState();
    notifyListeners();
    final res = await getIpInfoUseCase.call(NoParams());
    res.fold((l) {
      _state = ErrorIpDataState(message: l);
      notifyListeners();
    }, (r) {
      _state = LoadedIpDateState(ipDataModel: r);
      notifyListeners();
    });
  }
}