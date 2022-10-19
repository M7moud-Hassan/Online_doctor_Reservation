import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecking {
  static Future<bool> checkNet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.mobile;
  }
}
