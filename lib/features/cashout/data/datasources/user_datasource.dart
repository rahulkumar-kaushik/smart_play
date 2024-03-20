import 'package:dio/dio.dart';
import 'package:just_play/core/network/network_service.dart';

class UserDataSource {
  final NetworkService networkService;

  UserDataSource(this.networkService);

  Future<Response> fetchUserList() async {
    const url = '/users?per_page=50';
    return await networkService.getRequest(url);
  }
}
