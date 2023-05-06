import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';
import 'package:doctor_app/core/packages/sorted_doctors/sorted_doctors_feature_packages.dart';
import 'package:intl/intl.dart';

class SearchedDoctorScreen extends StatelessWidget {
  final int userIndex;
  final UserModel userModel;
  final bool? isFromHomeSearch;
  const SearchedDoctorScreen(
      {Key? key,
      required this.userModel,
      required this.userIndex,
      this.isFromHomeSearch = true})
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
            if (isFromHomeSearch == true)
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
