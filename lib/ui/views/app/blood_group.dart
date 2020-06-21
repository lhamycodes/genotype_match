import 'package:flutter/material.dart';
import 'package:genotypematch/ui/widgets/alert_overlay.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../shared/app_colors.dart';
import '../../shared/ui_helpers.dart';

import '../../widgets/action_card.dart';
import '../../widgets/add_action.dart';
import '../../widgets/logo.dart';
import '../../widgets/vertical_divide.dart';
import '../../../viewmodels/bloodgroup_view_model.dart';

class BloodGroupScreen extends StatefulWidget {
  static const routeName = '/app/blood-group';

  @override
  _BloodGroupScreenState createState() => _BloodGroupScreenState();
}

class _BloodGroupScreenState extends State<BloodGroupScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<BloodGroupViewModel>.withConsumer(
      viewModel: BloodGroupViewModel(),
      onModelReady: (model) => {},
      builder: (context, model, child) => AlertOverlay(
        show: model.showAlertDialog,
        alertContent: alertDialogContent(
          title: model.alertDialogTitle,
          message: model.alertDialogMessage,
          onTap: model.alertDialogOnClose,
        ),
        child: Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6.0,
                        color: Color(0xFFDBD9E1),
                        offset: Offset(6.0, 7.0),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(
                    top: 20,
                    bottom: 30,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Blood Match.",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 19,
                            ),
                          ),
                          Logo(
                            logoName: "blood-drop-white",
                            size: 45,
                            bgColor: primaryColor,
                            logoColor: Colors.white,
                          ),
                        ],
                      ),
                      verticalSpace(20),
                      Row(
                        children: <Widget>[
                          ActionCard(
                            bgColor: Colors.white,
                            textColor: primaryColor,
                            iconColor: primaryColor,
                            title: "Genotype Match Checker",
                            icon: "gmc",
                            onTap: () => model.toDashboard(),
                          ),
                          horizontalSpace(12),
                          ActionCard(
                            bgColor: primaryColor,
                            textColor: Colors.white,
                            iconColor: Colors.white,
                            title: "Blood Group Compatibility",
                            icon: "bgc",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/patternbg.png"),
                        repeat: ImageRepeat.repeat,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.07),
                          BlendMode.dstATop,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 70),
                          child: Column(
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  AddAction(
                                    label: "Donor's Blood Group",
                                    title: model.g1?.name ?? null,
                                    onTap: () {
                                      model.select(model.g1, context);
                                    },
                                    bgColor: model.g1?.color ?? grey,
                                  ),
                                  AddAction(
                                    label: "Receivers Blood Group",
                                    title: model.g2?.name ?? null,
                                    onTap: () {
                                      model.select(model.g2, context);
                                    },
                                    bgColor: model.g2?.color ?? grey,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 55, right: 60),
                                child: Container(color: grey, height: 1.2),
                              ),
                              VerticalDivide(height: 40),
                              Container(
                                height: Theme.of(context).buttonTheme.height,
                                child: RaisedButton(
                                  child: Text("Match Status"),
                                  onPressed: () => model.computeMatch(),
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        VerticalDivide(height: 60),
                        AddAction(
                          icon: model.resultIcon,
                          bgColor: model.resultColor,
                          border: false,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
