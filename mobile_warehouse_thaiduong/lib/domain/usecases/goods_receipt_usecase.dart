import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/goods_receipt_repository.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_repository.dart';

import '../entities/error_package.dart';

class GoodsReceiptUsecase {
  final GoodsReceiptRepository goodsReceiptRepository;
  GoodsReceiptUsecase(this.goodsReceiptRepository);
  Future<ErrorPackage> postNewGoodsReceipt(
      GoodsReceipt goodsReceipt) async {
    final status =
        goodsReceiptRepository.postNewGoodsReceipt( goodsReceipt);
    return status;
  }

  Future<ErrorPackage> updateDetailLotReceipt(
      String goodsReceiptLotId,
      String itemId,
      double quantity,
      double? sublotSize,
      String purchaseOrderNumber,
      String? locationId,
      DateTime? productionDate,
      DateTime? expirationDate) async {
    final status = goodsReceiptRepository.updateDetailLotReceipt(
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

  Future<List<GoodsReceipt>> getCompletedGoodsReceipts(DateTime startDate, DateTime endDate) async {
    final goodsReceipts = goodsReceiptRepository.getCompletedGoodsReceipts(startDate,endDate);
    return goodsReceipts;
  }

  Future<List<GoodsReceipt>> getUnCompletedGoodsReceipts() async {
    final goodsReceipts = goodsReceiptRepository.getUnCompletedGoodsReceipts();
    return goodsReceipts;
  }
}
