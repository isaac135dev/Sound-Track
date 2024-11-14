import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseData;
  final bool isFavorite;
  final String songId;
  SongEntity({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseData,
    required this.isFavorite,
    required this.songId,
  });
}
