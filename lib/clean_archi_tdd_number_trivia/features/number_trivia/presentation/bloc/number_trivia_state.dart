part of 'number_trivia_bloc.dart';

@immutable
abstract class NumberTriviaState extends Equatable {}

class Empty extends NumberTriviaState {
  @override
  List<Object?> get props => [];
}

class Loading extends NumberTriviaState {
  @override
  List<Object?> get props => [];
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;
  Loaded({
    required this.trivia,
  });
  @override
  List<Object> get props => [trivia];
}

class Error extends NumberTriviaState {
  final String message;
  Error({
    required this.message,
  });

  @override
  // TODO: implement props
  List<Object> get props => [message];
}
