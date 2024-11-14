abstract class SongPlayerState {}

class SongPlayerLoading extends SongPlayerState {}

class SongPlayerLoaded extends SongPlayerState {
  final Duration duration;
  final Duration position;

  SongPlayerLoaded({
    required this.duration,
    required this.position,
  });
}

class SongPlayerFailure extends SongPlayerState {
  final String errorMessage;

  SongPlayerFailure(
      [this.errorMessage = "An error occurred while loading the song."]);
}
