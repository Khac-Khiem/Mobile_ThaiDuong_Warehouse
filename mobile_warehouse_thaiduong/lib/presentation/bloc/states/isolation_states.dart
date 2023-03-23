import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class IsolationState extends Equatable {}

// Lấy tất cả lô hàng
class GetAllItemSuccessState extends IsolationState {
  DateTime timestamp;
  List<Item> item;
  GetAllItemSuccessState(this.timestamp, this.item);
  @override
  List<Object> get props => [timestamp];
}

class GetAllItemLoadingState extends IsolationState {
  DateTime timestamp;
  GetAllItemLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class GetAllItemFailState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  GetAllItemFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

// Chọn lô
class GetLotByItemIdSuccessState extends IsolationState {
  DateTime timestamp;
  List <ItemLot> itemLots;
  GetLotByItemIdSuccessState(this.timestamp, this.itemLots);
  @override
  List<Object> get props => [timestamp];
}

class GetLotByItemIdLoadingState extends IsolationState {
  DateTime timestamp;
  GetLotByItemIdLoadingState(
    this.timestamp,
  );
  @override
  List<Object> get props => [timestamp];
}

class GetLotByItemIdFailState extends IsolationState {
  DateTime timestamp;
  // ErrorPackage status;
  GetLotByItemIdFailState(this.timestamp, 
  // this.status
  );
  @override
  List<Object> get props => [timestamp];
}

// thêm hàng cách ly
class AddNewIsolationSuccessState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  AddNewIsolationSuccessState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

class AddNewIsolationLoadingState extends IsolationState {
  DateTime timestamp;
  AddNewIsolationLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class AddNewIsolationFailState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  AddNewIsolationFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

// Xác nhận cách ly hàng hóa
class ConfirmIsolationSuccessState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  ConfirmIsolationSuccessState(
    this.timestamp,
    this.status,
  );
  @override
  List<Object> get props => [timestamp];
}

class ConfirmIsolationLoadingState extends IsolationState {
  DateTime timestamp;
  ConfirmIsolationLoadingState(
    this.timestamp,
  );
  @override
  List<Object> get props => [timestamp];
}

class ConfirmIsolationFailState extends IsolationState {
  DateTime timestamp;
  ErrorPackage status;
  ConfirmIsolationFailState(
    this.timestamp,
    this.status,
  );
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