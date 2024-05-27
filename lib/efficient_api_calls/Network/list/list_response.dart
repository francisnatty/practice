import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

// @JsonSerializable(
//   createToJson: false,
//   genericArgumentFactories: true,
//   fieldRename: FieldRename.snake,
// )
@JsonSerializable()
class ListResponse<T> {
  final int page;
  final List<T> results;
  final int totalPages;
  final int totalResults;
  ListResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  factory ListResponse.fromJson(
      dynamic json, T Function(Object? json) fromJsonT) {
    return _$ListResponseFromJson(json, fromJsonT);
  }
}
