// ignore_for_file: unused_import

import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_receipt_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/location.dart';

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
    return [];
  }

  Future<List<GoodsReceiptModel>> getUnCompletedGoodsReceipts() async {
    return [
      GoodsReceiptModel(
          'hahaa',
          'abc',
          [
            GoodsReceiptLot('1', 'banh', 100, 10, "1856373", 'kkkkk', 'Kệ A',
                DateTime.now(), DateTime.now()),
                 GoodsReceiptLot('2', 'banh 2', 100, 10, "1856373", 'kkkkk', 'Kệ A',
                DateTime.now(), DateTime.now()),
                  GoodsReceiptLot('3', 'banh 3', 100, 10, "1856373", 'kkkkk', 'Kệ A',
                DateTime.now(), DateTime.now())
          ],
          DateTime.now(),
          false),
           GoodsReceiptModel(
          'hihihi',
           'abc',
          [
            GoodsReceiptLot('1', 'banh', 100, 10, "1856373", 'kkkkk', 'Kệ A',
                DateTime.now(), DateTime.now()),
                 GoodsReceiptLot('2', 'banh 2', 100, 10, "1856373", 'kkkkk', 'Kệ A',
                DateTime.now(), DateTime.now())
          ],
          DateTime.now(),
          false),
    ];
  }
}