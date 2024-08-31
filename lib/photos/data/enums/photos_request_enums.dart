enum SortBy {
  title,
  albumId;

  Map<String, dynamic> toMap() {
    return {
      '_sort': name,
    };
  }
}
