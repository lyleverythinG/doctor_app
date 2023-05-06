import 'package:doctor_app/features/users_from_api/presentation/bloc/bloc/user_api_bloc.dart';
import 'package:doctor_app/features/users_from_api/presentation/widget/users_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
