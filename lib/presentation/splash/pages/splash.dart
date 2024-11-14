import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sound_track/core/configs/assets/app_vectors.dart';
import 'package:sound_track/presentation/auth/pages/singnin.dart';
import 'package:sound_track/presentation/home/pages/home.dart';
import 'package:sound_track/presentation/intro/pages/get_started.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _checkUserStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SvgPicture.asset(AppVectors.logo)),
    );
  }

  void _checkUserStatus() {
    // Escucha cambios en el estado de autenticación de Firebase
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      Future.delayed(const Duration(seconds: 2), () {
        if (user != null) {
          // Usuario autenticado, navega a la pantalla de inicio
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Usuario no autenticado, navega a la pantalla de inicio de sesión
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GetStarted()),
          );
        }
      });
    });
  }
}
