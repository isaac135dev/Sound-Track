import 'package:dartz/dartz.dart';
import 'package:sound_track/core/usecase/usecase.dart';
import 'package:sound_track/domain/repository/song/song.dart';
import '../../../services_locator.dart';

class IsFavoriteSongUseCase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
}
