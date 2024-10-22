import 'package:dartz/dartz.dart';
import 'package:sound_track/core/usecase/usecase.dart';
import 'package:sound_track/data/models/auth/signin_user_req.dart';
import 'package:sound_track/domain/repository/auth/auth.dart';

import '../../../services_locator.dart';

class SigninUseCases implements Usecase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}
