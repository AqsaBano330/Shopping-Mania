import 'package:flutter/material.dart';
import 'package:hijabista/Screens/page_view/page_view.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen.gif(
        backgroundColor: Colors.white,
        gifPath: 'assets/images/SplashScreen/SplashScreen.gif',
        gifWidth: 269,
        gifHeight: 474,
        defaultNextScreen: CustomPageView(),
        duration: const Duration(milliseconds: 3515),
        onInit: () async {
          debugPrint("onInit 1");
          await Future.delayed(const Duration(milliseconds: 2000));
          debugPrint("onInit 2");
        },
        onEnd: () async {
          debugPrint("onEnd 1");
          debugPrint("onEnd 2");
        },
      ),
    );
  }
}
