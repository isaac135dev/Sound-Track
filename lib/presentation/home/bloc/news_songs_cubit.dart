import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sound_track/domain/usecases/song/get_news_song.dart';
import 'package:sound_track/presentation/home/bloc/news_songs_state.dart';

import '../../../services_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());

  Future<void> getNewsSongs() async {
    var returnedSongs = await sl<GetNewsSongUseCases>().call();

    returnedSongs.fold(
      (l) {
        emit(NewsSongsLoadFailure());
      },
      (data) {
        emit(NewsSongsLoaded(songs: data)); // Emite el estado correctamente
      },
    );
  }
}
