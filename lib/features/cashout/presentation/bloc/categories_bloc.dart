import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:just_play/core/usecases/no_params.dart';
import 'package:just_play/features/cashout/domain/usecases/get_category_list_usecase.dart';

import '../../../../core/di/injector.dart';
import '../../domain/entities/category_entity.dart';

part 'events/categories_event.dart';

part 'state/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required GetCategoryListUseCase getCategoryListUseCase})
      : super(CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      emit(CategoriesLoading());
      final result = await sl<GetCategoryListUseCase>().call(NoParams());
      result.fold(
        (failure) => emit(CategoriesError(failure.toString())),
        (categories) => emit(CategoriesLoaded(categories)),
      );
    });
  }
}
