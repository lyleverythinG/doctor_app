import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';

class SplashScreen extends StatefulWidget {
  static const String route = 'splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final Timer _timer;
  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () async {
      await kNavigator
          .pushReplaceNavigateToWidget(SlideLeftRoute(page: const Home()));
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Lottie.asset(
            'assets/images/splash_screen.json',
            repeat: false,
          ),
        ),
      ),
    );
  }
}
