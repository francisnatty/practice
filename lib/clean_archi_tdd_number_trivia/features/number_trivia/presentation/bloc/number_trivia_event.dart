part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaEvent extends Equatable {}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String number;

  GetTriviaForConcreteNumber({
    required this.number,
  });

  @override
  List<Object> get props => [number];
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  final String number;

  GetTriviaForRandomNumber({
    required this.number,
  });

  @override
  List<Object?> get props => [number];
}
