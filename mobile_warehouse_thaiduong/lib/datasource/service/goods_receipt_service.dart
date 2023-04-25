import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_receipt_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/location.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';
import '../../domain/entities/error_package.dart';

class GoodsReceiptService {
  // Future<ErrorPackageModel> postNewGoodsReceipt(
  //     String goodsReceiptId, List<GoodsReceiptLot> lots) async {
  //   return ErrorPackageModel('success');
  // }

  Future<ErrorPackageModel> postNewGoodsReceipt(
      GoodsReceipt goodsReceipt) async {
    List bodyJson = [];
    for (int i = 0; i < goodsReceipt.lots.length; i++) {
      Map<String, dynamic> dimensionJson = {
        "goodsReceiptLotId":  goodsReceipt.lots[i].goodsReceiptLotId.toString(),
        "quantity": double.tryParse(goodsReceipt.lots[i].quantity.toString()),
        "unit": goodsReceipt.lots[i].unit.toString(),
        "itemId": goodsReceipt.lots[i].item!.itemId.toString(),
        "purchaseOrderNumber": goodsReceipt.lots[i].purchaseOrderNumber.toString(),
        "employeeId": 'NV01',
        "note": goodsReceipt.lots[i].note.toString(),
        "locationId": goodsReceipt.lots[i].location.toString(),
        "sublotSize": double.tryParse(goodsReceipt.lots[i].sublotSize.toString()),
        "productionDate": goodsReceipt.lots[i].productionDate.toString(),
        "expirationDate": goodsReceipt.lots[i].expirationDate.toString(),
        //  "goodsReceiptLotId": "lo1_0004",
        //         "quantity": 5,
        //         "unit": "KG",
        //         "itemId": "610-6C",
        //         "purchaseOrderNumber": "121212",
        //         "employeeId": "NV01",
        //         "note": "meomeo",
        //         "locationId": "null",
        //         "sublotSize": 5,
        //         "productionDate": null,
        //         "expirationDate": "2023-12-22",
      };
      bodyJson.add(dimensionJson);
    }
    final res = await http.post(
        Uri.parse('${Constants.baseUrl}api/GoodsReceipts/goodsReceipt/goodsReceiptLots'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
        },
        body: jsonEncode(
          <String, dynamic>{
            "goodsReceiptId": goodsReceipt.goodsReceiptId,
            "supplier": goodsReceipt.supply,
            "employeeId": "NV01",
            "goodsReceiptLots":bodyJson 
            //  [
            //   {
            //     "goodsReceiptLotId": "lo1_0003",
            //     "quantity": 5,
            //     "unit": "KG",
            //     "itemId": "610-6C",
            //     "purchaseOrderNumber": "121212",
            //     "employeeId": "NV01",
            //     "note": "meomeo",
            //     "locationId": null,
            //     "sublotSize": 5,
            //     "productionDate": null,
            //     "expirationDate": "2023-12-22",
            //   }
            // ]
          },
        ));
    if (res.statusCode == 200) {
      return ErrorPackageModel("success");
    } else {
      return ErrorPackageModel("fail");
    }
  }

  Future<ErrorPackageModel> updateDetailLotReceipt(
      String goodsReceiptLotId,
      String itemId,
      double quantity,
      double? sublotSize,
      String purchaseOrderNumber,
      String? locationId,
      DateTime? productionDate,
      DateTime? expirationDate) async {
    return ErrorPackageModel('success');
  }

  Future<List<GoodsReceiptModel>> getCompletedGoodsReceipts(
      DateTime startDate, DateTime endDate) async {
    final res = await http.get(
      Uri.parse('${Constants.baseUrl}api/GoodsReceipts/goodsReceipts/true'),
      // headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Accept': '*/*',
      //   'Authorization': 'Bearer ',
      // },
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<GoodsReceiptModel> allIssues = body
          .map(
            (dynamic item) => GoodsReceiptModel.fromJson(item),
          )
          .toList();
      return allIssues;
    }
    if (res.statusCode == 204) {
      return [];
    } else {
      throw "Unable to retrieve posts.";
    }
   
  }

  Future<List<GoodsReceiptModel>> getUnCompletedGoodsReceipts() async {
    final res = await http.get(
      Uri.parse('${Constants.baseUrl}api/GoodsReceipts/goodsReceipts/false'),
      // headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Accept': '*/*',
      //   'Authorization': 'Bearer ',
      // },
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<GoodsReceiptModel> allIssues = body
          .map(
            (dynamic item) => GoodsReceiptModel.fromJson(item),
          )
          .toList();
      return allIssues;
    }
    if (res.statusCode == 204) {
      return [];
    } else {
      throw "Unable to retrieve posts.";
    }
   
  }
}
