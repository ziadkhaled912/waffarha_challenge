import 'package:equatable/equatable.dart';

List<PhotoModel> photoModelFromJson(Map<String, dynamic> json) =>
    List<PhotoModel>.from(
      (json['list'] as List? ?? []).map(
        (x) => PhotoModel.fromJson(x as Map<String, dynamic>),
      ),
    );

class PhotoModel extends Equatable {
  const PhotoModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'] as int? ?? 0,
      albumId: json['albumId'] as int? ?? 0,
      title: json['title'] as String? ?? '',
      url: json['url'] as String? ?? '',
      thumbnailUrl: json['thumbnailUrl'] as String? ?? '',
    );
  }

  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  @override
  List<Object?> get props => [
        id,
        albumId,
        title,
        url,
        thumbnailUrl,
      ];
}
