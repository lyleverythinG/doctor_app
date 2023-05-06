import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';
import 'package:doctor_app/features/splash_screen/splash_screen.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNavigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> pushReplaceNavigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: args);
  }

  Future<dynamic> pushNavigateToWidget(Route<dynamic> route) {
    return navigatorKey.currentState!.push(route);
  }

  Future<dynamic> pushReplaceNavigateToWidget(Route<dynamic> route) {
    return navigatorKey.currentState!.pushReplacement(route);
  }

  bool get isFirst => !navigatorKey.currentState!.canPop();

  goBack() {
    return navigatorKey.currentState!.pop();
  }

  goBackToFirst() {
    return navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  static PageRoute getPageRoute(Widget child, RouteSettings settings) {
    return FadeRoute(page: child, routeName: settings.name);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if (settings.arguments != null) {
      if (kDebugMode) {
        print(settings.arguments);
      }
    }
    if (kDebugMode) {
      print(settings.name);
    }

    switch (settings.name) {
      case SplashScreen.route:
        return getPageRoute(const SplashScreen(), settings);
      default:
        return getPageRoute(const SizedBox.shrink(), settings);
    }
  }
}
