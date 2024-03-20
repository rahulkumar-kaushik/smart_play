import 'package:dartz/dartz.dart';
import 'package:just_play/core/errors/failures.dart';
import 'package:just_play/features/cashout/domain/entities/user_entities.dart';

abstract class UserListRepository {
  Future<Either<Failure,List<UserEntities>>> getUserList();
}