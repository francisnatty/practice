import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:practice/efficient_api_calls/Network/api_client.dart';
import 'package:practice/efficient_api_calls/Network/api_response.dart';
import 'package:practice/efficient_api_calls/Network/dio_client.dart';
import 'package:practice/efficient_api_calls/datasource/remote_datasource.dart';
import 'package:practice/efficient_api_calls/repository/data_repository.dart';
import 'package:practice/liskov_button.dart';

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  late DataRepository dataRepository;
  @override
  void initState() {
    dataRepository = DataRepositorytImpl(
        remoteDataSource: RemoteDataSourceImpl(apiClient: DioClient()));
    super.initState();
  }

  Future<void> getData() async {
    ApiResponse data1 = await dataRepository.getMovies();
    if (data1.success == true) {
      //gotten data successfully
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
