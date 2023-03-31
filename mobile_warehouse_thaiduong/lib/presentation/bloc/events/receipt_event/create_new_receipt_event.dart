// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../../domain/entities/goods_receipt.dart';
import '../../../../domain/entities/item_lot.dart';

abstract class CreateReceiptEvent extends Equatable {}

// class GetAllItemEvent extends CreateReceiptEvent {
//   DateTime timestamp;
//   List<ItemLotView> lots;
//   int index;
//   GetAllItemEvent(this.timestamp, this.lots, this.index);
//   @override
//   List<Object> get props => [timestamp];
// }

class AddLotToGoodsReceiptEvent extends CreateReceiptEvent {
  ItemLotView itemLotView;
  List<ItemLotView> lots;
  AddLotToGoodsReceiptEvent(this.itemLotView, this.lots);
  @override
  List<Object> get props => [itemLotView];
}

class UpdateLotReceiptEvent extends CreateReceiptEvent {
  ItemLotView itemLotView;
  List<ItemLotView> lots;
  int index;

  UpdateLotReceiptEvent(this.itemLotView, this.lots, this.index);
  @override

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