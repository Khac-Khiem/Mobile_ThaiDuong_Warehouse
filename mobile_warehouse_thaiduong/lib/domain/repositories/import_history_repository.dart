import 'package:mobile_warehouse_thaiduong/domain/entities/import_history_entry.dart';

abstract class ImportHistoryRepoitory {
  Future<List<ImportHistoryEntry>> getImportHistoryByPO(String poNumber);
  Future<List<ImportHistoryEntry>> getImportHistoryBySupplier(
      String supplier, DateTime startDate, DateTime endDate);
  Future<List<ImportHistoryEntry>> getImportHistoryByItem(
      String warehouseId, String itemId, DateTime startDate, DateTime endDate);
}
