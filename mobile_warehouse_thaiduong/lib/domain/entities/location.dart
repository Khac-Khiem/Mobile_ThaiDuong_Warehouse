import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

class Location extends Equatable {
  String locationId;
  //List<ItemLot>? lots;
  Location(this.locationId, );
  @override
  // TODO: implement props
  List<Object?> get props => [locationId];
}

class Warehouse extends Equatable {
  String warehouseId;
  String warehouseName;
  List<Location>? locations;
  Warehouse(this.warehouseId, this.warehouseName, this.locations);
  @override
  // TODO: implement props
  List<Object?> get props => [warehouseId];
}
