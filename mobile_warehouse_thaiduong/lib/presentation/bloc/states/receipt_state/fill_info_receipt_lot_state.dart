// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item.dart';
import '../../../../domain/entities/item_lot.dart';

abstract class FillInfoReceiptLotState extends Equatable {}

class LoadItemDataSuccessState extends FillInfoReceiptLotState {
  List<Item> items;
  List<ItemLotView> itemlots;
  int index;
  DateTime timestamp;
  @override
  LoadItemDataSuccessState(this.items, this.itemlots, this.index, this.timestamp, DateTime dateTime);

  @override
  List<Object?> get props => [timestamp];
}

class LoadItemDataLoadingState extends FillInfoReceiptLotState {
  DateTime timestamp;
  LoadItemDataLoadingState(this.timestamp);

  @override

  List<Object?> get props => [timestamp];
}

class LoadItemDataFailState extends FillInfoReceiptLotState {
  DateTime timestamp;
  LoadItemDataFailState(this.timestamp);

  @override

  List<Object?> get props => [timestamp];
}