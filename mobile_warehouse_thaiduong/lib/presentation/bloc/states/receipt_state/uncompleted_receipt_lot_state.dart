import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class UncompletedReceiptLotState extends Equatable {}

class UncompletedReceiptLotLoadingState extends UncompletedReceiptLotState {
  DateTime timestamp;
  UncompletedReceiptLotLoadingState(this.timestamp);
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

class LoadShelfIdsCuccessState extends UncompletedReceiptLotState {
  List<String> shelfIds;
  DateTime timestamp;
  LoadShelfIdsCuccessState(this.shelfIds, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class UpdateReceiptLotSuccessState extends UncompletedReceiptLotState {
  ItemLot itemLot;
  DateTime timestamp;
  UpdateReceiptLotSuccessState(this.itemLot, this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}


class ConfirmReceiptLotChangedSuccessState extends UncompletedReceiptLotState {
  ErrorPackage status;
  DateTime timestamp;
  ConfirmReceiptLotChangedSuccessState(this.status, this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class ConfirmReceiptLotChangedFailState extends UncompletedReceiptLotState {
  ErrorPackage status;
  DateTime timestamp;
  ConfirmReceiptLotChangedFailState(this.status, this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}