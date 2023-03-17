import 'package:mobile_warehouse_thaiduong/datasource/service/inventory_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/inventory_log_entry.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/inventory_repository.dart';

class InventoryRepoImpl implements InventoryRepository {
  final InventoryService inventoryService;
  InventoryRepoImpl(this.inventoryService);
  @override
  Future<List<InventoryLogEntry>> getInventoryByItemClass(
      String startDate, String endDate, String itemClassId) {
    throw UnimplementedError();
  }

  @override
  Future<List<InventoryLogEntry>> getInventoryByItemId(
      String startDate, String endDate, String itemId) {
    throw UnimplementedError();
  }

  @override
  Future<List<InventoryLogEntry>> getInventoryByTime(
      String startDate, String endDate) {
    throw UnimplementedError();
  }
}
