import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  pop() {
    return _navigationKey.currentState.pop();
  }

  Future<dynamic> navigateTo(
    String routeName, {
    dynamic arguments,
    bool replace = false,
  }) {
    if (replace) {
      return _navigationKey.currentState.pushReplacementNamed(
        routeName,
        arguments: arguments,
      );
    }
    return _navigationKey.currentState.pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  Future<dynamic> navigateAndClearRoute(
    String routeName, {
    dynamic arguments,
    String baseRouteName,
  }) {
    return _navigationKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      baseRouteName == null
          ? (Route<dynamic> route) => false
          : ModalRoute.withName(baseRouteName),
      arguments: arguments,
    );
  }

  Future<dynamic> navigateToDashboard(
    Widget route, {
    String baseRouteName,
  }) {
    return _navigationKey.currentState.pushAndRemoveUntil(
      MaterialWithModalsPageRoute(
        settings: RouteSettings(name: '/app/dashboard'),
        builder: (context) => route,
      ),
      baseRouteName == null
          ? (Route<dynamic> route) => false
          : ModalRoute.withName(baseRouteName),
    );
  }
}
