// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

import '../../../domain/entities/item.dart';

abstract class WarningEvent extends Equatable {}
// hiển thị danh sách sản phẩm theo hạn sử dụng còn lại
class ExpirationWarningEvent extends WarningEvent {
  DateTime timestamp;
  String expirationDate;
  ExpirationWarningEvent(this.timestamp, this.expirationDate);
  @override
  List<Object> get props => [timestamp];
}

// hiển thị list kho hàng
class GetWarehouseEvent extends WarningEvent {
  DateTime timestamp;
  GetWarehouseEvent(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

// hiển thị danh sách sản phẩm dưới số lượng tồn kho tối thiểu
class MinimumStockWarningEvent extends WarningEvent {
  DateTime timestamp;
  String itemClassId;
  List<ItemClass> listItemClass;
  MinimumStockWarningEvent(this.timestamp, this.itemClassId, this.listItemClass);
  @override
  List<Object> get props => [timestamp];
}