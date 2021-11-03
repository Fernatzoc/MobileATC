import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Header extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const Header({
    Key? key, 
    required this.icon, 
    required this.titulo, 
    required this.subtitulo, 
    this.color1 = Colors.green, 
    this.color2 = Colors.blueGrey,
  }) : super(key: key); 


  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderbackground(color1: color1, color2: color2),
 /*        Positioned(
          top: -50,
          left: -70,
          child: FaIcon ( icon, size: 250, color: Colors.white.withOpacity(0.2))
        ), */

        Column(
          children: [
            const SizedBox( height: 80, width: double.infinity),
            Text(titulo, style: TextStyle( fontSize: 20, color: colorBlanco )),
            const SizedBox( height: 20),
            Text(subtitulo, style: TextStyle( fontSize: 25, color: colorBlanco, fontWeight: FontWeight.bold )),
            const SizedBox( height: 20),
            FaIcon ( icon, size: 80, color: Colors.white)
          ],
        )
      ],
    );
  }
}

class _IconHeaderbackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderbackground({
    Key? key, 
    required this.color1, 
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only( bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25) ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
           colors: <Color> [
             color1,
             color2,
           ]
        )
      ),
    );
  }
}
