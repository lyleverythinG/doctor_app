import 'package:doctor_app/features/sorted_doctors/presentation/pages/searched_doctor_screen.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class SearchDelegateListView extends StatelessWidget {
  final List<UserModel> listOfDoctors;
  final List<UserModel> matchedKeyword;
  const SearchDelegateListView(
      {Key? key, required this.listOfDoctors, required this.matchedKeyword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matchedKeyword.length,
      itemBuilder: ((context, index) {
        // specific doctor from the list of doctors
        var specificDoctor = matchedKeyword[index];
        return ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/doctor1.jpg'),
              ),
            ),
          ),
          title: Text(specificDoctor.doctorName!),
          subtitle: Text(specificDoctor.doctorType!),
          onTap: () {
            //closes the keyboard when navigating to other screen to avoid overflows
            FocusManager.instance.primaryFocus?.unfocus();
            // this is the index/pos of the current user in the actual doctors list from user bloc.
            int userIndex = listOfDoctors.indexOf(specificDoctor);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => SearchedDoctorScreen(
                          userIndex: userIndex,
                          userModel: matchedKeyword[index],
                        )));
          },
        );
      }),
    );
  }
}