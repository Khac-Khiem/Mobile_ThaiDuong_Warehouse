import 'package:mobile_warehouse_thaiduong/domain/entities/export_history_entry.dart';

abstract class ExportHistoryRepoitory {
  Future<List<ExportHistoryEntry>> getExportHistoryByPO(String poNumber);
  Future<List<ExportHistoryEntry>> getExportHistoryByReceiver(
      String receiver, DateTime startDate, DateTime endDate);
  Future<List<ExportHistoryEntry>> getExportHistoryByItem(
      String warehouseId, String itemId, DateTime startDate, DateTime endDate);
}
