import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sound_track/presentation/song_player/bloc/song_player_state.dart';
import 'dart:async';

class SongPlayerCubit extends Cubit<SongPlayerState> {
  final AudioPlayer audioPlayer = AudioPlayer();
  late final StreamSubscription<Duration> _positionSubscription;
  late final StreamSubscription<Duration?> _durationSubscription;

  Duration songDuration = Duration.zero;
  Duration songPosition = Duration.zero;

  SongPlayerCubit() : super(SongPlayerLoading()) {
    // Escucha los cambios de posición
    _positionSubscription = audioPlayer.positionStream.listen((position) {
      songPosition = position;
      _emitSongPlayerLoaded();
    });

    // Escucha los cambios de duración
    _durationSubscription = audioPlayer.durationStream.listen((duration) {
      if (duration != null) {
        songDuration = duration;
        _emitSongPlayerLoaded();
      }
    });
  }

  Future<void> loadSong(String url) async {
    print("Cargando URL de la canción: $url");
    try {
      await audioPlayer.setUrl(url);
      emit(SongPlayerLoaded(duration: songDuration, position: songPosition));
    } catch (e) {
      emit(SongPlayerFailure());
      print("Error al cargar la canción: $e");
    }
  }

  void playOrPauseSong() {
    if (audioPlayer.playing) {
      audioPlayer.pause();
    } else {
      audioPlayer.play();
    }
    _emitSongPlayerLoaded();
  }

  // Método privado para emitir el estado SongPlayerLoaded con duración y posición actualizadas
  void _emitSongPlayerLoaded() {
    emit(SongPlayerLoaded(duration: songDuration, position: songPosition));
  }

  @override
  Future<void> close() {
    _positionSubscription.cancel();
    _durationSubscription.cancel();
    audioPlayer.dispose();
    return super.close();
  }
}
