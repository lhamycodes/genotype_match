import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../shared/app_colors.dart';
import '../../shared/ui_helpers.dart';

import '../../widgets/action_card.dart';
import '../../widgets/add_action.dart';
import '../../widgets/logo.dart';
import '../../widgets/vertical_divide.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/app/dashboard';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        bgColor: primaryColor,
                        textColor: Colors.white,
                        title: "Genotype Match Checker",
                        icon: "gmc",
                      ),
                      horizontalSpace(12),
                      ActionCard(
                        bgColor: Colors.white,
                        textColor: primaryColor,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              AddAction(label: "My Genotype"),
                              AddAction(label: "My Patner's"),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 35),
                            child: Container(color: grey, height: 1.2),
                          ),
                          VerticalDivide(height: 40),
                          Container(
                            height: Theme.of(context).buttonTheme.height,
                            child: RaisedButton(
                              child: Text("Match Status"),
                              onPressed: () {},
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    VerticalDivide(height: 100),
                    AddAction(
                      icon: FeatherIcons.loader,
                      bgColor: red,
                      border: false,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
