import 'package:flutter/material.dart';
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
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext ctx, Widget child) {
          return Scaffold(
            body: SafeArea(
              child: Transform(
                transform: Matrix4.translationValues(
                  animation.value * width,
                  0,
                  0,
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 200,
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
