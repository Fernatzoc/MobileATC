import 'package:flutter/material.dart';
import 'package:guia_medicamentos/helpers/favorites.dart';
import 'package:guia_medicamentos/models/medicine.dart';

class FavoritesProvider with ChangeNotifier {
  FavoritesStorage storage = FavoritesStorage();
  List<Medicine> favorites = [];

  FavoritesProvider() {
    readAllFavorites();
  }

  List<Medicine>? get getFavorites => favorites;

  Future readAllFavorites() async {
    favorites = await storage.readFavorites();
    notifyListeners();
    return favorites;
  }

  Future addFavorite(Medicine medicine) async {
    if (!favorites.any((p) => p.idMedicine == medicine.idMedicine)) {
      favorites.add(medicine);

      await storage.writeFavorites(favorites);
      notifyListeners();
    }
  }

  Future removeFavorite(Medicine medicine) async {
    favorites.removeWhere((p) => p.idMedicine == medicine.idMedicine);

    await storage.writeFavorites(favorites);
    notifyListeners();
  }

  bool isFavorite(Medicine medicine) {
    return favorites.any((p) => p.idMedicine == medicine.idMedicine);
  }
}
