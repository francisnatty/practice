import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:practice/clean_archi_tdd_number_trivia/core/error/failure.dart';
import 'package:practice/clean_archi_tdd_number_trivia/core/usecases/usecase.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/data/repositories/number_trivia_repo_impl.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepositoryImpl repository;
  GetRandomNumberTrivia({required this.repository});

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandowNumberTrivia();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
