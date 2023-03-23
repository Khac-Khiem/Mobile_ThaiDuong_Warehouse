import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/lot_adjustment.dart';


abstract class AdjustmentState extends Equatable {}
// Scan Barcode
class GetLotDetailSuccessState extends AdjustmentState {
  DateTime timestamp;
  List <LotAdjustment> itemLot;
  GetLotDetailSuccessState(this.timestamp, this.itemLot);
  @override
  List<Object> get props => [timestamp, itemLot];
}
class GetLotDetailLoadingState extends AdjustmentState {
  DateTime timestamp;
  GetLotDetailLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}
class GetLotDetailFailState extends AdjustmentState {
  DateTime timestamp;
  // ErrorPackage status;
  GetLotDetailFailState(this.timestamp, 
  // this.status
  );
  @override
  List<Object> get props => [timestamp];
}

// cập nhật số lượng mới
class UpdateLotQuantitySuccessState extends AdjustmentState {
  DateTime timestamp;
  ErrorPackage status;
  UpdateLotQuantitySuccessState(this.timestamp, this.status);
  @override
  List<Object?> get props => [timestamp];
}
class UpdateLotQuantityLoadingState extends AdjustmentState {
  DateTime timestamp;
  UpdateLotQuantityLoadingState(this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}
class UpdateLotQuantityFailState extends AdjustmentState {
  DateTime timestamp;
  ErrorPackage status;
  UpdateLotQuantityFailState(this.timestamp, this.status);
  @override
  List<Object?> get props => [timestamp];
}







