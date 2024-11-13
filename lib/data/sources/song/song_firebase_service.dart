import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:sound_track/data/models/song/song.dart';
import 'package:sound_track/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewsSongs();
  Future<Either> getPlayList();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  @override
  Future<Either> getNewsSongs() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseData', descending: true)
          .limit(5)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());

        songs.add(
          songModel.toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      print('error = $e');
      return const Left('An error occurred, Please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntity> songs = [];

      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseData', descending: true)
          .get();

      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());

        songs.add(
          songModel.toEntity(),
        );
      }

      return Right(songs);
    } catch (e) {
      print('error = $e');
      return const Left('An error occurred, Please try again.');
    }
  }
}
