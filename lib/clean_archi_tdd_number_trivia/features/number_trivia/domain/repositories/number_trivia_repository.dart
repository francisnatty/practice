import 'package:dartz/dartz.dart';
import 'package:practice/clean_archi_tdd_number_trivia/core/error/failure.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTrivialRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);
  Future<Either<Failure, NumberTrivia>> getRandowNumberTrivia();
}
