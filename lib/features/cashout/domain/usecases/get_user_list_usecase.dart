import 'package:dartz/dartz.dart';
import 'package:just_play/core/errors/failures.dart';
import 'package:just_play/core/usecases/no_params.dart';
import 'package:just_play/core/usecases/usecase.dart';
import 'package:just_play/features/cashout/domain/entities/user_entities.dart';
import 'package:just_play/features/cashout/domain/repositories/user_repository.dart';

class GetUserListUseCase extends UseCase<List<UserEntities>, NoParams> {
  final UserListRepository userListRepository;

  GetUserListUseCase(this.userListRepository);

  @override
  Future<Either<Failure, List<UserEntities>>> call(NoParams params) async {
    return await userListRepository.getUserList();
  }
}
