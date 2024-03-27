import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_play/core/usecases/no_params.dart';
import 'package:just_play/features/home/presentation/bloc/events/home_event.dart';
import 'package:just_play/features/home/presentation/bloc/states/home_state.dart';

import '../../../../core/di/injector.dart';
import '../../../cashout/domain/usecases/get_user_list_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, UserListState> {
  HomeBloc({required GetUserListUseCase getUserListUseCase})
      : super(UserListInitial()) {
    on<FetchLpaData>((event, emit) async {
      emit(UserListLoading());
      final userListResult = await sl<GetUserListUseCase>().call(NoParams());
      userListResult.fold((failure) => emit(UserListError(failure.toString())),
          (userList) => emit(UserListLoaded(userList)));
    });
  }
}
