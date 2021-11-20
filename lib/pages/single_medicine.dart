import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:guia_medicamentos/helpers/funcions.dart';
import 'package:guia_medicamentos/models/medicine.dart';
import 'package:guia_medicamentos/providers/favorites_provider.dart';
import 'package:provider/provider.dart';
import 'package:html/parser.dart' show parse;

class SingleMedicine extends StatelessWidget {
  const SingleMedicine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Medicine medicine =
        ModalRoute.of(context)!.settings.arguments as Medicine;
    final favorite = Provider.of<FavoritesProvider>(context);
    final isfavorite = favorite.isFavorite(medicine);
    Color colorPrimary = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(getFirstWord(
            parse(medicine.activePrincipleMed).documentElement!.text)),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                  onTap: () async {
                    if (!isfavorite) {
                      await favorite.addFavorite(medicine);
                      Fluttertoast.showToast(
                          msg: "Guardado",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: const Color(0XFF267ebd),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    } else {
                      await favorite.removeFavorite(medicine);
                      Fluttertoast.showToast(
                          msg: "Eliminado",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: const Color(0XFFe53935),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: isfavorite
                      ? const Icon(
                          Icons.bookmark,
                          size: 26.0,
                          color: Colors.white,
                        )
                      : const Icon(
                          Icons.bookmark_add_outlined,
                          size: 26.0,
                          color: Colors.white,
                        ))),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5.0),
          margin: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color(0XFFEDEDED),
                    borderRadius: BorderRadius.circular(6.0)),
                width: double.infinity,
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                        child: Text('Principo Activo',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0))),
                    const SizedBox(height: 5.0),
                    Center(
                        child: Text(
                      parse(medicine.activePrincipleMed).documentElement!.text,
                      style: const TextStyle(fontSize: 18.0),
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              if (medicine.criterionMed == 'START')
                Column(
                  children: [
                    _CardInfo(
                        title:
                            'Criterio para un uso correcto en personas mayores',
                        color: const Color(0XFF00e676).withOpacity(0.2),
                        code: medicine.criterionMed.toString(),
                        name:
                            'tratamiento indicado y apropiado. Este medicamento puede ser considerado en personas de 65 o más años'),
                    const SizedBox(height: 15.0),
                  ],
                ),
              if (medicine.criterionMed == 'STOPP')
                Column(
                  children: [
                    _CardInfo(
                        title:
                            'Criterio para un uso correcto en personas mayores',
                        color: const Color(0XFFd50000).withOpacity(0.2),
                        code: medicine.criterionMed.toString(),
                        name:
                            'potencialmente inapropiadas en personas mayores'),
                    const SizedBox(height: 15.0),
                  ],
                ),
              _CardInfo(
                  title: 'Forma Farmaceutica',
                  color: const Color(0XFFEDEDED),
                  code: medicine.pharmaceuticalFormMed.toString(),
                  name: ''),
              const SizedBox(height: 15.0),
              _CardInfo(
                  title: 'Indicaciones',
                  color: const Color(0XFFEDEDED),
                  code: medicine.indicationsMed.toString(),
                  name: ''),
              const SizedBox(height: 15.0),
              _CardInfo(
                  title: 'Via Y Posologia',
                  color: const Color(0XFFEDEDED),
                  code: medicine.routeDosageMed.toString(),
                  name: ''),
              const SizedBox(height: 15.0),
              _CardInfo(
                  title: 'Normas De Administración',
                  color: const Color(0XFFEDEDED),
                  code: medicine.managementRulesMed.toString(),
                  name: ''),
              const SizedBox(height: 15.0),
              if (medicine.observationsMed!.isNotEmpty)
                Column(
                  children: [
                    _CardInfo(
                        title: 'Observaciones',
                        color: const Color(0XFFEDEDED),
                        code: medicine.observationsMed.toString(),
                        name: ''),
                    const SizedBox(height: 15.0),
                  ],
                ),
              _CardInfo(
                  title: 'Grupo',
                  color: colorPrimary.withOpacity(0.2),
                  code: medicine.letterGroup.toString(),
                  name: medicine.nameGroup.toString()),
              const SizedBox(height: 15.0),
              _CardInfo(
                  title: 'Clasificación',
                  color: colorPrimary.withOpacity(0.2),
                  code: medicine.codeClassification.toString(),
                  name: medicine.nameClassification.toString()),
              const SizedBox(height: 15.0),
              if (medicine.codeSubClassification != null)
                Column(
                  children: [
                    _CardInfo(
                        title: 'Subclasificación',
                        color: colorPrimary.withOpacity(0.2),
                        code: medicine.codeSubClassification.toString(),
                        name: medicine.nameSubClassification.toString()),
                    const SizedBox(height: 15.0),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardInfo extends StatelessWidget {
  const _CardInfo({
    Key? key,
    required this.color,
    required this.title,
    required this.code,
    required this.name,
  }) : super(key: key);

  final Color color;
  final String title;
  final String code;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(6.0)),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 5),
          Text(
            parse(code).documentElement!.text +
                ' ' +
                parse(name).documentElement!.text,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
