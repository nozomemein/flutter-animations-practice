import 'package:flutter/material.dart';

class LogoApp extends StatefulWidget {
  const LogoApp({super.key});

  @override
  State<LogoApp> createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..addListener(() {
            setState(() {}); // Flutter HooksのuseStateのリビルドロジックと同じことをしている. Listnerに_element!.markNeedsBuild()を呼び出すことで再描画を促す
          });
    animation = Tween<double>(begin: 0, end: 300).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: animation.value,
        width: animation.value,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: const FlutterLogo(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
