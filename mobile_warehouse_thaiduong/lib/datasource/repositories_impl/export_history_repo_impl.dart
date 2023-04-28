import 'package:mobile_warehouse_thaiduong/datasource/service/export_history_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/export_history_entry.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/export_history_repository.dart';

class ExportHistoryRepoImpl implements ExportHistoryRepoitory {
  final ExportHistoryService exportHistoryService;
  ExportHistoryRepoImpl(this.exportHistoryService);
  @override
  Future<List<ExportHistoryEntry>> getExportHistoryByItem(
      String warehouseId, String itemId, DateTime startDate, DateTime endDate) {
    // TODO: implement getExportHistoryByItem
    final entries = exportHistoryService.getExportHistoryByItem(
        startDate, endDate, itemId, warehouseId);
    return entries;
  }

  @override
  Future<List<ExportHistoryEntry>> getExportHistoryByPO(String poNumber) {
    // TODO: implement getExportHistoryByPO
    final entries = exportHistoryService.getExportHistoryByPo(poNumber);
    return entries;
  }

  @override
  Future<List<ExportHistoryEntry>> getExportHistoryByReceiver(
      String receiver, DateTime startDate, DateTime endDate) {
    // TODO: implement getExportHistoryByReceiver
    final entries = exportHistoryService.getExportHistoryByReceiver(
        startDate, endDate, receiver);
    return entries;
  }
}
