import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';

class NoFavoritesText extends StatelessWidget {
  const NoFavoritesText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.75,
      child: const Center(
        child: CustomText(
          text: 'No favorites',
          fontSize: 18,
        ),
      ),
    );
  }
}
