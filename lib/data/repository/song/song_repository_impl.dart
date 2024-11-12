import 'package:dartz/dartz.dart';
import 'package:sound_track/data/sources/song/song_firebase_service.dart';
import 'package:sound_track/domain/repository/song/song.dart';

import '../../../services_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }
}
