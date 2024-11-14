import 'package:dartz/dartz.dart';
import 'package:sound_track/core/usecase/usecase.dart';
import 'package:sound_track/domain/repository/song/song.dart';
import '../../../services_locator.dart';

class AddOrRemoveFavoriteSongUseCase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSong(params!);
  }
}
