// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:practice/clean_archi_tdd_number_trivia/core/error/exceptions.dart';

import '../models/number_trivia_model.dart';

abstract class NumberTriviaRemoteDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomTrivia();
}

class NumberTriviaRemoteDataSourceImpl implements NumberTriviaRemoteDataSource {
  final http.Client client;
  NumberTriviaRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) =>
      _getTriviaFromUrl('https://numbersapi.com/$number');

  @override
  Future<NumberTriviaModel> getRandomTrivia() =>
      _getTriviaFromUrl('https://numbersapi.com/random');

  Future<NumberTriviaModel> _getTriviaFromUrl(String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'appication/json'});

    if (response.statusCode == 200) {
      return NumberTriviaModel.fromjson(jsonDecode(response.body));
    } else {
      throw ServerException('error');
    }
  }
}
