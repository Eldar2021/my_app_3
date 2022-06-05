import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sabak/src/module/home/home.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.repo) : super(HomeLoading());

  final HomeRepository repo;

  Future<void> fetchData() async {
    final res = await repo.getPosts();

    res.fold((l) => emit(HomeError(l)), (r) => emit(HomeSuccess(r)));

    print(state);
  }
}
