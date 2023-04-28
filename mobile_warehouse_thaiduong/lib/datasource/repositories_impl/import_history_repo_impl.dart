import 'package:mobile_warehouse_thaiduong/datasource/service/import_history_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/import_history_entry.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/import_history_repository.dart';

class ImportHistoryRepoImpl implements ImportHistoryRepoitory {
  final ImportHistoryService importHistoryService;
  ImportHistoryRepoImpl(this.importHistoryService);
  @override
  Future<List<ImportHistoryEntry>> getImportHistoryByItem(
      String warehouseId, String itemId, DateTime startDate, DateTime endDate) {
    // TODO: implement getImportHistoryByItem
    final entries = importHistoryService.getImportHistoryByItem(
        startDate, endDate, itemId, warehouseId);
    return entries;
  }

  @override
  Future<List<ImportHistoryEntry>> getImportHistoryByPO(String poNumber) {
    // TODO: implement getImportHistoryByPO
    final entries = importHistoryService.getImportHistoryByPo(poNumber);
    return entries;
  }

  @override
  Future<List<ImportHistoryEntry>> getImportHistoryBySupplier(
      String supplier, DateTime startDate, DateTime endDate) {
    // TODO: implement getImportHistoryBySupplier
    final entries = importHistoryService.getImportHistoryBySupplier(
        startDate, endDate, supplier);
    return entries;
  }
}
