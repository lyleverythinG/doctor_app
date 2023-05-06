import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/local_storage/adaptor/user_adaptor.dart';
import 'package:doctor_app/core/locator/service_locator.dart';
import 'package:doctor_app/core/navigation/navigation_service.dart';
import 'package:doctor_app/core/network/api/user_api.dart';
import 'package:doctor_app/features/sorted_doctors/presentation/bloc/bloc/sorted_bloc.dart';
import 'package:doctor_app/features/splash_screen/splash_screen.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:doctor_app/features/user_home/presentation/bloc/bloc/user_bloc.dart';
import 'package:doctor_app/features/users_from_api/domain/users_api_model.dart';
import 'package:doctor_app/features/users_from_api/presentation/bloc/bloc/user_api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserApiModelAdapter());
  await Hive.openBox<UserApiModel>('reqresUsers');
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
      child: MultiBlocProvider(
        providers: [
          // This Bloc is used for CRUD functionalities.
          BlocProvider(
            create: (context) =>
                UserBloc(userRepo: RepositoryProvider.of<UserRepo>(context)),
          ),
          // This Bloc is used for sorting/filter the doctor by type.
          BlocProvider(
            create: (context) => SortedBloc(),
          ),
          // This Bloc is used for fetching users from the api.
          BlocProvider(
            create: (context) =>
                UserApiBloc(userRepo: RepositoryProvider.of<UserRepo>(context)),
          ),
        ],
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
