import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:genotypematch/ui/shared/app_colors.dart';
import 'package:genotypematch/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/provider_architecture.dart';

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
      // onModelReady: (model) => model.handleStartUpLogic(),
      onModelReady: (model) => {},
      builder: (context, model, child) => AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext ctx, Widget child) {
          return Scaffold(
            backgroundColor: primaryColor,
            body: SafeArea(
              bottom: false,
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
                      Container(
                        width: 103,
                        height: 103,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(70),
                            bottomRight: Radius.circular(70),
                          ),
                          color: Colors.white,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/blood-drop-blue.svg',
                          width: 40,
                          color: primaryColor,
                        ),
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
