import 'package:flutter/material.dart';
import 'package:flutter_animations/widgets/animated_logo.dart';
import 'package:flutter_animations/widgets/logo.dart';

void main() {
  runApp(const AnimationPlaygroundApp());
}

class AnimationPlaygroundApp extends StatelessWidget {
  const AnimationPlaygroundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const LogoApp(),
    const AnimatedLogoApp(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animation Playground'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Logo'),
          BottomNavigationBarItem(icon: Icon(Icons.animation), label: 'Other'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
