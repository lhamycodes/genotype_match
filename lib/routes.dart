import 'package:flutter/material.dart';

import 'ui/views/app/dashboard.dart';
import 'ui/views/intro/startup_screen.dart';

var appRoutes = <String, WidgetBuilder>{
  '/': (ctx) => StartUpScreen(),

  // General App Routes
  DashboardScreen.routeName: (ctx) => DashboardScreen(),
};
