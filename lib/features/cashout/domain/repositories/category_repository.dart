import 'package:dartz/dartz.dart';
import 'package:just_play/core/errors/failures.dart';
import 'package:just_play/features/cashout/domain/entities/category_entity.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
}