import 'package:mobile_warehouse_thaiduong/datasource/models/inventory_lot_entry_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/item_lot_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/item_model.dart';

class InventoryService {
  Future<List<InventoryLogEntryModel>> getInventoryByTime(
      String startDate, String endDate) async {
     return [InventoryLogEntryModel(
      ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), 
      100, 10,DateTime.now(), 
      ItemLotModel('123', ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null )),
    InventoryLogEntryModel(
      ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), 
      100, 10,DateTime.now(), 
      ItemLotModel('123', ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ))];
  }


  Future<List<InventoryLogEntryModel>> getInventoryByItemClass(
      DateTime startDate, DateTime endDate, String itemClassId) async {
    return [];
  }

  Future<List<InventoryLogEntryModel>> getInventoryByItemId(
      DateTime startDate, DateTime endDate, String itemId) async {
    return [InventoryLogEntryModel(
      ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), 
      100, 10,DateTime.now(), 
      ItemLotModel('123', ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null )),
    InventoryLogEntryModel(
      ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), 
      100, 10,DateTime.now(), 
      ItemLotModel('123', ItemModel('2', 'kk', UnitModel('cái'), ItemClassModel('TP'), 100, 10), false, 100, 10, "121212", 'Vị trí 1', null,null ))];
  }
}
