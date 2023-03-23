import 'package:equatable/equatable.dart';

abstract class WarningEvent extends Equatable {}

// hiển thị list hạn sử dụng còn lại
// class GetExpirationEvent extends WarningEvent {
//   DateTime timestamp;
//   GetExpirationEvent(this.timestamp);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [timestamp];
// }

// hiển thị danh sách sản phẩm theo hạn sử dụng còn lại
class ExpirationWarningEvent extends WarningEvent {
  DateTime timestamp;
  DateTime expirationDate;
  ExpirationWarningEvent(this.timestamp, this.expirationDate);
  @override
  List<Object> get props => [timestamp];
}

// hiển thị list kho hàng
class GetWarehouseEvent extends WarningEvent {
  DateTime timestamp;
  GetWarehouseEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

// hiển thị danh sách sản phẩm dưới số lượng tồn kho tối thiểu
class MinimumStockWarningEvent extends WarningEvent {
  DateTime timestamp;
  String warehouse;
  MinimumStockWarningEvent(this.timestamp, this.warehouse);
  @override
  List<Object> get props => [timestamp];
}