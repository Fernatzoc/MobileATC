import 'package:flutter/material.dart';
import 'package:guia_medicamentos/models/medicine.dart';

class SingleMedicine extends StatelessWidget {
  const SingleMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final Medicine medicine = ModalRoute.of(context)!.settings.arguments as Medicine;

    print('${medicine.activePrincipleMed}');

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('PRINCIPIO ACTIVO'),
          Text('${medicine.activePrincipleMed}'),
          Text('FORMA FARMACEUTICA'),
          Text('${medicine.pharmaceuticalFormMed}'),
          Text('INDICACIONES'),
          Text('${medicine.indicationsMed}'),
          Text('VIA Y POSOLOGIA'),
          Text('${medicine.routeDosageMed}'),
          Text('NORMAS DE ADMINISTRACIÓN'),
          Text('${medicine.managementRulesMed}'),
          Text('OBSERVACIONES'),
          Text('${medicine.observationsMed}'),
        ],
      ),
    );
  }
}
