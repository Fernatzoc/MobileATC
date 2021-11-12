import 'package:flutter/material.dart';
import 'package:guia_medicamentos/pages/classification.dart';
import 'package:guia_medicamentos/pages/pages.dart';
import 'package:guia_medicamentos/pages/single_medicine.dart';

final Map<String, Widget Function(BuildContext) > appRoputes = {

  'home'           : (_) => const HomePage(),
  'classification' : (_) => const Classification(),
  'medicine'       : (_) => const SingleMedicine(),

};