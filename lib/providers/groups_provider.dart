import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_medicamentos/models/group_model.dart';
import 'package:guia_medicamentos/models/medicine.dart';
import 'package:guia_medicamentos/models/medicines_response.dart';

import 'package:http/http.dart' as http;

class GroupProvider extends ChangeNotifier {
  
  String _selectedGroup = 'A';

  List<Group> groups = [
    Group(
        FontAwesomeIcons.clinicMedical,
        'GRUPO A',
        'assets/icons/estomago.png',
        'GRUPO A',
        'Tracto alimentario y metabolismo'),
    Group(
        FontAwesomeIcons.plus,
        'GRUPO B',
        'assets/icons/sangre.png',
        'GRUPO B',
        'Sangre y órganos hemotapoyéticos'),
    Group(
        FontAwesomeIcons.theaterMasks,
        'GRUPO C',
        'assets/icons/corazon.png',
        'GRUPO C',
        'Sistema cardiovascular'),
    Group(
        FontAwesomeIcons.biking,
        'GRUPO D',
        'assets/icons/dermatologo.png',
        'GRUPO D',
        'Dermatológicos'),
    Group(
        FontAwesomeIcons.carCrash,
        'GRUPO G',
        'assets/icons/antiinfecciosos.png',
        'GRUPO G',
        'Sistema genitourinario y hormonas sexuales'),
    Group(
        FontAwesomeIcons.plus,
        'GRUPO H',
        'assets/icons/hormonas.png',
        'GRUPO H',
        'Preparados hormonales sistémicos'),
    Group(
        FontAwesomeIcons.theaterMasks,
        'GRUPO J',
        'assets/icons/antiinfecciosos.png',
        'GRUPO J',
        'Antiinfecciosos para uso sistémico'),
    Group(
        FontAwesomeIcons.biking,
        'GRUPO M',
        'assets/icons/cuerpo-humano.png',
        'GRUPO M',
        'Sistema músculo‐ esquelético'),
    Group(
        FontAwesomeIcons.carCrash,
        'GRUPO N',
        'assets/icons/sistema-nervioso.png',
        'GRUPO N',
        'Sistema nervioso'),
    Group(
        FontAwesomeIcons.plus,
        'GRUPO R',
        'assets/icons/sistema-respiratorio.png',
        'GRUPO R',
        'Sistema respiratorio'),
    Group(
        FontAwesomeIcons.theaterMasks,
        'GRUPO S',
        'assets/icons/cuerpo-humano.png',
        'GRUPO S',
        'órganos de los sentidos'),
  ];

  Map<String, List<Medicine>> medicines = {};

  GroupProvider() {
    groups.forEach((item) {
      medicines[item.title] = [];
    });
  }

  String get selectedGroup => _selectedGroup;

  set selectedGroup(String value) {
    _selectedGroup = value;

    getMeddicinesByGroup(value);
    notifyListeners();
  }

  List<Medicine>? get getMedicineByGroup => medicines[selectedGroup];

  getMeddicinesByGroup(String group) async {

    if( medicines[group]!.isNotEmpty  ) {
      return medicines[group];
    }

    final url = Uri.parse('http://192.168.1.5:8000/api/medicines?letter=quo');

    final resp = await http.get(url);

    final medicineResponse = MedicineResponse.fromJson( resp.body );

    medicines[group]!.addAll( medicineResponse.medicines );

    print(medicines);

    notifyListeners();
  }
  
}
