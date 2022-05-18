import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'web_view_state.dart';

class WebViewCubit extends Cubit<bool> {
  WebViewCubit(this.connectivity) : super(true);

  Connectivity connectivity;
  StreamSubscription? streamSubscription;

  Future<StreamSubscription<ConnectivityResult>> monitorInternet() async {
    return streamSubscription =
        connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.bluetooth ||
          event == ConnectivityResult.none) {
        emit(false);
      } else {
        emit(true);
      }
    });
  }
}
