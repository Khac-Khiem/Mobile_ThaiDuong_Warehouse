import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item.dart';
import '../../../../domain/entities/item_lot.dart';

abstract class FillInfoReceiptLotState extends Equatable {}

class LoadItemDataSuccessState extends FillInfoReceiptLotState {
  List<Item> items;
  List<ItemLotView> lots;
  int index;
  DateTime timestamp;
  @override
  LoadItemDataSuccessState(this.items, this.lots, this.index, this.timestamp);
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
