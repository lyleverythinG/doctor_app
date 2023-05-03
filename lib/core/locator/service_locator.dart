import 'package:doctor_app/core/navigation/navigation_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;
final kCurrentContext =
    locator<NavigationService>().navigatorKey.currentContext;
final kNavigator = locator<NavigationService>();

void setUpServiceLocator() {
  // Services
  locator.registerSingleton<NavigationService>(NavigationService());
}
