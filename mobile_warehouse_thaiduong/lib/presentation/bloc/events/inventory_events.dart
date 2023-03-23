import 'package:equatable/equatable.dart';

abstract class InventoryEvent extends Equatable {}
// list kho hang 
class GetWarehouseIdEvent extends InventoryEvent {
  DateTime timestamp;
  GetWarehouseIdEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
// lấy mã sp
class GetAllItemIdByWarehouseIdEvent extends InventoryEvent {
  DateTime timestamp;
  String itemClass;
  GetAllItemIdByWarehouseIdEvent(this.timestamp, this.itemClass);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
// Hiển thị hàng tồn kho theo thông tin tìm kiếm
class LoadInventoryEvent extends InventoryEvent {
  DateTime timestamp;
  String itemId;
  DateTime startDate;
  DateTime endDate;
  LoadInventoryEvent(
    this.timestamp,
    this.itemId,
    this.startDate, 
    this.endDate,
);
  @override
  List<Object> get props => [timestamp];
}
