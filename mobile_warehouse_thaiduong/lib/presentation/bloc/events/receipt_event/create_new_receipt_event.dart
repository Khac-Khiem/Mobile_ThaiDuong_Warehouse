import 'package:equatable/equatable.dart';

import '../../../../domain/entities/goods_receipt.dart';
import '../../../../domain/entities/item_lot.dart';

abstract class CreateReceiptEvent extends Equatable {}

class GetAllItemEvent extends CreateReceiptEvent {
  DateTime timestamp;
  GetAllItemEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class AddLotToGoodsReceiptEvent extends CreateReceiptEvent {
  ItemLotView itemLot;
  AddLotToGoodsReceiptEvent(this.itemLot);
  @override
  List<Object> get props => [itemLot];
}

class UpdateLotReceiptEvent extends CreateReceiptEvent {
  ItemLotView itemLotView;

  UpdateLotReceiptEvent(this.itemLotView);
  @override
  // TODO: implement props
  List<Object?> get props => [itemLotView];
}

class PostNewReceiptEvent extends CreateReceiptEvent {
  DateTime timestamp;
  List<GoodsReceiptLot> lots;
  String receiptId;
  PostNewReceiptEvent(this.lots, this.timestamp, this.receiptId);
  @override
  List<Object> get props => [timestamp];
}
