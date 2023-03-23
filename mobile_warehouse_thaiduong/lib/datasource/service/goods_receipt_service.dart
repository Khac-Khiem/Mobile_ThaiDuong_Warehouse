import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_receipt_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';

class GoodsReceiptService {
  Future<ErrorPackageModel> postNewGoodsReceipt(String goodsReceiptId,
        List<GoodsReceiptLot> lots) async {
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
    return [];
  }
  //==
   Future<List<GoodsReceiptModel>> getGoodsReceiptsHistory(
       String itemClass,
      DateTime startDate,
      DateTime endDate,
      String itemId,
      String department,
      String receiver,
      String purchaseOrderNumber) async {
    return [];
  }
}
