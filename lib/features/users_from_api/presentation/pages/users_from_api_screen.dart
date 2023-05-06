import '../../../../core/packages/common_packages/common_packages.dart';
import '../../../../core/packages/users_from_api_feature_packages/users_from_api_packages.dart';

class UserFromApiScreen extends StatelessWidget {
  const UserFromApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            BlocBuilder<UserApiBloc, UserApiState>(
              builder: (context, state) {
                if (state is UserResults) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.usersFromApi.length,
                      itemBuilder: ((context, index) {
                        return UserApiCard(
                            usersCount: state.usersFromApi.length,
                            avatar: state.usersFromApi[index].avatar!,
                            firstName: state.usersFromApi[index].firstName!,
                            lastName: state.usersFromApi[index].lastName!,
                            email: state.usersFromApi[index].email!);
                      }),
                    ),
                  );
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
