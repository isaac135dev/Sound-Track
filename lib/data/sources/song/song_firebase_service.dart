import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sound_track/data/models/song/song.dart';
import 'package:sound_track/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseData', descending: true)
          .limit(2)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        songs.add(
          songModel.toEntity(),
        );
      }

      return right(songs);
    } catch (e) {
      return const Left('An error occurred, Please try again.');
    }
  }
}
