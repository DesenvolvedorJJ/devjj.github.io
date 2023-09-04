import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
import 'components/footer.dart';
import 'components/menu.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sobre mim",
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
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 80),
              SizedBox(
                child: Column(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: size.height * 0.8,
                        width: size.width,
                        child: Container(
                          padding: const EdgeInsets.only(left: 150, right: 150),
                          child: Column(
                            children: [
                              Text(
                                "Olá, eu sou João Oliveira",
                                style: GoogleFonts.bungee(
                                  fontSize: 32.0,
                                ),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              Text(
                                "Olá! Sou um profissional de tecnologia da informação em busca de desafios que ampliem minha expertise em desenvolvimento, análise e gerenciamento de sistemas. Atualmente, estou finalizando meu curso técnico em Desenvolvimento de Sistemas, com um foco sólido em aprimorar minhas habilidades técnicas."
                                "\n\nPossuo experiência em manutenção de dispositivos eletrônicos, programação em diversas linguagens, gerenciamento de sistemas e desenvolvimento de scripts. Também sou proficientemente versado em tecnologias como Git, Docker, AWS e metodologias ágeis como Scrum."
                                "\n\nEstou determinado a continuar evoluindo na área de TI, buscando oportunidades para aplicar meu conhecimento e contribuir de maneira significativa para o cenário tecnológico.",
                                style: GoogleFonts.overlock(
                                  fontSize: 22.0,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      child: Column(
                        children: [
                          SectionTitle("Experiências Profissionais"),
                          ProfessionalInfoItem("Cargo:",
                              "\nEstagiário/Bolsista em Engenharia de Dados\n\n"),
                          ProfessionalInfoItem("Empresa:", "\nCompass UOL"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    const Column(
                      children: [
                        SectionTitle("Informações Acadêmicas"),
                        AcademicInfoItem("Grau:",
                            "\nTécnico em Desenvolvimento de Sistemas\n\n"),
                        AcademicInfoItem("Instituição:", "\nIFPA campus Belém"),
                      ],
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    const Column(
                      children: [
                        Footer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.transparent,
      child: Text(
        title,
        style: GoogleFonts.contrailOne(
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProfessionalInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const ProfessionalInfoItem(this.label, this.value, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.galindo(
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        value,
        style: GoogleFonts.brunoAce(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class AcademicInfoItem extends StatelessWidget {
  final String label;
  final String value;

  const AcademicInfoItem(this.label, this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: GoogleFonts.galindo(
          fontSize: 20.0,
        ),
      ),
      subtitle: Text(
        value,
        style: GoogleFonts.brunoAce(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
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
