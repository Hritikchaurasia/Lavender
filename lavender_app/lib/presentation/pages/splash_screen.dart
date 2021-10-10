import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';
import 'base_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: ListView(
          shrinkWrap: true,
          children: [
            Lottie.asset(
                'assets/images/splash_screen_animation_lottie_json.json',
                width: width,
                height: width,
                fit: BoxFit.fill,
                controller: _animationController, onLoaded: (composition) {
              _animationController
                ..duration = composition.duration
                ..forward().whenComplete(() => Navigator.of(context)
                        .pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) {
                      return BaseScreen();
                    }), (route) => false));
            }),
            sized30,
            const Text(
              'LAVENDER',
              style: logoTextStyle,
              textAlign: TextAlign.center,
            )
          ],
        )),
      ),
    );
  }
}
