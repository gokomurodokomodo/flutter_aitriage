import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkCheckUtil{
  NetworkCheckUtil._();

  NetworkCheckUtil();

  Future<bool> isConnectedToInternet() async{
    final connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }
}