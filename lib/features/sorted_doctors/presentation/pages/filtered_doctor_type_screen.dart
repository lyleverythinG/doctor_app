import 'package:doctor_app/core/packages/core_packages/core_related_packages.dart';
import 'package:doctor_app/core/packages/sorted_doctors/sorted_doctors_feature_packages.dart';

class FilteredByDoctorTypeScreen extends StatefulWidget {
  final String doctorType;
  const FilteredByDoctorTypeScreen({Key? key, required this.doctorType})
      : super(key: key);

  @override
  State<FilteredByDoctorTypeScreen> createState() =>
      _FilteredByDoctorTypeScreenState();
}

class _FilteredByDoctorTypeScreenState
    extends State<FilteredByDoctorTypeScreen> {
  List<UserModel> sortedDoctorsByType = [];
  @override
  Widget build(BuildContext context) {
    final userState = context.watch<SortedBloc>().state;
    if (userState is SortedDoctorsResult) {
      sortedDoctorsByType = userState.sortedDoctors;
    }
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(
                      listOfDoctors: sortedDoctorsByType,
                      isFromHomeSearch: false));
            },
          ),
        ],
        title: CustomText(
            text: widget.doctorType.toUpperCase(), color: Constants.kBlack87),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16).copyWith(top: 0),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            BlocBuilder<SortedBloc, SortedState>(
              builder: (context, state) {
                if (state is SortedDoctorsResult) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.sortedDoctors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => SearchedDoctorScreen(
                                        isFromHomeSearch: false,
                                        userModel: state.sortedDoctors[index],
                                        userIndex: index)));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            child: DoctorCard(
                              isFromDoctorTypeScreen: true,
                              isFavorite:
                                  state.sortedDoctors[index].isFavorite!,
                              profileImg: 'assets/images/doctor1.jpg',
                              name: state.sortedDoctors[index].doctorName!,
                              doctorType:
                                  state.sortedDoctors[index].doctorType!,
                              addedSince: state.sortedDoctors[index].createdAt!,
                              yearsOfExp:
                                  state.sortedDoctors[index].yearsOfExp!,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                if (state is EmptySortedResult) {
                  return Expanded(
                    child: Center(
                      child: CustomText(
                        text: 'No  ${widget.doctorType} added at the moment',
                      ),
                    ),
                  );
                }
                if (state is SortedUsersLoadingState) {
                  return const Loading();
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
