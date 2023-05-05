import 'package:doctor_app/features/sorted_doctors/presentation/widgets/search_delegate_list_view.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<UserModel> listOfDoctors;
  final bool? isFromHomeSearch;
  CustomSearchDelegate(
      {required this.listOfDoctors, this.isFromHomeSearch = true});
  //this is the list you want to search
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => 'query',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          //closes the search page and opens back the original page.
          //this is the part that we can leave and close the search bar.
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //this is where we create the UI for the results;
    List<UserModel> matchedKeyword = [];
    for (var doctor in listOfDoctors) {
      // searched bar checks for matching doctor type or name.
      if (doctor.doctorType!.toLowerCase().contains(query.toLowerCase()) ||
          doctor.doctorName!.toLowerCase().contains(query.toLowerCase())) {
        matchedKeyword.add(doctor);
      }
    }
    return SearchDelegateListView(
        isFromHomeSearch: isFromHomeSearch,
        listOfDoctors: listOfDoctors,
        matchedKeyword: matchedKeyword);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<UserModel> matchedKeyword = [];
    for (var doctor in listOfDoctors) {
      // searched bar checks for matching doctor type or name.
      if (doctor.doctorType!.toLowerCase().contains(query.toLowerCase()) ||
          doctor.doctorName!.toLowerCase().contains(query.toLowerCase())) {
        matchedKeyword.add(doctor);
      }
    }
    return SearchDelegateListView(
      listOfDoctors: listOfDoctors,
      matchedKeyword: matchedKeyword,
      isFromHomeSearch: isFromHomeSearch,
    );
  }
}
