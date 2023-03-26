// ignore_for_file: avoid_print

import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/item_lot_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/error_package_model.dart';

class ItemLotService {
  Future<ItemLotModel> getItemLotById(String lotId) async {
    final res = await http.get(
      Uri.parse(Constants.baseUrl + 'api/containers/$lotId'),
    );
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      //   print(body.toString());
      ItemLotModel lot = ItemLotModel.fromJson(body);
      return lot;
    } else {
      print('rổ không xác định');

      return throw "Unable to retrieve posts.";
    }
  
  }
 
  Future<List<ItemLotModel>> getItemLotsByItemId(String itemId) async {
    return [];
  }

  Future<List<ItemLotModel>> getItemLotsByLocation(String locationId) async {
    return [];
  }

  Future<List<ItemLotModel>> getIsolatedItemLots() async {
    return [];
  }

  Future<List<ItemLotModel>> getExpiredItemLots() async {
    return [];
  }

  Future<List<ItemLotModel>> getUnderStockminItemLots() async {
    return [];
  }
  //==
  Future<ErrorPackageModel> addNewIsolationLot(
    double isolationQuantity, String notes)async {
    return ErrorPackageModel(
      "success",
    );
  }
}
