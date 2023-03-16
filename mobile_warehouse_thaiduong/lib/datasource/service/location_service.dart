import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/constant.dart';

class LocationService {
  Future<List<String>> getAllLocationId() async {
    final res = await http.get(Uri.parse(Constants.baseUrl + 'api/items/'));
    if (res.statusCode == 200) {
      List<String> body = jsonDecode(res.body);
      print(body.toString());
      List<String> locations = body;

      print(locations.toString());
      return locations;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
   Future<List<String>> getAllWarehouseId() async {
    final res = await http.get(Uri.parse(Constants.baseUrl + 'api/items/'));
    if (res.statusCode == 200) {
      List<String> body = jsonDecode(res.body);
      print(body.toString());
      List<String> warehouse = body;

      print(warehouse.toString());
      return warehouse;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
