import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'base_model.dart';
import '../locator.dart';
import '../models/genotype.dart';
import '../services/navigation_service.dart';
import '../ui/shared/app_colors.dart';
import '../ui/views/app/blood_group.dart';
import '../ui/views/modals/genotype_picker.dart';

class GenotypeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  IconData resultIcon = FeatherIcons.loader;
  Color resultColor = green;

  List<Genotype> _genotypes = [
    Genotype(name: "AA", color: Colors.lightBlue),
    Genotype(name: "AS", color: Colors.lightGreen),
    Genotype(name: "SS", color: Colors.orange),
    Genotype(name: "SC", color: Colors.red),
    Genotype(name: "CC", color: Colors.brown),
  ];
  List<Genotype> get genotypes => _genotypes;

  Genotype _p1, _p2;
  Genotype get p1 => _p1;
  Genotype get p2 => _p2;

  select(Genotype gen, ctx) {
    showBarModalBottomSheet(
      expand: false,
      context: ctx,
      backgroundColor: Colors.transparent,
      builder: (context) => GenotypePicker(
        genotypes: genotypes,
        genotype: gen,
        onSelect: (Genotype genotype) {
          if (gen == p1) {
            p1 = genotype;
          } else {
            p2 = genotype;
          }
          Navigator.of(context).pop();
        },
      ),
    );
  }

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
      validate(p1);
      return;
    }
    if (p2 == null) {
      validate(p2);
      return;
    }

    if (p1.name == "AA" || p2.name == "AA") {
      resultColor = Colors.green;
      resultIcon = FeatherIcons.check;
    } else {
      resultColor = red;
      resultIcon = FeatherIcons.x;
    }
    notifyListeners();

    return;
  }

  validate(Genotype gen) {
    String prefix = "";
    if (gen == p1) {
      prefix = "Your";
    } else {
      prefix = "Your Partners";
    }
    setShowAlertDialog(
      true,
      message: "$prefix genotype is required",
      onClose: () {
        setShowAlertDialog(false);
      },
    );
  }

  void toBGC() {
    _navigationService.navigateTo(BloodGroupScreen.routeName);
  }
}
