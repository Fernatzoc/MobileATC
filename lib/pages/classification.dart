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
      appBar: AppBar(),
      body: medicines!.isEmpty
          ? const Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: CircularProgressIndicator()),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: medicines.length,
              itemBuilder: (BuildContext context, int index) {
                print('reder');
                return CardMedicine(medicine: medicines[index]);
              }),
    );
  }
}
