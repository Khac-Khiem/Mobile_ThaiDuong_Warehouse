// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../domain/entities/item_lot.dart';

abstract class AdjustmentEvent extends Equatable {}

class GetLotEvent extends AdjustmentEvent {
  DateTime timestamp;
  String itemId;
  GetLotEvent(this.timestamp, this.itemId);
  @override
  List<Object> get props => [timestamp];
}

class UpdateLotAdjustmentQuantityEvent extends AdjustmentEvent {
  DateTime timestamp;
  String employeeName;
  ItemLot itemLot;
  String newPo;
  double newQuantity;
  String note;
  UpdateLotAdjustmentQuantityEvent(this.timestamp, this.employeeName,
      this.itemLot, this.newPo, this.newQuantity, this.note);
  @override
  List<Object> get props => [timestamp];
}
