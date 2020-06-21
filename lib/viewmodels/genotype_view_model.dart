import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'base_model.dart';
import '../models/genotype.dart';
import '../ui/shared/app_colors.dart';

class GenotypeViewModel extends BaseModel {
  IconData resultIcon = FeatherIcons.loader;
  Color resultColor = green;

  List<Genotype> _genotypes = [
    Genotype(name: "AA", color: Colors.lightBlue),
    Genotype(name: "AS", color: Colors.lightGreen),
    Genotype(name: "SS", color: Colors.yellow),
    Genotype(name: "SC", color: Colors.red),
    Genotype(name: "CC", color: Colors.amber),
  ];
  List<Genotype> get genotypes => _genotypes;

  Genotype _p1, _p2;
  Genotype get p1 => _p1;
  Genotype get p2 => _p2;

  set p1(Genotype genotype) {
    _p1 = genotype;
    notifyListeners();
  }

  set p2(Genotype genotype) {
    _p2 = genotype;
    notifyListeners();
  }

  void computeMatch() {
    if (p1 == null) {
      return;
    }
    if (p2 == null) {
      return;
    }

    if(p1.name == "AA" || p2.name == "AA"){
      resultColor = Colors.green;
      resultIcon = FeatherIcons.check;
    } else {
      resultColor = red;
      resultIcon = FeatherIcons.x;
    }

    return;
  }
}
