import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class HistoryState extends Equatable {}
// lấy ds kho, bộ phận, item
class GetAllInfoImportSuccessState extends HistoryState {
  DateTime timestamp;
  List<Item> item;
  List<Department> department;
  GetAllInfoImportSuccessState(
      this.timestamp, this.item, this.department);
  @override
  List<Object> get props => [timestamp];
}

class GetAllInfoImportLoadingState extends HistoryState {
  DateTime timestamp;
  GetAllInfoImportLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class GetAllInfoImportFailState extends HistoryState {
  DateTime timestamp;
  ErrorPackage status;
  GetAllInfoImportFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

// lấy ds kho, bộ ncc, item
class GetAllInfoExportSuccessState extends HistoryState {
  DateTime timestamp;
  List<String> warehouse;
  List<String> department;
  List<String> item;
  GetAllInfoExportSuccessState(
      this.timestamp, this.warehouse, this.department, this.item);
  @override
  List<Object> get props => [timestamp];
}

class GetAllInfoExportLoadingState extends HistoryState {
  DateTime timestamp;

  GetAllInfoExportLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class GetAllInfoExportFailState extends HistoryState {
  DateTime timestamp;
  ErrorPackage status;
  GetAllInfoExportFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

// lọc danh sách item theo kho hàng
class GetItemByWarehouseSuccessState extends HistoryState {
  DateTime timestamp;
  List<Item> item;
  GetItemByWarehouseSuccessState(this.timestamp, this.item);
  @override
  List<Object> get props => [timestamp];
}

class GetItemByWarehouseLoadingState extends HistoryState {
  DateTime timestamp;
  GetItemByWarehouseLoadingState(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

class GetItemByWarehouseFailState extends HistoryState {
  DateTime timestamp;
  ErrorPackage status;
  GetItemByWarehouseFailState(this.timestamp, this.status);
  @override
  List<Object> get props => [timestamp];
}

// Truy xuất lịch sử nhập kho
class AccessImportHistorySuccessState extends HistoryState {
  DateTime timestamp;
  List<GoodsReceiptLot> goodReceiptLots;
  AccessImportHistorySuccessState(
    this.timestamp,
    this.goodReceiptLots,
  );
  @override
  List<Object> get props => [timestamp];
}

class AccessImportHistoryLoadingState extends HistoryState {
  DateTime timestamp;
  AccessImportHistoryLoadingState(
    this.timestamp,
  );
  @override
  List<Object> get props => [timestamp];
}

class AccessImportHistoryFailState extends HistoryState {
  DateTime timestamp;
  ErrorPackage status;
  AccessImportHistoryFailState(
    this.timestamp,
    this.status,
  );
  @override
  List<Object> get props => [timestamp];
}

// Truy xuất lịch sử xuất kho
class AccessExportHistorySuccessState extends HistoryState {
  DateTime timestamp;
  List<Item> item;
  AccessExportHistorySuccessState(
    this.timestamp,
    this.item,
  );
  @override
  List<Object> get props => [timestamp];
}

class AccessExportHistoryLoadingState extends HistoryState {
  DateTime timestamp;
  AccessExportHistoryLoadingState(
    this.timestamp,
  );
  @override
  List<Object> get props => [timestamp];
}

class AccessExportHistoryFailState extends HistoryState {
  DateTime timestamp;
  ErrorPackage status;
  AccessExportHistoryFailState(
    this.timestamp,
    this.status,
  );
  @override
  List<Object> get props => [timestamp];
}