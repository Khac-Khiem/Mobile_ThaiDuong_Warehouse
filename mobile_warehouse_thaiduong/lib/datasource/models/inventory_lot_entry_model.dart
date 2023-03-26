// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:mobile_warehouse_thaiduong/domain/entities/inventory_log_entry.dart';

class InventoryLogEntryModel extends InventoryLogEntry {
  InventoryLogEntryModel(super.item, super.beforeQuantity, super.afterQuantity,
      super.timestamp, super.itemLot);
  factory InventoryLogEntryModel.fromJson(Map<String, dynamic> json) {
    return InventoryLogEntryModel(
      json['name'],
      json['name'],
      json['name'],
      json['name'],
      json['name'],
    );
  }
}
