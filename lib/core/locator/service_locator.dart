import 'package:dio/dio.dart';
import 'package:doctor_app/core/navigation/navigation_service.dart';
import 'package:doctor_app/core/network/api/user_api.dart';
import 'package:doctor_app/core/network/dio/dio_client.dart';
import 'package:doctor_app/features/user_home/data/repository/user_repo.dart';
import 'package:get_it/get_it.dart';

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
