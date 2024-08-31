import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/photos/data/enums/photos_request_enums.dart';
import 'package:waffarha_challenge/photos/presentation/cubit/photos_cubit.dart';
import 'package:waffarha_challenge/photos/presentation/page/photos_page.dart';
import 'package:waffarha_challenge/photos/presentation/widgets/sort_sheet/sort_by_list_tile.dart';

class SortSheet extends StatelessWidget {
  const SortSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      buildWhen: (previous, current) => previous.sortBy != current.sortBy,
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SortByListTile(
                  sortBy: SortBy.title,
                  isSelected: state.sortBy == SortBy.title,
                ),
                const Divider(),
                SortByListTile(
                  sortBy: SortBy.albumId,
                  isSelected: state.sortBy == SortBy.albumId,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
