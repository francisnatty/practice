// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class LoadAction {
  const LoadAction();
}

@immutable
class LoadPersonAction extends LoadAction {
  final PersonUrl url;
  const LoadPersonAction({required this.url}) : super();
}

enum PersonUrl {
  person1,
  person2,
}

extension UrlString on PersonUrl {
  String get urlString {
    switch (this) {
      case PersonUrl.person1:
        return 'http://127.0.0.1:5500';
      case PersonUrl.person2:
        return 'http://127.0.0.1:5500';
    }
  }
}

@immutable
class Person {
  final String name;
  final int age;

  const Person({required this.name, required this.age});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(name: json['name'] as String, age: json['age'] as int);
  }
}

Future<Iterable<Person>> getPersons(String url) => HttpClient()
    .getUrl(Uri.parse(url))
    .then((req) => req.close())
    .then((resp) => resp.transform(utf8.decoder).join())
    .then((str) => json.decode(str) as List<dynamic>)
    .then((list) => list.map((e) => Person.fromJson(e)));

@immutable
class FetchResult {
  final Iterable<Person> persons;
  final isRetrievedFromCache;

  const FetchResult({
    required this.persons,
    required this.isRetrievedFromCache,
  });

  @override
  String toString() =>
      'FetchResult (isRetrievedFromCache = $isRetrievedFromCache,persons= $persons)';
}

class PersonBloc extends Bloc<LoadAction, FetchResult?> {
  final Map<PersonUrl, Iterable<Person>> _cache = {};

  PersonBloc() : super(null) {
    on<LoadPersonAction>((event, emit) async {
      final url = event.url;
      if (_cache.containsKey(url)) {
        //we have the value in our cache

        final cachePersons = _cache[url]!;

        final result = FetchResult(
          persons: cachePersons,
          isRetrievedFromCache: true,
        );

        emit(result);
      } else {
        final persons = await getPersons(url.urlString);
        // final cachePersons = _cache[url]!;

        final result = FetchResult(
          persons: persons,
          isRetrievedFromCache: false,
        );

        emit(result);
      }
    });
  }
}

extension Subscript<T> on Iterable<T> {
  T? operator [](int index) => length > index ? elementAt(index) : null;
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home page'),
        ),
        body: Center(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<PersonBloc>().add(const LoadPersonAction(
                            url: PersonUrl.person1,
                          ));
                    },
                    child: const Text('Load json #1'),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<PersonBloc>().add(const LoadPersonAction(
                            url: PersonUrl.person2,
                          ));
                    },
                    child: const Text('Load json #2'),
                  )
                ],
              ),
              BlocBuilder<PersonBloc, FetchResult?>(
                buildWhen: (previous, current) {
                  return previous?.persons != current?.persons;
                },
                builder: ((context, state) {
                  final persons = state?.persons;
                  if (persons == null) {
                    return const SizedBox();
                  }
                  return Expanded(
                    child: ListView.builder(
                        itemCount: persons.length,
                        itemBuilder: (context, index) {
                          final person = persons[index]!;
                          return ListTile(
                            title: Text(person.name),
                          );
                        }),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}
