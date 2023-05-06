import 'package:doctor_app/core/network/dio/dio_client.dart';
import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';

GetIt locator = GetIt.instance;
final kCurrentContext =
    locator<NavigationService>().navigatorKey.currentContext;
final kNavigator = locator<NavigationService>();

void setUpServiceLocator() {
  // Services
  locator.registerSingleton<NavigationService>(NavigationService());
  locator.registerSingleton(Dio());
  locator.registerSingleton(DioClient(dio: locator<Dio>()));
  locator.registerSingleton(API(dioClient: locator<DioClient>()));
  locator.registerSingleton(UserRepo(userApi: locator.get<API>()));
}
