// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:practice/efficient_api_calls/datasource/remote_datasource.dart';

import '../Network/api_response.dart';
import '../Network/list/list_response.dart';
import '../models/posts_model.dart';

abstract class DataRepository {
  Future<ApiResponse<ListResponse<PostModel>>> getMovies();
}

class DataRepositorytImpl implements DataRepository {
  final RemoteDataSource remoteDataSource;
  DataRepositorytImpl({
    required this.remoteDataSource,
  });

  @override
  Future<ApiResponse<ListResponse<PostModel>>> getMovies() async {
    var moviesList = await remoteDataSource.getMovies();
    return moviesList;
  }
}
