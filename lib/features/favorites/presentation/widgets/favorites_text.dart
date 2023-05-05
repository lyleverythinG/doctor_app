import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';

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
