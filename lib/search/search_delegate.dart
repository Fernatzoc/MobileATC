import 'package:flutter/material.dart';
import 'package:guia_medicamentos/models/medicine.dart';
import 'package:guia_medicamentos/providers/groups_provider.dart';
import 'package:guia_medicamentos/widgets/cardmedicine.dart';
import 'package:provider/provider.dart';

class MedicineSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Medicamento';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return _empyContainer();
    }

    final medicineProvider = Provider.of<GroupProvider>(context, listen: false);
    medicineProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: medicineProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Medicine>> snapshot) {
        if (!snapshot.hasData) return _empyContainer();

        final medicines = snapshot.data!;

        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: medicines.length,
            itemBuilder: (BuildContext context, int index) {
              return CardMedicine(medicine: medicines[index]);
            });
      },
    );
  }

  Widget _empyContainer() {
    return const Center(
      child: Icon(Icons.medication, color: Colors.black38, size: 130),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return _empyContainer();
    }

    final medicineProvider = Provider.of<GroupProvider>(context, listen: false);
    medicineProvider.getSuggestionsByQuery(query);

    return StreamBuilder(
      stream: medicineProvider.suggestionStream,
      builder: (_, AsyncSnapshot<List<Medicine>> snapshot) {
        if (!snapshot.hasData) return _empyContainer();

        final medicines = snapshot.data!;

        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: medicines.length,
            itemBuilder: (BuildContext context, int index) {
              return CardMedicine(medicine: medicines[index]);
            });
      },
    );
  }
}
