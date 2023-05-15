import 'package:avangers_order/src/data/helpers/marvel_films_helper.dart';
import 'package:avangers_order/src/ui/blocs/states/base_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/usecases.dart';

class HomeBloc extends Cubit<BaseState> {
  final IMarvelFilmsUsecase _usecase;
  HomeBloc(this._usecase) : super(const EmptyState());

  Future<void> call() async {
    emit(const LoadingState());
    final list = await MarvelFilmsStorageHelper.getFilms();
    if (list.isEmpty) {
      var result = await _usecase();
      if (result.isSuccess) {
        final newList = result.getSuccessData;
        await MarvelFilmsStorageHelper.storeFilms(newList);
        emit(SuccessState(newList));
      } else {
        emit(ErrorState(result.getErrorData.message));
      }
    } else {
      emit(SuccessState(list));
    }
  }
}
