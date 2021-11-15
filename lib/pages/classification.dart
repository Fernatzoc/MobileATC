import 'package:flutter/material.dart';
import 'package:guia_medicamentos/providers/groups_provider.dart';
import 'package:guia_medicamentos/widgets/cardmedicine.dart';
import 'package:provider/provider.dart';

class Classification extends StatelessWidget {
  const Classification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final medicines = Provider.of<GroupProvider>(context).getMedicineByGroup;
    final String group =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-group';

    return Scaffold(
      appBar: AppBar(
        title: Text('Grupo $group'),
      ),
      body: medicines!.isEmpty
          ? const Center(child: CircularProgressIndicator(
            color: Color(0xff089cad),
          ))
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: medicines.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMedicine(medicine: medicines[index]);
              }),
    );
  }
}
