import 'package:flutter/material.dart';
import 'package:guia_medicamentos/models/medicine.dart';

class CardMedicine extends StatelessWidget {
  final Medicine medicine;

  const CardMedicine({
    Key? key, 
    required this.medicine
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, 'medicine', arguments: medicine),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(5),
        child: ListTile(
          leading: CircleAvatar(
            child: Text('${medicine.letterGroup}'),
            backgroundColor: const Color(0xff21A3B5),
          ),
          title: Text('${medicine.activePrincipleMed}'),
          subtitle: Text('${medicine.letterGroup}${medicine.codeClassification} ${medicine.codeSubClassification}'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
