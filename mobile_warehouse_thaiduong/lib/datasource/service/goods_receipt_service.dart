import 'dart:convert';

import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_receipt_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/location.dart';
import 'package:http/http.dart' as http;

import '../../constant.dart';

class GoodsReceiptService {
  Future<ErrorPackageModel> postNewGoodsReceipt(
      String goodsReceiptId, List<GoodsReceiptLot> lots) async {
    return ErrorPackageModel('success');
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

  Future<List<GoodsReceiptModel>> getCompletedGoodsReceipts() async {
     final res = await http.get(
      Uri.parse(Constants.baseUrl + 'api/GoodsReceipts/Confirmed'),
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
    } else {
      throw "Unable to retrieve posts.";
    }
    // return [  GoodsReceiptModel(
    //       '21-02-23-ThaiDuong',
    //       'ThaiDuong',
    //       [
    //         GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
    //             DateTime.now(), DateTime.now()),
    //              GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
    //             DateTime.now(), DateTime.now()),
    //               GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
    //             DateTime.now(), DateTime.now())
    //       ],
    //       DateTime.now(),
    //       false),
    //        GoodsReceiptModel(
    //        '02-02-23-ThaiDuong',
    //       'ThaiDuong',
    //       [
    //         GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
    //             DateTime.now(), DateTime.now()),
    //              GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
    //             DateTime.now(), DateTime.now()),
    //               GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
    //             DateTime.now(), DateTime.now())
    //       ],
    //       DateTime.now(),
    //       false),];
  }

  Future<List<GoodsReceiptModel>> getUnCompletedGoodsReceipts() async {
     final res = await http.get(
      Uri.parse(Constants.baseUrl + 'api/GoodsReceipts/Unconfirmed'),
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
    } else {
      throw "Unable to retrieve posts.";
    }
    //return [
      // GoodsReceiptModel(
      //     '22-03-23-ThaiDuong',
      //     'ThaiDuong',
      //     [
      //       GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
      //           DateTime.now(), DateTime.now()),
      //            GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
      //           DateTime.now(), DateTime.now()),
      //             GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
      //           DateTime.now(), DateTime.now())
      //     ],
      //     DateTime.now(),
      //     false),
      //      GoodsReceiptModel(
      //      '02-04-23-ThaiDuong',
      //     'ThaiDuong',
      //     [
      //       GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
      //           DateTime.now(), DateTime.now()),
      //            GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
      //           DateTime.now(), DateTime.now()),
      //             GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
      //           DateTime.now(), DateTime.now())
      //     ],
      //     DateTime.now(),
      //     false),
      //      GoodsReceiptModel(
      //     '22-03-23-ThaiDuong',
      //     'ThaiDuong',
      //     [
      //       GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
      //           DateTime.now(), DateTime.now()),
      //            GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
      //           DateTime.now(), DateTime.now()),
      //             GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
      //           DateTime.now(), DateTime.now())
      //     ],
      //     DateTime.now(),
      //     false),
      //      GoodsReceiptModel(
      //      '02-04-23-ThaiDuong',
      //     'ThaiDuong',
      //     [
      //       GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
      //           DateTime.now(), DateTime.now()),
      //            GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
      //           DateTime.now(), DateTime.now()),
      //             GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
      //           DateTime.now(), DateTime.now())
      //     ],
      //     DateTime.now(),
      //     false),
      //      GoodsReceiptModel(
      //     '22-03-23-ThaiDuong',
      //     'ThaiDuong',
      //     [
      //       GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
      //           DateTime.now(), DateTime.now()),
      //            GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
      //           DateTime.now(), DateTime.now()),
      //             GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
      //           DateTime.now(), DateTime.now())
      //     ],
      //     DateTime.now(),
      //     false),
      //      GoodsReceiptModel(
      //      '02-04-23-ThaiDuong',
      //     'ThaiDuong',
      //     [
      //       GoodsReceiptLot('SF01002-1', 'CDP001', 100, 10, "1856373", 'Khac Khiem', 'T1.2.3',
      //           DateTime.now(), DateTime.now()),
      //            GoodsReceiptLot('SF01002-2', 'CDP002-2', 100, 10, "1856373", 'Tuong Vi', 'T2.1.1',
      //           DateTime.now(), DateTime.now()),
      //             GoodsReceiptLot('FD01002-1', 'CDP002-3', 100, 10, "1856373", 'Toan', 'T3.2.2',
      //           DateTime.now(), DateTime.now())
      //     ],
      //     DateTime.now(),
      //     false),
   // ];
  }
}
