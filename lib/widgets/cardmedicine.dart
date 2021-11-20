import 'package:flutter/material.dart';
import 'package:guia_medicamentos/helpers/funcions.dart';
import 'package:guia_medicamentos/models/medicine.dart';
import 'package:html/parser.dart' show parse;

class CardMedicine extends StatelessWidget {
  final Medicine medicine;

  const CardMedicine({Key? key, required this.medicine}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.pushNamed(context, 'medicine', arguments: medicine),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(5),
        child: ListTile(
          leading: CircleAvatar(
            child: Text(parse(medicine.letterGroup).documentElement!.text),
            backgroundColor: const Color(0xff267ebd),
          ),
          title: Text(getFirstWord(
              parse(medicine.activePrincipleMed).documentElement!.text)),
          subtitle: Text('${medicine.codeClassification}'),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
