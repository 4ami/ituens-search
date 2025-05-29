part of 'models_lib.dart';

class ContentModel {
  ContentModel({
    this.artistId,
    this.artistViewUrl,
    this.contentAdvisoryRating,
    this.artworkUrl600,
    this.collectionHdPrice,
    this.genreIds,
    this.genres,
    this.extra,
    required this.wrapperType,
    required this.kind,
    required this.artistName,
    required this.collectionName,
    required this.trackName,
    required this.collectionCensoredName,
    required this.trackCensoredName,
    required this.collectionViewUrl,
    required this.trackViewUrl,
    required this.artworkUrl30,
    required this.artworkUrl60,
    required this.artworkUrl100,
    required this.collectionPrice,
    required this.trackPrice,
    required this.collectionExplicitness,
    required this.trackExplicitness,
    required this.country,
    required this.currency,
    required this.primaryGenreName,
    required this.trackCount,
    required this.trackTimeMillis,
    required this.releaseDate,
    required this.collectionId,
    required this.trackId,
  });

  final String wrapperType,
      kind,
      artistName,
      collectionName,
      trackName,
      collectionCensoredName,
      trackCensoredName;
  final String collectionViewUrl,
      trackViewUrl,
      artworkUrl30,
      artworkUrl60,
      artworkUrl100;
  final int? artistId;
  final int collectionId, trackId, trackCount, trackTimeMillis;
  final String? artistViewUrl, contentAdvisoryRating, artworkUrl600;
  final double collectionPrice, trackPrice;
  final double? collectionHdPrice;
  final DateTime releaseDate;
  final String collectionExplicitness,
      trackExplicitness,
      country,
      currency,
      primaryGenreName;
  final List<String>? genreIds, genres;
  final Map<String, dynamic>? extra;

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      wrapperType: json['wrapperType'] ?? '',
      kind: json['kind'] ?? '',
      artistName: json['artistName'] ?? '',
      collectionName: json['collectionName'] ?? '',
      trackName: json['trackName'] ?? '',
      collectionCensoredName: json['collectionCensoredName'] ?? '',
      trackCensoredName: json['trackCensoredName'] ?? '',
      collectionViewUrl: json['collectionViewUrl'] ?? '',
      trackViewUrl: json['trackViewUrl'] ?? '',
      artworkUrl30: json['artworkUrl30'] ?? '',
      artworkUrl60: json['artworkUrl60'] ?? '',
      artworkUrl100: json['artworkUrl100'] ?? '',
      collectionPrice: json['collectionPrice'] ?? 0,
      trackPrice: json['trackPrice'] ?? 0,
      collectionExplicitness: json['collectionExplicitness'] ?? '',
      trackExplicitness: json['trackExplicitness'] ?? '',
      country: json['country'] ?? '',
      currency: json['currency'] ?? '',
      primaryGenreName: json['primaryGenreName'] ?? '',
      trackCount: json['trackCount'] ?? 0,
      trackTimeMillis: json['trackTimeMillis'] ?? 0,
      releaseDate: DateTime.parse(
        json['releaseDate'] ?? DateTime.now().toString(),
      ),
      collectionId: json['collectionId'] ?? 0,
      trackId: json['trackId'] ?? 0,
    );
  }
}
