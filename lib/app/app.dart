import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Pages/about.dart';
import '../Pages/home.dart';
import '../Pages/projects.dart';
import '../Pages/skills_knowledge.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = GoRouter(
      initialLocation: '/Home',
      routes: [
        GoRoute(
          path: '/Home',
          pageBuilder: (context, state) => const MaterialPage(
            child: Home(),
          ),
        ),
        GoRoute(
          path: '/Projetos',
          pageBuilder: (context, state) => const MaterialPage(
            child: Projects(),
          ),
        ),
        GoRoute(
          path: '/Conhecimentos',
          pageBuilder: (context, state) => const MaterialPage(
            child: SkillsKnowledge(),
          ),
        ),
        GoRoute(
          path: '/Sobre',
          pageBuilder: (context, state) => const MaterialPage(
            child: About(),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
