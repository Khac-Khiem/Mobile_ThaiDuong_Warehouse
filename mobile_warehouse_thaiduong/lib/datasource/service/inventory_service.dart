import 'package:mobile_warehouse_thaiduong/datasource/models/inventory_lot_entry_model.dart';

class InventoryService {
  Future<List<InventoryLogEntryModel>> getInventoryByTime(
      String startDate, String endDate) async {
    return [];
  }

  Future<List<InventoryLogEntryModel>> getInventoryByItemClass(
      DateTime startDate, DateTime endDate, String itemClassId) async {
    return [];
  }

  Future<List<InventoryLogEntryModel>> getInventoryByItemId(
      DateTime startDate, DateTime endDate, String itemId) async {
    return [];
  }
}
