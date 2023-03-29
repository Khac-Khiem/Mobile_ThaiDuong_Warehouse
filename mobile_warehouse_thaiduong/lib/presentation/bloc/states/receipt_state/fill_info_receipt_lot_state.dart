import 'package:equatable/equatable.dart';

import '../../../../domain/entities/goods_receipt.dart';
import '../../../../domain/entities/item.dart';

abstract class FillInfoReceiptLotState extends Equatable {}

class LoadItemDataSuccessState extends FillInfoReceiptLotState {
  List<Item> items;
   GoodsReceipt goodsReceipt;
  int index;
  bool function;
  DateTime timestamp;
  @override
  LoadItemDataSuccessState(
      this.items, this.goodsReceipt, this.index, this.function, this.timestamp);
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadItemDataLoadingState extends FillInfoReceiptLotState {
  DateTime timestamp;
  LoadItemDataLoadingState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadItemDataFailState extends FillInfoReceiptLotState {
  DateTime timestamp;
  LoadItemDataFailState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
