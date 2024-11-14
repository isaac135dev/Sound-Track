import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sound_track/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:sound_track/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:sound_track/services_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favoriteButtonUpdate(String songId) async {
    var result = await sl<AddOrRemoveFavoriteSongUseCase>().call(
      params: songId,
    );

    result.fold(
      (l) {},
      (isFavorite) {
        emit(FavoriteButtonUpdated(isFavorite: isFavorite));
      },
    );
  }
}
