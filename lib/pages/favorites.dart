import 'package:flutter/material.dart';
import 'package:guia_medicamentos/providers/favorites_provider.dart';
import 'package:guia_medicamentos/widgets/cardmedicine.dart';
import 'package:provider/provider.dart';


class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

  final medicines = Provider.of<FavoritesProvider>(context).getFavorites;
    
    return Scaffold(
      body: medicines!.isEmpty
          ?  const Center(child: Text('No hay medicamentos guardados.'),
          )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: medicines.length,
              itemBuilder: (BuildContext context, int index) {
                return CardMedicine(medicine: medicines[index]);
              }),
    );
  }
}