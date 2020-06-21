import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'locator.dart';
import 'managers/dialog_manager.dart';
import 'routes.dart';
import 'services/dialog_service.dart';
import 'services/local_storage_service.dart';
import 'services/navigation_service.dart';
import 'ui/shared/app_colors.dart';
import 'ui/views/intro/startup_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await LocalStorageService.getInstance();
    await setupLocator();
    runApp(MyApp());
  } catch (error) {
    print(error);
    print('Locator setup has failed');
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blood Match',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(child: child),
        ),
      ),
      debugShowCheckedModeBanner: false,
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: primaryColor,
        textTheme: GoogleFonts.manropeTextTheme(),
        primaryTextTheme: GoogleFonts.manropeTextTheme(),
        accentColor: primaryColor,
        indicatorColor: primaryColor,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
        cardColor: primaryColor,
      ),
      routes: appRoutes,
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => StartUpScreen());
      },
    );
  }
}
