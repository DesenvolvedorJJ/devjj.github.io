import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/footer.dart';
import 'components/menu.dart';
import 'components/project_carousel.dart';

class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projetos",
          style: GoogleFonts.pressStart2p(
            fontWeight: FontWeight.bold,
            fontSize: 38,
          ),
        ),
        toolbarHeight: size.height / 6,
        backgroundColor: Colors.black54,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
                right: 40), // Adiciona espaçamento à direita
            child: IconButton(
              icon: const Icon(Icons.menu, size: 65),
              onPressed: () {
                _openRightMenu(context);
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black54,
          child: const Column(
            children: [
              Center(
                child: ProjectCarousel(), // Usar o componente ProjectCarousel
              ),
              SizedBox(height: 350),
              Footer(),
            ],
          ),
        ),
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
