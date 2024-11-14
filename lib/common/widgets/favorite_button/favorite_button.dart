import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_track/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:sound_track/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:sound_track/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  const FavoriteButton({
    required this.songEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdate(songEntity.songId);
              },
              icon: Icon(
                songEntity.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
              ),
            );
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () {
                context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdate(songEntity.songId);
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
