import '../../../../core/packages/common_packages/common_packages.dart';
import '../../../../core/packages/sorted_doctors/sorted_doctors_feature_packages.dart';
import '../../../../core/packages/user_home_feature_packages/user_home_related_packages.dart';

class SearchDelegateListView extends StatelessWidget {
  final List<UserModel> listOfDoctors;
  final List<UserModel> matchedKeyword;
  final bool? isFromHomeSearch;
  const SearchDelegateListView(
      {Key? key,
      required this.listOfDoctors,
      required this.matchedKeyword,
      this.isFromHomeSearch = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: matchedKeyword.length,
      itemBuilder: ((context, index) {
        // Specific doctor from the list of doctors
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
            // Closes the keyboard when navigating to other screen to avoid overflows
            FocusManager.instance.primaryFocus?.unfocus();
            // The index/pos of the current user in the actual doctors list from user bloc.
            int userIndex = listOfDoctors.indexOf(specificDoctor);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (c) => SearchedDoctorScreen(
                          isFromHomeSearch: isFromHomeSearch,
                          userIndex: userIndex,
                          userModel: matchedKeyword[index],
                        )));
          },
        );
      }),
    );
  }
}
