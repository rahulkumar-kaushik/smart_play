import 'package:dartz/dartz.dart';
import 'package:just_play/core/errors/failures.dart';
import 'package:just_play/features/cashout/data/datasources/user_datasource.dart';
import 'package:just_play/features/cashout/data/models/users_model.dart';
import 'package:just_play/features/cashout/domain/entities/user_entities.dart';
import 'package:just_play/features/cashout/domain/repositories/user_repository.dart';

class UserListRepositoryImpl extends UserListRepository {
  final UserDataSource userDataSource;

  UserListRepositoryImpl(this.userDataSource);

  @override
  Future<Either<Failure, List<UserEntities>>> getUserList() async {
    try {
      final response = await userDataSource.fetchUserList();
      final userList = (response.data["data"] as List).map((e) => UsersModel.fromJson(e)).toList();
    return Right(userList);
    }catch(e){
     return Left(ServerFailure());
    }
  }
}
