import 'dart:convert';
import 'medicine.dart';

class MedicineResponse {
    MedicineResponse({
        required this.medicines,
    });

    List<Medicine> medicines;

    factory MedicineResponse.fromJson(String str) => MedicineResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MedicineResponse.fromMap(Map<String, dynamic> json) => MedicineResponse(
        medicines: List<Medicine>.from(json["medicines"].map((x) => Medicine.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "medicines": List<dynamic>.from(medicines.map((x) => x.toMap())),
    };
}


