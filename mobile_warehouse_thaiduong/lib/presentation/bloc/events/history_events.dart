// ignore_for_file: must_be_immutable
import 'package:equatable/equatable.dart';

abstract class HistoryEvent extends Equatable {}

//------------
// get po number => chọn kho thành phẩm thì dc chọn số po
// bắt buộc phải chọn kho hàng, từ ngày - đến ngày => có thể truy xuất
// mã sp, bộ phận có thể có hoặc không
// số po chỉ với kho thành phẩm
//---------
// lấy ds kho, bộ phận, item => ls xuất
class GetAllInfoImportEvent extends HistoryEvent {
  DateTime timestamp;
  GetAllInfoImportEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

// lấy ds kho, ncc, item => ls nhập
class GetAllInfoExportEvent extends HistoryEvent {
  DateTime timestamp;
  GetAllInfoExportEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}

// lọc danh sách item theo kho hàng
class GetItemByWarehouseEvent extends HistoryEvent {
  DateTime timestamp;
  String itemClass;
  GetItemByWarehouseEvent(this.timestamp, this.itemClass);
  @override
  List<Object> get props => [timestamp];
}

// Truy xuất lịch sử nhập kho
class AccessImportHistoryEvent extends HistoryEvent {
  DateTime timestamp;
  String itemClass;
  DateTime startDate;
  DateTime endDate;
  String itemId;
  String department;
  String receiver;
  String purchaseOrderNumber;
  AccessImportHistoryEvent(
      this.timestamp,
      this.itemClass,
      this.startDate,
      this.endDate,
      this.itemId,
      this.department,
      this.receiver,
      this.purchaseOrderNumber);
  @override
  List<Object> get props => [timestamp];
}

// Truy xuất lịch sử xuất kho
class AccessExportHistoryEvent extends HistoryEvent {
  DateTime timestamp;
  String itemClass;
  DateTime startDate;
  DateTime endDate;
  String itemId;
  String department;
  String receiver;
  String purchaseOrderNumber;
  AccessExportHistoryEvent(
      this.timestamp,
      this.itemClass,
      this.startDate,
      this.endDate,
      this.itemId,
      this.department,
      this.receiver,
      this.purchaseOrderNumber);
  @override
  List<Object> get props => [timestamp];
}