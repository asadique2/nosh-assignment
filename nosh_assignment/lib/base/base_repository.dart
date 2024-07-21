import 'package:get/get.dart';
import 'package:nosh_assignment/app/data/network/network_request.dart';

class BaseRepository {
  NetworkRequester get controller => GetInstance().find<NetworkRequester>();
}
