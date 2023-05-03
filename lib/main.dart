import 'package:doctor_app/core/locator/service_locator.dart';
import 'package:doctor_app/core/navigation/navigation_service.dart';
import 'package:doctor_app/features/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  setUpServiceLocator();
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor App',
      builder: (context, child) => child!,
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: NavigationService.generateRoute,
      initialRoute: SplashScreen.route,
    );
  }
}
