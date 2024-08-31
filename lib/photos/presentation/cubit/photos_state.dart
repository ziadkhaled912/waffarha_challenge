part of 'photos_cubit.dart';

class PhotosState extends Equatable {
  const PhotosState({
    this.isLoading = false,
    this.noMoreData = false,
    this.failure,
    this.photosPages = const {},
    this.filterParams,
    this.sortBy,
    this.page = 1,
  });

  final bool isLoading;
  final Failure? failure;
  final Map<int, List<PhotoModel>> photosPages;
  final PhotosFilterParams? filterParams;
  final SortBy? sortBy;
  final bool noMoreData;
  final int page;

  PhotosState loading() {
    return copyWith(
      isLoading: true,
      failure: Nullable(null),
    );
  }

  PhotosState error(Failure failure) {
    return copyWith(
      isLoading: false,
      failure: Nullable(failure),
    );
  }

  PhotosState success(Map<int, List<PhotoModel>> photosPages) {
    return copyWith(
      isLoading: false,
      failure: Nullable(null),
      photosPages: photosPages,
    );
  }

  PhotosState copyWith({
    bool? isLoading,
    Nullable<Failure?>? failure,
    Map<int, List<PhotoModel>>? photosPages,
    Nullable<PhotosFilterParams?>? filterParams,
    Nullable<SortBy?>? sortBy,
    bool? noMoreData,
    int? page,
  }) {
    return PhotosState(
      isLoading: isLoading ?? this.isLoading,
      failure: failure == null ? this.failure : failure.value,
      photosPages: photosPages ?? this.photosPages,
      filterParams:
          filterParams == null ? this.filterParams : filterParams.value,
      sortBy: sortBy == null ? this.sortBy : sortBy.value,
      noMoreData: noMoreData ?? this.noMoreData,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        failure,
        photosPages,
        filterParams,
        sortBy,
        noMoreData,
        page,
      ];
}
