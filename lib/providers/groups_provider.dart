import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guia_medicamentos/models/group_model.dart';

class GroupProvider extends ChangeNotifier {


  String _selectedGroup = 'A';

  List<Group> groups = [
    Group(
        FontAwesomeIcons.clinicMedical,
        'grupo a',
        'assets/icons/estomago.png',
        'GRUPO A',
        'Tracto alimentario y metabolismo',
        const Color(0xff6989F5),
        const Color(0xff906EF5)),
        Group(
        FontAwesomeIcons.clinicMedical,
        'grupo a',
        'assets/icons/estomago.png',
        'GRUPO B',
        'Tracto alimentario y metabolismo',
        const Color(0xff6989F5),
        const Color(0xff906EF5)),
        Group(
        FontAwesomeIcons.clinicMedical,
        'grupo a',
        'assets/icons/estomago.png',
        'GRUPO C',
        'Tracto alimentario y metabolismo',
        const Color(0xff6989F5),
        const Color(0xff906EF5)),
        Group(
        FontAwesomeIcons.clinicMedical,
        'grupo a',
        'assets/icons/estomago.png',
        'GRUPO D',
        'Tracto alimentario y metabolismo',
        const Color(0xff6989F5),
        const Color(0xff906EF5))     
  ];

  Map<String, List<dynamic>> classificationDrugs = {};

  GroupProvider() {
    groups.forEach((item) {
      classificationDrugs[item.title] = [];
    });
  }


  String get selectedGroup => _selectedGroup;

  set selectedGroup( String value ) {
    _selectedGroup = value;

    getMeddicinesByGroup(value);
    notifyListeners();
  }


  getMeddicinesByGroup( String group ) async {
    notifyListeners();
  }


}
