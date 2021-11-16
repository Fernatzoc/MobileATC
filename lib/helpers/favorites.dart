import 'dart:convert';
import 'dart:io';

import 'package:guia_medicamentos/models/medicine.dart';
import 'package:path_provider/path_provider.dart';


class FavoritesStorage {

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/flickrfavorites.dat');
  }

  Future<bool> writeFavorites(List<Medicine> favoritesList) async {
    try {
      final file = await _localFile;

      // Read the file
      String json =  jsonEncode(favoritesList);

      // print("JSON writing to file: " + json);

      await file.writeAsString(json, mode: FileMode.write);

      return true;

    } catch (e) {
      // print('error $e');
    }

    return false;
  }

  Future<List<Medicine>> readFavorites() async {
    try {
      final file = await _localFile;

      // Read the file
      String jsonString = await file.readAsString();

      // print("JSON reading from file: " + jsonString);

      Iterable jsonMap = jsonDecode(jsonString);

      List<Medicine> favs = jsonMap.map((parsedJson) => Medicine.fromJson(parsedJson)).toList();

      return favs;

    } catch (e) {
      // print('error');
    }

    return [];
  }
}