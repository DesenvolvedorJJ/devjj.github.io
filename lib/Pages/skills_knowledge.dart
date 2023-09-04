import 'package:flutter/material.dart';
import 'components/menu.dart';

class SkillsKnowledge extends StatelessWidget {
  const SkillsKnowledge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              _openRightMenu(context);
            },
          ),
        ],
      ),
      body: const Center(
        child: Text("Conhecimentos e Habilidades"),
      ),
    );
  }

  void _openRightMenu(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => const Menu(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(seconds: 2), // Duração da transição
      ),
    );
  }
}
