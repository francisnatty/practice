// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:practice/efficient_api_calls/Network/api_client.dart';
import 'package:practice/efficient_api_calls/Network/api_response.dart';
import 'package:practice/efficient_api_calls/Network/list/list_response.dart';
import 'package:practice/efficient_api_calls/models/posts_model.dart';

abstract class RemoteDataSource {
  Future<ApiResponse<ListResponse<PostModel>>> getMovies();
  Future<dynamic> getTvShows();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final ApiClient apiClient;
  RemoteDataSourceImpl({
    required this.apiClient,
  });

  @override
  Future<ApiResponse<ListResponse<PostModel>>> getMovies() async {
    return apiClient.request(
      path: 'https://jsonplaceholder.typicode.com/posts',
      method: MethodType.get,
      fromJsonT: (json) => ListResponse<PostModel>.fromJson({
        'page': 1,
        'results': json,
        'total_pages': 1,
        'total_results': json.length
      }, (json) => PostModel.fromMap(json as Map<String, dynamic>)),
    );
  }

  @override
  Future getTvShows() {
    // TODO: implement getTvShows
    throw UnimplementedError();
  }
}
