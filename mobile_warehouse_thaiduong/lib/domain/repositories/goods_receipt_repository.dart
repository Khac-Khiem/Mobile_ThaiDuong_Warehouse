import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';

abstract class GoodsReceiptRepository {
  Future<ErrorPackage> postNewGoodsReceipt(
       GoodsReceipt goodsReceipt);
  Future<ErrorPackage> updateDetailLotReceipt(
      String goodsReceiptLotId,
      String itemId,
      double quantity,
      double? sublotSize,
      String purchaseOrderNumber,
      String? locationId,
      DateTime? productionDate,
      DateTime? expirationDate);
  Future<List<GoodsReceipt>> getCompletedGoodsReceipts(DateTime startDate, DateTime endDate);
  Future<List<GoodsReceipt>> getUnCompletedGoodsReceipts();
}
