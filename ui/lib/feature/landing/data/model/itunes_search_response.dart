part of 'models_lib.dart';

class ITunesSearchResponse extends BaseResponse {
  final int resultCount;
  final List<ContentModel> results;

  ITunesSearchResponse({required super.code, required this.results, required this.resultCount});

  factory ITunesSearchResponse.fromJson(Map<String, dynamic> json) {
    return ITunesSearchResponse(
      code: json['code'] ?? 0,
      resultCount: json['resultCount'] ?? 0,
      results: List.generate(
        json['results'].length,
        (index) => ContentModel.fromJson(json['results'][index]),
      ),
    );
  }
}
