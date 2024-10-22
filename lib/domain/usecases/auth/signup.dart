import 'package:dartz/dartz.dart';
import 'package:sound_track/core/usecase/usecase.dart';
import 'package:sound_track/data/models/auth/create_user_req.dart';
import 'package:sound_track/domain/repository/auth/auth.dart';

import '../../../services_locator.dart';

class SignupUseCases implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}
