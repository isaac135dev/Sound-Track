import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:sound_track/domain/usecases/song/get_play_list.dart';
import 'package:sound_track/presentation/home/bloc/play_list_state.dart';

import '../../../services_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());

  Future<void> getPlayList() async {
    var returnedSongs = await sl<GetPlayListUseCases>().call();

    returnedSongs.fold(
      (l) {
        emit(PlayListFailure());
      },
      (data) {
        emit(PlayListLoaded(songs: data)); // Emite el estado correctamente
      },
    );
  }
}
