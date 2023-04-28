import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/import_history_entry_model.dart';
import 'package:http/http.dart' as http;

class ImportHistoryService {
  Future<List<ImportHistoryEntryModel>> getImportHistoryByPo(
      String poNumber) async {
    final res = await http.get(Uri.parse(
        '${Constants.baseUrl}api/InventoryHistories/ByPO/Import?purchaseOrderNumber=$poNumber'));
    // 'api/stockcardentries/?StartTime=$startDate&EndTime=$endDate'));
    if (res.statusCode == 200) {
      print(res.body);
      List<dynamic> body = jsonDecode(res.body);
      List<ImportHistoryEntryModel> entries = body
          .map(
            (dynamic item) => ImportHistoryEntryModel.fromJson(item),
          )
          .toList();

      return entries;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<ImportHistoryEntryModel>> getImportHistoryBySupplier (
      DateTime startDate, DateTime endDate, String supplier ) async {
         final start = DateFormat('yyyy-MM-dd').format(startDate);
    final end = DateFormat('yyyy-MM-dd').format(endDate);
    final res = await http.get(Uri.parse(
        '${Constants.baseUrl}api/InventoryHistories/BySupplier/Import?supplier=$supplier&StartTime=$start&EndTime=$end'));
    if (res.statusCode == 200) {
      print(res.body);
      List<dynamic> body = jsonDecode(res.body);
      List<ImportHistoryEntryModel> entries = body
          .map(
            (dynamic item) => ImportHistoryEntryModel.fromJson(item),
          )
          .toList();

      return entries;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<ImportHistoryEntryModel>> getImportHistoryByItem(
      DateTime startDate, DateTime endDate, String itemId, String warehouseId) async {
    final start = DateFormat('yyyy-MM-dd').format(startDate);
    final end = DateFormat('yyyy-MM-dd').format(endDate);

    final res = await http.get(Uri.parse(
        '${Constants.baseUrl}api/InventoryHistories/Import?itemClassId=$warehouseId&StartTime=$start&EndTime=$end&itemId=$itemId'));
    if (res.statusCode == 200) {
      print(res.body);
      List<dynamic> body = jsonDecode(res.body);
      List<ImportHistoryEntryModel> entries = body
          .map(
            (dynamic item) => ImportHistoryEntryModel.fromJson(item),
          )
          .toList();

      return entries;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
