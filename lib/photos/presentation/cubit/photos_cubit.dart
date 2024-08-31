import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/app/helpers/nullable.dart';
import 'package:waffarha_challenge/photos/data/enums/photos_request_enums.dart';
import 'package:waffarha_challenge/photos/data/models/request/get_photos_request_model.dart';
import 'package:waffarha_challenge/photos/data/models/request/photos_filter_params.dart';
import 'package:waffarha_challenge/photos/data/models/response/photo_model.dart';
import 'package:waffarha_challenge/photos/data/repository/photos_repository.dart';

part 'photos_state.dart';

@injectable
class PhotosCubit extends Cubit<PhotosState> {
  PhotosCubit(
    this._photosRepository,
  ) : super(const PhotosState());

  final PhotosRepository _photosRepository;

  Future<void> getPhotos() async {
    emit(state.loading());
    final requestModel = GetPhotosRequestModel(
      page: state.page,
      filterParams: state.filterParams,
      sortBy: state.sortBy,
    );
    final result = await _photosRepository.getPhotosList(requestModel);
    emit(
      result.fold(
        (failure) => state.error(failure),
        (result) {
          if (result.isEmpty) {
            return state.copyWith(
              isLoading: false,
              noMoreData: true,
              page: state.page - 1,
            );
          }
          final photosPages = Map<int, List<PhotoModel>>.from(
            state.photosPages,
          );
          photosPages[state.page] = result;
          return state.copyWith(
            isLoading: false,
            noMoreData: false,
            page: state.page,
            photosPages: photosPages,
          );
        },
      ),
    );
  }

  void onSortByChanged(SortBy? sortBy) {
    emit(
      state.copyWith(
        sortBy: Nullable(sortBy),
        photosPages: {},
        page: 1,
      ),
    );
    getPhotos();
  }

  void onFilterParamsChanged(PhotosFilterParams? filterParams) {
    emit(
      state.copyWith(
        filterParams: Nullable(filterParams),
        photosPages: {},
        page: 1,
      ),
    );
    getPhotos();
  }

  void onPageChanged(int page) {
    emit(state.copyWith(page: page));
    if (!(state.photosPages.containsKey(state.page) &&
        state.sortBy == null &&
        state.filterParams == null)) {
      getPhotos();
    }
  }
}
