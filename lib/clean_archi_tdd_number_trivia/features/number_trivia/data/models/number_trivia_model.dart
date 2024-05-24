import 'package:flutter/foundation.dart';
import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  const NumberTriviaModel({required super.text, required super.number});

  @override
  List<Object> get props => [text, number];

  factory NumberTriviaModel.fromjson(Map<String, dynamic> json) {
    return NumberTriviaModel(
        text: json['text'], number: (json['number'] as num).toInt());
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }
}
