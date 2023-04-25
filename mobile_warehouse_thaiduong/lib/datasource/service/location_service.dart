import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/location_model.dart';

class LocationService {
  Future<List<String>> getAllLocationId() async {
    final res = await http.get(Uri.parse(Constants.baseUrl + 'api/items/'));
    if (res.statusCode == 200) {
      List<String> body = jsonDecode(res.body);
      print(body.toString());
       List<String> locations = body
          .map(
            (dynamic item) => item.toString(),
          )
          .toList();
      print(locations.toString());
      return locations;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
   Future<List<WarehouseModel>> getAllWarehouseId() async {
    final res = await http.get(Uri.parse('${Constants.baseUrl}/api/Warehouses'));
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      print(body.toString());
      List<WarehouseModel> warehouse = body
          .map(
            (dynamic item) => WarehouseModel.fromJson(item),
          )
          .toList();

      print(warehouse.toString());
      return warehouse;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
