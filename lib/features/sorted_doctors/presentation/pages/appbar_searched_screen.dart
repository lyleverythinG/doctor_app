import 'package:doctor_app/features/sorted_doctors/presentation/widgets/search_delegate_list_view.dart';
import 'package:doctor_app/features/user_home/domain/model/user_model.dart';
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<UserModel> listOfDoctors;
  final bool? isFromHomeSearch;
  CustomSearchDelegate(
      {required this.listOfDoctors, this.isFromHomeSearch = true});
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
          // Closes the search page and opens back the original page.
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // The results shown after the user submits a search.
    List<UserModel> matchedKeyword = [];
    for (var doctor in listOfDoctors) {
      // Searched bar checks for matching doctor type or name.
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
      // Condition checks for matching doctor type or name.
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
