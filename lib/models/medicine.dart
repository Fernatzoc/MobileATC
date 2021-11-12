import 'dart:convert';

class Medicine {
    Medicine({
        this.letterGroup,
        this.nameGroup,
        this.descriptionGroup,
        this.codeClassification,
        this.nameClassification,
        this.additionalClassification,
        this.codeSubClassification,
        this.nameSubClassification,
        this.additionalSubClassification,
        this.activePrincipleMed,
        this.pharmaceuticalFormMed,
        this.indicationsMed,
        this.routeDosageMed,
        this.managementRulesMed,
        this.observationsMed,
        this.additionalMed,
    });

    String? letterGroup;
    String? nameGroup;
    String? descriptionGroup;
    String? codeClassification;
    String? nameClassification;
    dynamic additionalClassification;
    String? codeSubClassification;
    String? nameSubClassification;
    dynamic additionalSubClassification;
    String? activePrincipleMed;
    String? pharmaceuticalFormMed;
    String? indicationsMed;
    String? routeDosageMed;
    String? managementRulesMed;
    String? observationsMed;
    dynamic additionalMed;

    factory Medicine.fromJson(String str) => Medicine.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Medicine.fromMap(Map<String, dynamic> json) => Medicine(
        letterGroup: json["letterGroup"],
        nameGroup: json["nameGroup"],
        descriptionGroup: json["descriptionGroup"],
        codeClassification: json["codeClassification"],
        nameClassification: json["nameClassification"],
        additionalClassification: json["additionalClassification"],
        codeSubClassification: json["codeSubClassification"],
        nameSubClassification: json["nameSubClassification"],
        additionalSubClassification: json["additionalSubClassification"],
        activePrincipleMed: json["activePrincipleMed"],
        pharmaceuticalFormMed: json["pharmaceuticalFormMed"],
        indicationsMed: json["indicationsMed"],
        routeDosageMed: json["routeDosageMed"],
        managementRulesMed: json["managementRulesMed"],
        observationsMed: json["observationsMed"],
        additionalMed: json["additionalMed"],
    );

    Map<String, dynamic> toMap() => {
        "letterGroup": letterGroup,
        "nameGroup": nameGroup,
        "descriptionGroup": descriptionGroup,
        "codeClassification": codeClassification,
        "nameClassification": nameClassification,
        "additionalClassification": additionalClassification,
        "codeSubClassification": codeSubClassification,
        "nameSubClassification": nameSubClassification,
        "additionalSubClassification": additionalSubClassification,
        "activePrincipleMed": activePrincipleMed,
        "pharmaceuticalFormMed": pharmaceuticalFormMed,
        "indicationsMed": indicationsMed,
        "routeDosageMed": routeDosageMed,
        "managementRulesMed": managementRulesMed,
        "observationsMed": observationsMed,
        "additionalMed": additionalMed,
    };
}