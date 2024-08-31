import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/photos/data/enums/photos_request_enums.dart';
import 'package:waffarha_challenge/photos/presentation/cubit/photos_cubit.dart';

class SortByListTile extends StatelessWidget {
  const SortByListTile({
    required this.sortBy,
    required this.isSelected,
    super.key,
  });

  final SortBy sortBy;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(_getTitle()),
      trailing: isSelected
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : null,
      onTap: () {
        context.read<PhotosCubit>().onSortByChanged(isSelected ? null : sortBy);
        Navigator.pop(context);
      },
    );
  }

  String _getTitle() {
    switch (sortBy) {
      case SortBy.title:
        return 'Sort by title';
      case SortBy.albumId:
        return 'Sort by albumId';
    }
  }
}
