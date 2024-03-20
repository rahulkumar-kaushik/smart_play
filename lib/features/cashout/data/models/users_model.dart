import 'package:just_play/features/cashout/domain/entities/user_entities.dart';

class UsersModel extends UserEntities {
  const UsersModel(
      {super.id, super.email, super.firstName, super.lastName, super.avatar});

  factory UsersModel.fromJson(Map<String,dynamic> json) => UsersModel(
    id: json['id'],
    email: json['email'],
    firstName: json['firstname'],
    lastName: json['lastname'],
    avatar: json['avatar']
  );
}
