import 'package:dio/dio.dart';
import 'package:just_play/core/network/network_service.dart';

class CategoryDatasource {
  final NetworkService networkService;

  CategoryDatasource(this.networkService);

  Future<Response> fetchCategories() async {
    const url = '/categories.php';
    return await networkService.getRequest(url);
  }
}
