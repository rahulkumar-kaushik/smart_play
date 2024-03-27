import 'package:equatable/equatable.dart';
import 'package:just_play/features/cashout/domain/entities/user_entities.dart';

abstract class UserListState extends Equatable {
  const UserListState();

  @override
  List<Object> get props => [];
}

class UserListInitial extends UserListState {}

class UserListLoading extends UserListState {}

class UserListLoaded extends UserListState {
  final List<UserEntities> userEntities;

  const UserListLoaded(this.userEntities);

  @override
  List<Object> get props => [userEntities];
}

class UserListError extends UserListState {
  final String message;

  const UserListError(this.message);

  @override
  List<Object> get props => [message];
}
