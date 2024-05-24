// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:practice/clean_archi_tdd_number_trivia/core/error/failure.dart';
import 'package:practice/clean_archi_tdd_number_trivia/core/usecases/usecase.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTrivialRepository repository;

  GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

  // Future<Either<Failure, NumberTrivia>> call({required int number}) async {
  //
  // }
}

class Params extends Equatable {
  final int number;
  Params({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}
