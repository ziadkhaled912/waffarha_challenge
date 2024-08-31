import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/app/helpers/generic_error_handler.dart';
import 'package:waffarha_challenge/app/view/widgets/image_view.dart';
import 'package:waffarha_challenge/di/injection_container.dart';
import 'package:waffarha_challenge/photos/presentation/cubit/photos_cubit.dart';
import 'package:waffarha_challenge/photos/presentation/widgets/filter_sheet.dart';
import 'package:waffarha_challenge/photos/presentation/widgets/sort_sheet/sort_sheet.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PhotosCubit>()..getPhotos(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Photos'),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state.failure != null) {
          return Center(
            child: Text(state.failure!.toMessage(context)),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: state.photosPages[state.page]?.length ?? 0,
                separatorBuilder: (context, index) => const Divider(),
                padding: const EdgeInsets.symmetric(vertical: 16),
                itemBuilder: (context, index) {
                  final photo = state.photosPages[state.page]![index];
                  return ListTile(
                    title: Text(photo.title),
                    subtitle: Text('albumId ${photo.albumId}'),
                    leading: ImageView(
                      photo.thumbnailUrl,
                      ImageType.url,
                      width: 60,
                      height: 60,
                      radius: 8,
                    ),
                  );
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: state.page > 1,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          context
                              .read<PhotosCubit>()
                              .onPageChanged(state.page - 1);
                        },
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.filter_alt),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (_) {
                                return BlocProvider.value(
                                  value: context.read<PhotosCubit>(),
                                  child: const FilterSheet(),
                                );
                              },
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.sort),
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              builder: (_) {
                                return BlocProvider.value(
                                  value: context.read<PhotosCubit>(),
                                  child: const SortSheet(),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                      Visibility(
                        visible: !state.noMoreData,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward),
                          onPressed: () {
                            context
                                .read<PhotosCubit>()
                                .onPageChanged(state.page + 1);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
