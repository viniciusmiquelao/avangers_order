import 'package:avangers_order/src/ui/blocs/states/base_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/usecases.dart';

class HomeBloc extends Cubit<BaseState> {
  final IMarvelFilmsUsecase _usecase;
  HomeBloc(this._usecase) : super(const EmptyState());

  Future<void> call() async {
    emit(const LoadingState());
    var result = await _usecase();
    if (result.isSuccess) {
      emit(SuccessState(result.getSuccessData));
    } else {
      emit(ErrorState(result.getErrorData.message));
    }
  }
}
