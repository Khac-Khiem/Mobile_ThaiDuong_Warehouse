// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class UncompletedReceiptLotEvent extends Equatable {}

class LoadUncompletedReceiptLotEvent extends UncompletedReceiptLotEvent {
  DateTime timestamp;
  LoadUncompletedReceiptLotEvent(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class LoadShelfIdEvent extends UncompletedReceiptLotEvent {
  DateTime timestamp;
  LoadShelfIdEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

// cập nhật view
class UpdateReceiptLotEvent extends UncompletedReceiptLotEvent {
  // String goodsReceiptLotId;
  // String itemId;
  // double quantity;
  // double? sublotSize;
  // String purchaseOrderNumber;
  // String? locationId;
  // DateTime? productionDate;
  // DateTime? expirationDate;
  ItemLot itemLot;
  UpdateReceiptLotEvent(
      // this.goodsReceiptLotId,
      // this.itemId,
      // this.quantity,
      // this.sublotSize,
      // this.purchaseOrderNumber,
      // this.locationId,
      // this.productionDate,
      // this.expirationDate
      this.itemLot);
  @override
  List<Object> get props => [];
}

// post
class PostReceiptChangedEvent extends UncompletedReceiptLotEvent {
  DateTime timestamp;
  List<ItemLot> itemLots;
  PostReceiptChangedEvent(this.timestamp, this.itemLots);
  @override
  List<Object> get props => [timestamp];
}
