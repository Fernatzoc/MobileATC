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
        'A',
        'assets/icons/estomago.png',
        'Tracto alimentario y metabolismo'),
    Group(
        FontAwesomeIcons.plus,
        'B',
        'assets/icons/sangre.png',
        'Sangre y órganos hemotapoyéticos'),
    Group(
        FontAwesomeIcons.theaterMasks,
        'C',
        'assets/icons/corazon.png',
        'Sistema cardiovascular'),
    Group(
        FontAwesomeIcons.biking,
        'D',
        'assets/icons/dermatologo.png',
        'Dermatológicos'),
    Group(
        FontAwesomeIcons.carCrash,
        'G',
        'assets/icons/antiinfecciosos.png',
        'Sistema genitourinario y hormonas sexuales'),
    Group(
        FontAwesomeIcons.plus,
        'H',
        'assets/icons/hormonas.png',
        'Preparados hormonales sistémicos'),
    Group(
        FontAwesomeIcons.theaterMasks,
        'J',
        'assets/icons/antiinfecciosos.png',
        'Antiinfecciosos para uso sistémico'),
    Group(
        FontAwesomeIcons.biking,
        'M',
        'assets/icons/cuerpo-humano.png',
        'Sistema músculo‐ esquelético'),
    Group(
        FontAwesomeIcons.carCrash,
        'N',
        'assets/icons/sistema-nervioso.png',
        'Sistema nervioso'),
    Group(
        FontAwesomeIcons.plus,
        'R',
        'assets/icons/sistema-respiratorio.png',
        'Sistema respiratorio'),
    Group(
        FontAwesomeIcons.theaterMasks,
        'S',
        'assets/icons/cuerpo-humano.png',
        'órganos de los sentidos'),
  ];

  Map<String, List<Medicine>> medicines = {};

  GroupProvider() {
    groups.forEach((item) {
      medicines[item.request] = [];
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

    final url = Uri.parse('http://192.168.1.5:8000/api/medicines?letter=${group}');

    final resp = await http.get(url);

    final medicineResponse = MedicineResponse.fromJson( resp.body );

    medicines[group]!.addAll( medicineResponse.medicines );

    print(medicines);

    notifyListeners();
  }
  
}
