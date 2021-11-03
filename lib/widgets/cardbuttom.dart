import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_medicamentos/models/group_model.dart';
import 'package:guia_medicamentos/providers/groups_provider.dart';
import 'package:provider/provider.dart';

class CardButtom extends StatelessWidget {

  final Group group;



  const CardButtom({ 
    Key? key, 
    required this.group
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // print('${ group.title }');
        final groupProvider = Provider.of<GroupProvider>(context, listen: false);
        groupProvider.selectedGroup = group.title;
        Navigator.pushNamed(context, 'classification', arguments: group.title);
      },
      child: Stack(
        children: [
          _CardButtomBackground(color1: group.color1, color2: group.color2, icon: group.icon, image: group.image,),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 140, width: 40 ),
              Image(image: AssetImage(group.image), height: 50, width: 50, color: Colors.white,),
              const SizedBox(width: 20 ),
              Text(group.title, style: const TextStyle( color: Colors.white, fontSize: 18  )),
              const SizedBox(width: 20 ),
              Expanded(child: Text(group.subtitle, style: const TextStyle( color: Colors.white, fontSize: 18  ))),
              const SizedBox(width: 15 ),
              const FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white),
              const SizedBox(width: 40 ),
    
            ],
          )
        ],
      ),
    );
  }
}

class _CardButtomBackground extends StatelessWidget {

  final IconData icon;
  final String image;
  final Color color1;
  final Color color2;

  const _CardButtomBackground({
    Key? key, 
    required this.icon,
    required this.image,
    this.color1 = Colors.green, 
    this.color2 = Colors.grey, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              // child: FaIcon( icon, size: 150, color: Colors.white.withOpacity(0.2))
              child: Image(image: AssetImage(image), height: 150, width: 200, color: Colors.white.withOpacity(0.2),),
            )
          ],
        ),
      ),
      width: double.infinity,
      height: 100,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow> [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: const Offset(4,6), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            color1,
            color2,
          ]
        )
      ),
    );
  }
}