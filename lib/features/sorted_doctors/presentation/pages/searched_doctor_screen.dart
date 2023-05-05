import 'package:doctor_app/core/constants/constants.dart';
import 'package:doctor_app/core/reusable_widgets/custom_elevated_button.dart';
import 'package:doctor_app/core/reusable_widgets/custom_text.dart';
import 'package:doctor_app/features/sorted_doctors/presentation/widgets/profile_circle_avatar.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:doctor_app/features/user_home/presentation/pages/edit_doctor_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SearchedDoctorScreen extends StatelessWidget {
  final int userIndex;
  final UserModel userModel;
  const SearchedDoctorScreen(
      {Key? key, required this.userModel, required this.userIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Constants.kWhite,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomText(
              text: 'Profile Picture'.toUpperCase(),
            ),
            const ProfileCircleAvatar(),
            CustomText(text: 'Doctor Name:.'.toUpperCase()),
            CustomText(text: userModel.doctorName!),
            CustomText(text: 'Doctor Type:'.toUpperCase()),
            CustomText(text: userModel.doctorType!),
            CustomText(text: 'Years of Experience:'.toUpperCase()),
            CustomText(text: userModel.yearsOfExp!),
            CustomText(text: 'Added Since:'.toUpperCase()),
            CustomText(
                text: DateFormat.yMMMMd()
                    .format(DateTime.parse(userModel.createdAt!))),
            CustomElevatedButton(
              text: 'Update Doctor Information'.toUpperCase(),
              fontWeight: FontWeight.bold,
              fontSize: 16,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditDoctorInfoScreen(
                            userModel: userModel,
                            userIndex: userIndex,
                            isWhiteAppBar: true)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
