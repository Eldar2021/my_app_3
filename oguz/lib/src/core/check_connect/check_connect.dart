import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class CheckNetwork {
  CheckNetwork(this.connectivity);

  final Connectivity connectivity;

  Future<bool> check() async {
    final res = await connectivity.checkConnectivity();
    if (res == ConnectivityResult.bluetooth || res == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }

  // Stream<StreamSubscription<ConnectivityResult>> checkS() async* {
  //   yield connectivity.onConnectivityChanged.listen(
  //     (ConnectivityResult res) {},
  //   );
  // }
}
