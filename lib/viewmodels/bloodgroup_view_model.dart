import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'base_model.dart';
import '../locator.dart';
import '../models/blood_group.dart';
import '../services/navigation_service.dart';
import '../ui/shared/app_colors.dart';
import '../ui/views/app/dashboard.dart';
import '../ui/views/modals/bloodgroup_picker.dart';

class BloodGroupViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  IconData resultIcon = FeatherIcons.loader;
  Color resultColor = green;

  List<BloodGroup> _bloodGroups = [
    BloodGroup(name: "O-", color: Colors.lightBlue),
    BloodGroup(name: "O+", color: Colors.lightGreen),
    BloodGroup(name: "A-", color: Colors.orange),
    BloodGroup(name: "A+", color: Colors.red),
    BloodGroup(name: "B", color: Colors.brown),
    BloodGroup(name: "B+", color: Colors.lightBlue),
    BloodGroup(name: "AB+", color: Colors.lightGreen),
    BloodGroup(name: "AB-", color: Colors.orange),
  ];
  List<BloodGroup> get bloodGroups => _bloodGroups;

  BloodGroup _g1, _g2;
  BloodGroup get g1 => _g1;
  BloodGroup get g2 => _g2;

  select(BloodGroup bGrp, ctx) {
    showBarModalBottomSheet(
      expand: false,
      context: ctx,
      backgroundColor: Colors.transparent,
      builder: (context, scrollController) => BloodGroupPicker(
        scrollController: scrollController,
        bloodGroups: bloodGroups,
        bloodGroup: bGrp,
        onSelect: (BloodGroup bloodGroup) {
          if (bGrp == g1) {
            g1 = bloodGroup;
          } else {
            g2 = bloodGroup;
          }
          Navigator.of(context).pop();
        },
      ),
    );
  }

  set g1(BloodGroup bloodGroup) {
    _g1 = bloodGroup;
    notifyListeners();
  }

  set g2(BloodGroup bloodGroup) {
    _g2 = bloodGroup;
    notifyListeners();
  }

  void computeMatch() {
    if (g1 == null) {
      validate(g1);
      return;
    }
    if (g2 == null) {
      validate(g2);
      return;
    }

    String genDonor = "O-";
    String genReceiver = "AB+";
    List apList = ["O+", "A-"];
    List bpList = ["O+", "B-"];
    List abmList = ["A-", "B-"];

    resultColor = red;
    resultIcon = FeatherIcons.x;

    if (g1.name == g2.name ||
        (g1.name == genDonor) ||
        (g2.name == genReceiver)) {
      resultColor = Colors.green;
      resultIcon = FeatherIcons.check;
    } else if (apList.contains(g1.name) && g2.name == "A+") {
      resultColor = Colors.green;
      resultIcon = FeatherIcons.check;
    } else if (bpList.contains(g1.name) && g2.name == "B+") {
      resultColor = Colors.green;
      resultIcon = FeatherIcons.check;
    } else if (abmList.contains(g1.name) && g2.name == "AB-") {
      resultColor = Colors.green;
      resultIcon = FeatherIcons.check;
    } else {
      resultColor = red;
      resultIcon = FeatherIcons.x;
    }
    notifyListeners();

    return;
  }

  validate(BloodGroup bGrp) {
    String prefix = "";
    if (bGrp == g1) {
      prefix = "Your";
    } else {
      prefix = "Your Partners";
    }
    setShowAlertDialog(
      true,
      message: "$prefix blood group is required",
      onClose: () {
        setShowAlertDialog(false);
      },
    );
  }

  toDashboard() {
    _navigationService.navigateAndClearRoute(
      DashboardScreen.routeName,
    );
  }
}
