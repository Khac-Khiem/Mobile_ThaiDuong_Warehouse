import 'package:equatable/equatable.dart';

abstract class IsolationEvent extends Equatable {}
// Lấy thông tin lô hàng
class GetAllItemEvent extends IsolationEvent {
  DateTime timestamp;
  GetAllItemEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}
// Chọn lô để cách ly
class GetLotByItemIdEvent extends IsolationEvent {
 DateTime timestamp;
 String itemId;
  GetLotByItemIdEvent(this.timestamp, this.itemId);
  @override
  List<Object> get props => [timestamp];
}
// Thêm hàng cách ly: điền số lượng cách ly + note
class AddNewIsolationEvent extends IsolationEvent {
  DateTime timestamp;
  String lotId;
  String notes;
  double isolationQuantity;
  AddNewIsolationEvent(this.timestamp, this.lotId, this.notes, this.isolationQuantity);
  @override
  List<Object> get props => [timestamp, notes, isolationQuantity];
}

// // Xác nhận cách ly hàng hóa
// class ConfirmIsolationEvent extends IsolationEvent {
//   DateTime timestamp;
//   String lotId;
//   ConfirmIsolationEvent(
//     this.timestamp,
//     this.lotId
//   );
//   @override
//   List<Object> get props => [timestamp];
// }

// Danh sách hàng hóa đang chờ xử lý
class GetAllIsolationLotEvent extends IsolationEvent {
  DateTime timestamp;
  GetAllIsolationLotEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}