import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/lot_adjustment.dart';

import '../../../domain/entities/item_lot.dart';

abstract class AdjustmentEvent extends Equatable {}

class GetLotDetailEvent extends AdjustmentEvent {
  DateTime timestamp;
  String lotId;
  GetLotDetailEvent(this.timestamp, this.lotId);
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
  UpdateLotAdjustmentQuantityEvent(
      this.timestamp,this.employeeName, this.itemLot, this.newPo, this.newQuantity, this.note);
  @override
  List<Object> get props => [timestamp];
}
