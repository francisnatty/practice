import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:practice/efficient_api_calls/Network/api_response.dart';
import 'package:practice/efficient_api_calls/Network/list/list_response.dart';
import 'package:practice/efficient_api_calls/models/posts_model.dart';
import 'package:practice/efficient_api_calls/repository/data_repository.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  final getIt = GetIt.instance;

  late DataRepository dataRepository;
  @override
  void initState() {
    dataRepository = getIt<DataRepository>();
    super.initState();
  }

  Future<void> getData() async {
    ApiResponse<ListResponse<PostModel>> data1 =
        await dataRepository.getMovies();
    if (data1.success == true) {
      print(data1.data!.results.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async {
            await getData();
          },
          child: const Text('Test Api'),
        ),
      ),
    );
  }
}
