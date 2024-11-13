import 'package:get_it/get_it.dart';
import 'package:sound_track/data/repository/song/song_repository_impl.dart';
import 'package:sound_track/data/sources/auth/auth_firebase_service.dart';
import 'package:sound_track/data/sources/song/song_firebase_service.dart';
import 'package:sound_track/domain/repository/auth/auth.dart';
import 'package:sound_track/data/repository/auth/auth_repository_impl.dart';
import 'package:sound_track/domain/repository/song/song.dart';
import 'package:sound_track/domain/usecases/auth/signin.dart';
import 'package:sound_track/domain/usecases/auth/signup.dart';
import 'package:sound_track/domain/usecases/song/get_news_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());

  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());

  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());

  sl.registerSingleton<SignupUseCases>(SignupUseCases());

  sl.registerSingleton<SigninUseCases>(SigninUseCases());

  sl.registerSingleton<GetNewsSongUseCases>(GetNewsSongUseCases());
}
