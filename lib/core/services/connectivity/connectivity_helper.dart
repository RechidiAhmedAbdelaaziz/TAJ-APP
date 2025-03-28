import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ConnectivityHelper {
  final _connectivity = Connectivity();

  ConnectivityHelper();

  Future<bool> hasInternet() async {
    final connectivityResult =
        await _connectivity.checkConnectivity();

    return connectivityResult.any((connectivityResult) {
      return connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
    });
  }
}
