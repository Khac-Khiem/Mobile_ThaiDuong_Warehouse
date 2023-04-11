
// ignore_for_file: avoid_print, unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/location.dart';

class LocationService {
  Future<List<String>> getAllLocationId() async {
    // final res = await http.get(Uri.parse(Constants.baseUrl + 'api/location/'));
    // if (res.statusCode == 200) {
    //   List<String> body = jsonDecode(res.body);
    //   print(body.toString());
    //   List<String> locations = body;

    //   print(locations.toString());
    //   return locations;
    // } else {
    //   throw "Unable to retrieve posts.";
    // }
     return ['Vị trí 1','Vị trí 2', 'Vị trí 3', 'Vị trí 4'];
  }
   Future<List<String>> getAllWarehouse() async {
    final res = await http.get(
      Uri.parse(Constants.baseUrl + 'api/Warehouses'));
    if (res.statusCode == 200) {
      List<String> body = jsonDecode(res.body);
      print(body.toString());
      List<String> warehouse = body;

      print(warehouse.toString());
      return warehouse;
    } else {
      throw "Unable to retrieve posts.";
    }
 //  return ['TP','NVL', 'BTP', 'VT'];
  }
}
