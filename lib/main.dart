import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';
import 'package:doctor_app/core/packages/sorted_doctors/sorted_doctors_feature_packages.dart';
import 'package:doctor_app/core/packages/users_from_api_feature_packages/users_from_api_packages.dart';
import 'package:doctor_app/features/splash_screen/splash_screen.dart';

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
