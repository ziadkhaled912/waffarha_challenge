import 'package:waffarha_challenge/app/data/api_manager/api_manager.dart';
import 'package:waffarha_challenge/photos/data/enums/photos_request_enums.dart';
import 'package:waffarha_challenge/photos/data/models/request/photos_filter_params.dart';

class GetPhotosRequestModel extends RequestModel {
  GetPhotosRequestModel({
    required this.page,
    this.filterParams,
    this.sortBy,
    this.limit = 10,
  }) : super(null);

  final int page;
  final int limit;
  final PhotosFilterParams? filterParams;
  final SortBy? sortBy;

  @override
  Future<Map<String, dynamic>> toMap() async {
    return {
      '_page': page,
      '_per_page': limit,
      if (filterParams != null) ...filterParams!.toMap(),
      if (sortBy != null) ...sortBy!.toMap(),
    };
  }
  
  @override
  List<Object?> get props => [
    page,
    limit,
    filterParams,
    sortBy,
  ];
}
