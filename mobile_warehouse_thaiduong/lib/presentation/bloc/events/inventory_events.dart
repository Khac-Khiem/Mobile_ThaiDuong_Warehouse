// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../domain/entities/item.dart';

abstract class InventoryEvent extends Equatable {}

// list kho hang
class GetWarehouseIdEvent extends InventoryEvent {
  DateTime timestamp;
  GetWarehouseIdEvent(this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}

// lấy mã sp
class GetAllItemIdByWarehouseIdEvent extends InventoryEvent {
  DateTime timestamp;
  String itemClassId;
  List<ItemClass> listItemClass;
  GetAllItemIdByWarehouseIdEvent(
      this.timestamp, this.itemClassId, this.listItemClass);
  @override
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

// thử giao diện
class LoadInventoryLotEvent extends InventoryEvent {
  DateTime timestamp;
  String itemClassId;
   List<ItemClass> listItemClass;
  LoadInventoryLotEvent(
    this.timestamp,
    this.itemClassId,
   this.listItemClass
  );
  @override
  List<Object> get props => [timestamp];
}
