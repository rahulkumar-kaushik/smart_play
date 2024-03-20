import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play/features/cashout/presentation/bloc/state/userlist_state.dart';
import 'package:just_play/features/cashout/presentation/bloc/userlist_bloc.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(builder: (context, state) {
      if (state is UserListLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is UserListLoaded) {
        return ListView.builder(
            itemCount: state.userEntities.length,
            padding: const EdgeInsets.all(28),
            itemBuilder: (context, index) {
              final user = state.userEntities[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.network(
                    user.avatar ?? '',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.firstName ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              );
            });
      } else if (state is UserListError) {
        return Text(state.message);
      }
      return Container();
    });
  }
}
