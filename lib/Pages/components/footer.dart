import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  double _borderRadius = 0.0;
  Color _borderColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    while (true) {
      await Future.delayed(const Duration(seconds: 2));
      setState(() {
        _borderRadius = _borderRadius == 0.0 ? 20.0 : 0.0;
        _borderColor =
            _borderColor == Colors.black ? Colors.white : Colors.black;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(seconds: 2), // Duração da animação
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(color: _borderColor, width: 10),
      ),
      width: size.width,
      height: size.height * 0.35,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    ">_DEVJJ",
                    style: GoogleFonts.pressStart2p(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 38.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ],
          ),
          _buildCardColumn(
            "Localização ",
            "Pará, Brazil",
            icon: Icons.location_on,
            width: 300,
            height: 150,
          ),
          _buildCardColumn(
            "E-mail ",
            "oliveirajoaopdr@gmail.com",
            icon: Icons.mail,
            width: 300,
            height: 150,
          ),
          _buildCardColumn(
            "Celular/Whatsapp",
            "+55 (91)992298140",
            icon: Icons.contact_phone,
            width: 300,
            height: 150,
          ),
        ],
      ),
    );
  }

  Widget _buildCardColumn(
    String title,
    String content, {
    required IconData icon,
    required double width,
    required double height,
  }) {
    return Card(
      elevation: 5,
      color: Colors.transparent,
      child: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.phudu(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 22,
                  ),
                  const SizedBox(height: 25),
                  Text(
                    content,
                    style: GoogleFonts.comfortaa(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
