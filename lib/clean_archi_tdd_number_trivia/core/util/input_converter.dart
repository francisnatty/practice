import 'package:dartz/dartz.dart';
import 'package:practice/clean_archi_tdd_number_trivia/core/error/failure.dart';

class InputConverter {
  Either<Failure, int> stringToUnsignedInterger(String str) {
    try {
      final integer = int.parse(str);
      if (integer < 0) throw UnimplementedError();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure {}
