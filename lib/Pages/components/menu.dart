import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_floating_widget/animated_floating_widget.dart';
import 'package:animated_text_lerp/animated_text_lerp.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../app/imgs_svg.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  final List<String> menuSections = [
    'Home',
    'Projetos',
    'Conhecimentos',
    'Sobre'
  ];

  int currentIndex = 0;

  final CarouselController _carouselController = CarouselController();

  final Uri _link1 = Uri.parse('https://www.linkedin.com/in/1joao-pedro/');
  final Uri _link2 = Uri.parse('https://github.com/DesenvolvedorJJ');
  final Uri _link3 = Uri.parse('https://www.instagram.com/juao.oliva/');

  Future<void> _launchUrl(Uri url) async {
    await launchUrl(url);
  }

  void goToSection(int index) {
    final router = GoRouter.of(context);
    router.go('/${menuSections[index]}');
  }

  void changeSection(int increment) {
    setState(() {
      currentIndex = (currentIndex + increment) % menuSections.length;
      if (currentIndex < 0) {
        currentIndex += menuSections.length;
      }
    });

    _carouselController.animateToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    SvgImageWidget linkedInIcon =
        const SvgImageWidget(svgAssetPath: 'assets/icon/linkedin.svg');
    SvgImageWidget githubIcon =
        const SvgImageWidget(svgAssetPath: 'assets/icon/github.svg');
    SvgImageWidget instagramIcon =
        const SvgImageWidget(svgAssetPath: 'assets/icon/instagram.svg');

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Drawer(
        child: Row(
          children: [
            // Parte das redes sociais
            Expanded(
              flex: 9,
              child: Container(
                // Adicionando o Container para definir a cor de fundo
                color: Colors.black54,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          'Minhas Redes',
                          style: GoogleFonts.pressStart2p(
                            fontSize: 45,
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Adicionando a cor de texto
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Padding(
                      padding: const EdgeInsets.only(left: 90.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _buildSocialButton(
                            linkedInIcon,
                            'LinkedIn',
                            () {
                              _launchUrl(_link1);
                            },
                            MainAxisAlignment.start,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0),
                          child: _buildSocialButton(
                            githubIcon,
                            'GitHub',
                            () {
                              _launchUrl(_link2);
                            },
                            MainAxisAlignment.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _buildSocialButton(
                          instagramIcon,
                          'Instagram',
                          () {
                            _launchUrl(_link3);
                          },
                          MainAxisAlignment.end,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            // Divisor vertical
            Container(
              color: Colors.black54, // Adicionando cor de fundo
              child: VerticalDivider(
                color: Colors.white, // Cor da linha do divisor
                width: MediaQuery.of(context).size.width * 1 / 9,
                thickness: 5,
              ),
            ),
            // Carrossel
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.black54, // Adicionando cor de fundo
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 70), // Adicione um espaçamento à esquerda
                      child: IconButton(
                        icon: const Icon(Icons.expand_less, size: 50),
                        onPressed: () {
                          changeSection(-1);
                        },
                      ),
                    ),
                    const SizedBox(height: 150), // Ajuste o espaço
                    CarouselSlider(
                      items: menuSections.map((section) {
                        return _buildSectionLink(section);
                      }).toList(),
                      options: CarouselOptions(
                        height: 100, // Ajuste a altura do carrossel
                        enableInfiniteScroll: true,
                        initialPage: currentIndex,
                        scrollDirection: Axis.vertical,
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                      ),
                      carouselController: _carouselController,
                    ),
                    const SizedBox(height: 100), // Ajuste o espaço
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 70), // Adicione um espaçamento à esquerda
                      child: IconButton(
                        icon: const Icon(Icons.expand_more, size: 50),
                        onPressed: () {
                          changeSection(1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton(
    SvgImageWidget icon,
    String title,
    VoidCallback onTap,
    MainAxisAlignment alignment,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Padding(
          padding:
              const EdgeInsets.all(25), // Adicione espaçamento interno aqui
          child: FloatingWidget(
            verticalSpace: 20,
            duration: const Duration(
              seconds: 1,
            ),
            reverseDuration: const Duration(seconds: 1),
            child: Container(
              width: 350,
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(5)),
              child: TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  children: [
                    Container(
                      child: icon,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: GoogleFonts.pressStart2p(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Widget _buildSectionLink(String title) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            goToSection(menuSections.indexOf(title));
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: AnimatedStringText(
              title,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 500),
              textAlign: TextAlign.center,
              style: GoogleFonts.pressStart2p(
                fontSize: 36,
                color: currentIndex == menuSections.indexOf(title)
                    ? Colors.white
                    : Colors.black38,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
