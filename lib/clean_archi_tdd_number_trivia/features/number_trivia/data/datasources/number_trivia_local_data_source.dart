// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:practice/clean_archi_tdd_number_trivia/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:practice/clean_archi_tdd_number_trivia/features/number_trivia/data/models/number_trivia_model.dart';

abstract class NumberTriviaLocalDataSource {
  ///Gets the cached [NumberTrivialModel] which was gotten the last time
  ///the user had an internet connection
  ///Throw [NoLocalDataException] if no cached data is present
  ///

  Future<NumberTriviaModel> getLastNumberTrivia();
  Future<void> cacheNumberTrivia(NumberTriviaModel trivialToCache);
}

class NumberTriviaLocalDataSourceImpl implements NumberTriviaLocalDataSource {
  final SharedPreferences sharedPreferences;
  NumberTriviaLocalDataSourceImpl({
    required this.sharedPreferences,
  });
  @override
  Future<void> cacheNumberTrivia(NumberTriviaModel trivialToCache) {
    return sharedPreferences.setString(
        'CACHED_NUMBER_TRIVIA', jsonEncode(trivialToCache.toJson()));
  }

  @override
  Future<NumberTriviaModel> getLastNumberTrivia() {
    final jsonString = sharedPreferences.getString('CACHED_NUMBER_TRIVIA');
    if (jsonString != null) {
      return Future.value(NumberTriviaModel.fromjson(jsonDecode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
