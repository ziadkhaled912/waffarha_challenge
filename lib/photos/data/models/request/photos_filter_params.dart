import 'package:equatable/equatable.dart';

class PhotosFilterParams extends Equatable {
  const PhotosFilterParams({
    required this.albumId,
  });

  final int? albumId;

  Map<String, dynamic> toMap() {
    return {
      if(albumId != null)
      'albumId': albumId,
    };
  }

  @override
  List<Object?> get props => [albumId];
}
