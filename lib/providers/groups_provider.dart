import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_medicamentos/helpers/debouncer.dart';
import 'package:guia_medicamentos/models/group_model.dart';
import 'package:guia_medicamentos/models/medicine.dart';
import 'package:guia_medicamentos/models/medicines_response.dart';

import 'package:http/http.dart' as http;

class GroupProvider extends ChangeNotifier {
  
  final site = 'https://vademecumgeriagt.com';
  String _selectedGroup = 'A';

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500), 
    // onValue: 
  );

  final StreamController<List<Medicine>> _suggestionsStreamController = StreamController.broadcast();
  Stream<List<Medicine>> get suggestionStream => _suggestionsStreamController.stream;


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
        'assets/icons/rinon.png',
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
        'assets/icons/sentidos.png',
        'Órganos de los sentidos'),
  ];

  Map<String, List<Medicine>> medicines = {};

  GroupProvider() {
    for (var item in groups) {
      medicines[item.request] = [];
    }
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

    // final url = Uri.parse('http://192.168.1.5:8000/api/medicines?group=$group');
    final url = Uri.parse('$site/api/medicines?group=$group');

    final resp = await http.get(url);

    final medicineResponse = MedicineResponse.fromJson( resp.body );

    medicines[group]!.addAll( medicineResponse.medicines );

    // print(medicines);

    notifyListeners();
  }


  Future<List<Medicine>> searchMedicine(String query) async {

    final url = Uri.parse('$site/api/search/$query');

    final response = await http.get(url);
    final searchResponse = MedicineResponse.fromJson( response.body );

    return searchResponse.medicines;

  }

  void getSuggestionsByQuery(String searchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMedicine(value);
      _suggestionsStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) { 
      debouncer.value = searchTerm;
    });

    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
  }

  
}
