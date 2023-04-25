import 'package:mobile_warehouse_thaiduong/datasource/service/goods_receipt_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/goods_receipt_repository.dart';

class GoodsReceiptRepoImpl implements GoodsReceiptRepository {
  final GoodsReceiptService goodsReceiptService;
  GoodsReceiptRepoImpl(this.goodsReceiptService);
  @override
  Future<List<GoodsReceipt>> getCompletedGoodsReceipts(DateTime startDate, DateTime endDate) {
    final goodsReceipts = goodsReceiptService.getCompletedGoodsReceipts(startDate,endDate);
    return goodsReceipts;
  }

  @override
  Future<List<GoodsReceipt>> getUnCompletedGoodsReceipts() {
    final goodsReceipts = goodsReceiptService.getUnCompletedGoodsReceipts();
    return goodsReceipts;
  }

  @override
  Future<ErrorPackage> postNewGoodsReceipt(
      GoodsReceipt goodsReceipt) {
    final status = goodsReceiptService.postNewGoodsReceipt(
         goodsReceipt);
    return status;
  }

  @override
  Future<ErrorPackage> updateDetailLotReceipt(
      String goodsReceiptLotId,
      String itemId,
      double quantity,
      double? sublotSize,
      String purchaseOrderNumber,
      String? locationId,
      DateTime? productionDate,
      DateTime? expirationDate) {
    final status = goodsReceiptService.updateDetailLotReceipt(
        goodsReceiptLotId,
        itemId,
        quantity,
        sublotSize,
        purchaseOrderNumber,
        locationId,
        productionDate,
        expirationDate);
    return status;
  }
}
