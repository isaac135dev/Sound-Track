import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_track/common/helpers/is_dark_mode.dart';
import 'package:sound_track/common/widgets/favorite_button/favorite_button.dart';
import 'package:sound_track/core/configs/themes/app_colors.dart';
import 'package:sound_track/domain/entities/song/song.dart';
import 'package:sound_track/presentation/home/bloc/play_list_cubit.dart';
import 'package:sound_track/presentation/home/bloc/play_list_state.dart';
import 'package:sound_track/presentation/song_player/page/song_player.dart';

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => PlayListCubit()..getPlayList(),
      child: BlocBuilder<PlayListCubit, PlayListState>(
        builder: (context, state) {
          if (state is PlayListLoading) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }

          if (state is PlayListLoaded) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Playlist',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'See More',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                            color: Color(
                              0xffC6C6C6,
                            )),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _songs(state.songs),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }

  Widget _songs(List<SongEntity> song) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SongPlayer(
                  songEntity: song[index],
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                width: 45,
                child: Icon(
                  Icons.play_arrow_rounded,
                  color: context.isDarkMode
                      ? const Color(0xff959595)
                      : const Color(0xff555555),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? AppColors.darkGrey
                      : const Color(0xffE6E6E6),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    song[index].title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    song[index].artist,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Row(
                children: [
                  Text(song[index].duration.toString().replaceAll('.', ':')),
                  const SizedBox(width: 20),
                  FavoriteButton(songEntity: song[index])
                ],
              )
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: song.length,
    );
  }
}
