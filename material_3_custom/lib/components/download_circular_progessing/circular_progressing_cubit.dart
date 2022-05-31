import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CircularPrCubit extends Cubit<CircularPrState> {
  CircularPrCubit() : super(CircularPrInit());

  Future<void> downLoad() async {
    for (double x = 0; x <= 10; x++) {
      await Future.delayed(const Duration(seconds: 1));
      emit(CircularPrPg(x));
    }
    emit(CircularPrSuccess());
  }
}

abstract class CircularPrState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CircularPrInit extends CircularPrState {}

class CircularPrPg extends CircularPrState {
  CircularPrPg(this.val);
  final double val;

  @override
  List<Object> get props => [val];
}

class CircularPrSuccess extends CircularPrState {}

/* 
HOW TO USE ? 
- void _incrementCounter() async {
    for (var x = 0; x < 10; x++) {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        _counter++;
      });
    }
  }
  you need to define your func for loading. 
  after this you can call button or initstate for page loading. 
LoadingCircular(
            isLoading: _counter * 10 == 100 ? true : false,
            color: _counter * 10 == 100 ? Colors.green : Colors.blueAccent,
            progress: _counter / 10,
            width: 100,
            height: 100),
            */
