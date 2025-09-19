import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/data/repos/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._repo) : super(HomeInitial());
  final HomeRepo _repo;

  Future<void> load(String collection) async {
    emit(HomeLoading());
    final result = await _repo.fetchCollection(collection);
    result.fold(
      (f) => emit(HomeFailure(f.message)),
      (data) => emit(HomeSuccess(data)),
    );
  }
}
