import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class IsolationState extends Equatable {}

// Lấy tất cả lô hàng
// class GetAllItemSuccessState extends IsolationState {
//   DateTime timestamp;
//   List<Item> item;
//   GetAllItemSuccessState(this.timestamp, this.item,
//   );
//   @override
//   List<Object> get props => [timestamp];
// }

// class GetAllItemLoadingState extends IsolationState {
//   DateTime timestamp;
//   GetAllItemLoadingState(this.timestamp);
//   @override
//   List<Object> get props => [timestamp];
// }

// class GetAllItemFailState extends IsolationState {
//   DateTime timestamp;
//   ErrorPackage status;
//   GetAllItemFailState(this.timestamp, this.status);
//   @override
//   List<Object> get props => [timestamp];
// }
class IsolationInitState extends IsolationState {
  DateTime timestamp;
  IsolationInitState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

// Chọn lô
class GetLotByLotIdSuccessState extends IsolationState {
  DateTime timestamp;
  ItemLot itemLot;
  GetLotByLotIdSuccessState(this.timestamp, this.itemLot);
  @override
  List<Object> get props => [timestamp];
}

class GetLotByLotIdLoadingState extends IsolationState {
  DateTime timestamp;
  GetLotByLotIdLoadingState(
    this.timestamp,
  );
  @override
  List<Object> get props => [timestamp];
}

class GetLotByLotIdFailState extends IsolationState {
  DateTime timestamp;
  // ErrorPackage status;
  GetLotByLotIdFailState(
    this.timestamp,
    // this.status
  );
  @override
  List<Object> get props => [timestamp];
}

// thêm hàng cách ly
class PostNewIsolationSuccessState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  PostNewIsolationSuccessState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

class PostNewIsolationLoadingState extends IsolationState {
  DateTime timestamp;
  PostNewIsolationLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class PostNewIsolationFailState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  PostNewIsolationFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

// Hiển thị danh sách hàng đang xử lý
class GetAllIsolationLotSuccessState extends IsolationState {
  DateTime timestamp;
  List<ItemLot> itemLot;
  GetAllIsolationLotSuccessState(this.timestamp, this.itemLot);
  @override
  List<Object> get props => [timestamp];
}

class GetAllIsolationLotLoadingState extends IsolationState {
  DateTime timestamp;
  GetAllIsolationLotLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class GetAllIsolationLotFailState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  GetAllIsolationLotFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}
