import 'package:flutter/material.dart';

class AnimatedLogoApp extends StatefulWidget {
  const AnimatedLogoApp({super.key});

  @override
  State<AnimatedLogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<AnimatedLogoApp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) => AnimatedLogo(animation: animation);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({super.key, required Animation<double> animation})
      : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: const FlutterLogo(),
      ),
    );
  }
}
