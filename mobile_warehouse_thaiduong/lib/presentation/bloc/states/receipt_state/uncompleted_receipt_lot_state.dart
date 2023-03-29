import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class UncompletedReceiptLotState extends Equatable {}

class LoadReceiptLotsLoadingState extends UncompletedReceiptLotState {
  DateTime timestamp;
  LoadReceiptLotsLoadingState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// class LoadReceiptLotsSuccessState extends UncompletedReceiptLotState {
//   DateTime timestamp;
//   GoodsReceipt goodsReceipt;
//   LoadReceiptLotsSuccessState(this.timestamp, this.goodsReceipt);
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
// => gộp 2 state loadlotssuccess và updatelotsuccess
//-------------

class LoadShelfIdsCuccessState extends UncompletedReceiptLotState {
  List<String> shelfIds;
  DateTime timestamp;
  LoadShelfIdsCuccessState(this.shelfIds, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
//----------------------------
class UpdateReceiptLotSuccessState extends UncompletedReceiptLotState {
  GoodsReceipt goodsReceipt;
  DateTime timestamp;
  UpdateReceiptLotSuccessState(this.goodsReceipt, this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
class UpdateReceiptLotLoadingState extends UncompletedReceiptLotState {

  DateTime timestamp;
  UpdateReceiptLotLoadingState( this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
//--------------
class ConfirmReceiptLotChangedSuccessState extends UncompletedReceiptLotState {
  ErrorPackage status;
  DateTime timestamp;
  ConfirmReceiptLotChangedSuccessState(this.status, this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class ConfirmReceiptLotChangedLoadingState extends UncompletedReceiptLotState {
  DateTime timestamp;
  ConfirmReceiptLotChangedLoadingState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ConfirmReceiptLotChangedFailState extends UncompletedReceiptLotState {
  ErrorPackage status;
  DateTime timestamp;
  ConfirmReceiptLotChangedFailState(this.status, this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
