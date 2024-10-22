import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sound_track/common/helpers/is_dark_mode.dart';
import 'package:sound_track/common/widgets/button/basic_app_button.dart';
import 'package:sound_track/core/configs/assets/app_images.dart';
import 'package:sound_track/core/configs/assets/app_vectors.dart';
import 'package:sound_track/core/configs/themes/app_colors.dart';
import 'package:sound_track/presentation/auth/pages/singnin.dart';
import 'package:sound_track/presentation/auth/pages/singup.dart';

import '../../../common/widgets/appbar/app_bar.dart';

class SignupOrSiginin extends StatelessWidget {
  const SignupOrSiginin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BasicAppBar(),
          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(AppImages.authBG),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppVectors.logo),
                  const SizedBox(height: 55),
                  const Text(
                    'Enjoy Listening To Music',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 21),
                  const Text(
                    'Spotify is a proprietary Swedish audio streaming and media services provider',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                        color: AppColors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicAppButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => SingUpPage(),
                              ),
                            );
                          },
                          text: 'Register',
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        flex: 1,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    SingninPage(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              'Sing in',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
