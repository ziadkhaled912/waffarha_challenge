import 'package:equatable/equatable.dart';

class Page<T> extends Equatable {
  const Page({
    required this.items,
    required this.size,
    required this.totalElements,
    required this.totalPages,
    required this.hasPreviousPage,
    required this.hasNextPage,
  });

  factory Page.fromJson(
    Map<String, dynamic> map,
    T Function(Map<String, dynamic>) fromMap,
  ) {
    return Page(
      items: map['results'] != null
          ? (map['results'] as List)
              .map((e) => fromMap(e as Map<String, dynamic>))
              .toList()
          : [],
      size: map['size'] as int? ?? 0,
      totalElements: map['count'] as int? ?? 0,
      totalPages: map['num_of_pages'] as int? ?? 0,
      hasPreviousPage: map['has_previous'] as bool? ?? false,
      hasNextPage: map['has_next'] as bool? ?? false,
    );
  }

  final List<T> items;
  final int size;
  final int totalElements;
  final int totalPages;
  final bool hasPreviousPage;
  final bool hasNextPage;

  @override
  List<Object> get props => [
        items,
        size,
        totalElements,
        totalPages,
        hasPreviousPage,
        hasNextPage,
      ];

  Page<T> copyWith({
    List<T>? items,
    int? size,
    int? totalElements,
    int? totalPages,
    bool? hasPreviousPage,
    bool? hasNextPage,
  }) {
    return Page<T>(
      items: items ?? this.items,
      size: size ?? this.size,
      totalElements: totalElements ?? this.totalElements,
      totalPages: totalPages ?? this.totalPages,
      hasPreviousPage: hasPreviousPage ?? this.hasPreviousPage,
      hasNextPage: hasNextPage ?? this.hasNextPage,
    );
  }
}
