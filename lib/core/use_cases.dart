import 'package:dartz/dartz.dart';

abstract class UseCase<OutputType, InputTupe> {
  Future<Either<String, OutputType>> call(InputTupe params);
}

class NoParams  {

}