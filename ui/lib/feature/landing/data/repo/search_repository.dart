import 'package:ui/configuration/remote/remote_lib.dart';
import 'package:ui/feature/landing/data/model/models_lib.dart';

final class SearchRepository {
  SearchRepository() : _client = HttpClient();
  final HttpClient _client;

  Future<ITunesSearchResponse> search({required String term}) async {
    return await _client.get(
      endpoint: CloudSource.searchProxy,
      parser: (json) => ITunesSearchResponse.fromJson(json),
      queryParams: {'term': term},
    );
  }
}
