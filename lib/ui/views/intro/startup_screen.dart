import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../shared/app_colors.dart';
import '../../shared/ui_helpers.dart';
import '../../widgets/logo.dart';
import '../../../viewmodels/startup_view_model.dart';

class StartUpScreen extends StatefulWidget {
  @override
  _StartUpScreenState createState() => _StartUpScreenState();
}

class _StartUpScreenState extends State<StartUpScreen>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween<double>(begin: -1.0, end: 0.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn),
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext ctx, Widget child) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              bottom: false,
              top: false,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/patternbg.png"),
                    repeat: ImageRepeat.repeat,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.11),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
                child: Transform(
                  transform: Matrix4.translationValues(
                    animation.value * width,
                    0,
                    0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Logo(
                        bgColor: Colors.white,
                        logoColor: primaryColor,
                        logoName: "blood-drop-blue",
                        size: 103,
                      ),
                      verticalSpace(15),
                      Text(
                        "Blood Match.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
