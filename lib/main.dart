import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/locator/service_locator.dart';
import 'package:doctor_app/core/navigation/navigation_service.dart';
import 'package:doctor_app/core/network/api/user_api.dart';
import 'package:doctor_app/features/splash_screen/splash_screen.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return RepositoryProvider(
      create: ((context) => UserRepo(userApi: locator.get<API>())),
      child: BlocProvider(
        create: (context) =>
            UserBloc(userRepo: RepositoryProvider.of<UserRepo>(context)),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Doctor App',
          theme: Constants.aTheme,
          builder: (context, child) => child!,
          navigatorKey: locator<NavigationService>().navigatorKey,
          onGenerateRoute: NavigationService.generateRoute,
          initialRoute: SplashScreen.route,
        ),
      ),
    );
  }
}
