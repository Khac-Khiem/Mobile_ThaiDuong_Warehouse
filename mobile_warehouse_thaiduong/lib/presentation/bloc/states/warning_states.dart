import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/location.dart';

abstract class WarningState extends Equatable {}

// // hiển thị list hạn sử dụng còn lại
// class GetExpirationSuccessState extends WarningState {
//   DateTime timestamp;
//   List <String> expirationDate;
//   GetExpirationSuccessState(this.timestamp, this.expirationDate);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [timestamp];
// }
// class GetExpirationLoadingState extends WarningState {
//   DateTime timestamp;
//   GetExpirationLoadingState(this.timestamp);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [timestamp];
// }
// class GetExpirationFailState extends WarningState {
//   DateTime timestamp;
//   ErrorPackage status;
//   GetExpirationFailState(this.timestamp, this.status);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [timestamp];
// }
// hiển thị danh sách sản phẩm theo hạn sử dụng còn lại
class ExpirationWarningSuccessState extends WarningState {
  DateTime timestamp;
  List<ItemLot> itemLot;
  ExpirationWarningSuccessState(this.timestamp, this.itemLot);
  @override
  List<Object> get props => [timestamp];
}

class ExpirationWarningLoadingState extends WarningState {
  DateTime timestamp;
  ExpirationWarningLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class ExpirationWarningFailState extends WarningState {
  DateTime timestamp;
  String detail;
  ExpirationWarningFailState(
    this.timestamp,
    this.detail,
  );
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

// hiển thị list kho hàng
class GetWarehouseSuccessState extends WarningState {
  DateTime timestamp;
  List<String> warehouse;
  GetWarehouseSuccessState(this.timestamp, this.warehouse);
  @override
  List<Object?> get props => [timestamp];
}

class GetWarehouseLoadingState extends WarningState {
  DateTime timestamp;
  GetWarehouseLoadingState(this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}

class GetWarehouseFailState extends WarningState {
  DateTime timestamp;
  GetWarehouseFailState(this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}
// hiển thị danh sách sản phẩm dưới số lượng tồn kho tối thiểu

class MinimumStockWarningSuccessState extends WarningState {
  DateTime timestamp;
  List<ItemLot> itemLot;
  MinimumStockWarningSuccessState(this.timestamp, this.itemLot);
  @override
  List<Object> get props => [timestamp];
}

class MinimumStockWarningLoadingState extends WarningState {
  DateTime timestamp;

  MinimumStockWarningLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class MinimumStockWarningFailState extends WarningState {
  DateTime timestamp;
  String detail;
  MinimumStockWarningFailState(this.timestamp, this.detail);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
