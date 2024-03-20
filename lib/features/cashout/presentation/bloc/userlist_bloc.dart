import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play/core/usecases/no_params.dart';
import 'package:just_play/features/cashout/domain/usecases/get_user_list_usecase.dart';
import 'package:just_play/features/cashout/presentation/bloc/events/userlist_event.dart';
import 'package:just_play/features/cashout/presentation/bloc/state/userlist_state.dart';

import '../../../../core/di/injector.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  UserListBloc({required GetUserListUseCase getUserListUseCase})
      : super(UserListInitial()) {
    on<FetchUsers>((event, emit) async {
      emit(UserListLoading());
      final userListResult = await sl<GetUserListUseCase>().call(NoParams());
      userListResult.fold((failure) => emit(UserListError(failure.toString())),
          (userList) => emit(UserListLoaded(userList)));
    });
  }
}
