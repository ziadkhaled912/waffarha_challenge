import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waffarha_challenge/photos/data/models/request/photos_filter_params.dart';
import 'package:waffarha_challenge/photos/presentation/cubit/photos_cubit.dart';

class FilterSheet extends StatelessWidget {
  const FilterSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotosCubit, PhotosState>(
      buildWhen: (previous, current) =>
          previous.filterParams !=
          current.filterParams,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: List.generate(
                    50,
                    (index) => FilterChip(
                      label: Text(
                        'albumId ${index + 1}',
                      ),
                      selected: state.filterParams
                              ?.albumId ==
                          index + 1,
                      onSelected: (isSelected) {
                        context
                            .read<PhotosCubit>()
                            .onFilterParamsChanged(
                              PhotosFilterParams(
                                albumId: isSelected
                                    ? index + 1
                                    : null,
                              ),
                            );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
