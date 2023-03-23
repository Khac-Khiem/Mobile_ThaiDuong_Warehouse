import 'package:equatable/equatable.dart';

abstract class ShelveEvent extends Equatable {}

// List mã sản phẩm
class GetAllItemIdEvent extends ShelveEvent {
 DateTime timestamp;
  GetAllItemIdEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}
// Tìm kệ theo mã sản phẩm
class GetLotByItemIdEvent extends ShelveEvent {
  DateTime timestamp;
  String itemId;
  GetLotByItemIdEvent(this.timestamp, this.itemId);
  @override
  List<Object> get props => [timestamp, itemId];
}

// List vị trí
class GetAllLocationEvent extends ShelveEvent {
  DateTime timestamp;
  GetAllLocationEvent(this.timestamp);
  @override
  List<Object> get props => [timestamp];
}
// Hiển thị danh sách tìm kiếm theo vị trí 
class GetLotByLocationEvent extends ShelveEvent {
  DateTime timestamp;
  String locationId;
  GetLotByLocationEvent(this.timestamp, this.locationId);
  @override
  List<Object> get props => [timestamp];
}