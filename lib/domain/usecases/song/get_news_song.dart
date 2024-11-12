import 'package:dartz/dartz.dart';
import 'package:sound_track/core/usecase/usecase.dart';
import 'package:sound_track/data/repository/song/song_repository_impl.dart';
import '../../../services_locator.dart';

class GetNewsSongUseCases implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepositoryImpl>().getNewsSongs();
  }
}
