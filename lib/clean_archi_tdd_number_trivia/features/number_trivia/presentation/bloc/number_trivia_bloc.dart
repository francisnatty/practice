// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:practice/clean_archi_tdd_number_trivia/core/util/input_converter.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  final InputConverter inputConverter;

  NumberTriviaBloc(
    this.getConcreteNumberTrivia,
    this.getRandomNumberTrivia,
    this.inputConverter,
  ) : super(Empty());

  @override
  Stream<NumberTriviaState> mapEventToState(NumberTriviaEvent event) async* {
    if (event is GetTriviaForConcreteNumber) {
      inputConverter.stringToUnsignedInterger(event.number);
    }
  }
}
