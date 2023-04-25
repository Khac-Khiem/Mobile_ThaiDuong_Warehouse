import 'package:intl/intl.dart';
import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_issue_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

class GoodsIssueService {
  List bodyJson = [];
  Future<ErrorPackageModel> postNewGoodsIssue(
      String goodsIssueId,
      String purchaseOrderNumber,
      DateTime timestamp,
      String receiver,
      List<GoodsIssueEntry> entries) async {
    List bodyJson = [];
    for (int i = 0; i < entries.length; i++) {
      Map<String, dynamic> dimensionJson = {
        "itemId": entries[i].item!.itemId.toString(),
        "unit": entries[i].item!.unit.toString(),
        "requestedSublotSize":
            double.tryParse(entries[i].requestSublotSize.toString()),
        "requestedQuantity":
            double.tryParse(entries[i].requestQuantity.toString())
      };
      bodyJson.add(dimensionJson);
    }
    final res =
        await http.post(Uri.parse('${Constants.baseUrl}/api/GoodsIssues'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'Accept': '*/*',
            },
            body: jsonEncode(
              <String, dynamic>{
                "goodsIssueId": goodsIssueId.toString(),
                "receiver": receiver.toString(),
                "purchaseOrderNumber": purchaseOrderNumber.toString(),
                "timestamp": DateFormat('yyyy-MM-dd').format(timestamp),
                //"timestamp": "2023-04-18",
                "employeeId": "NV01",
                "entries": bodyJson
              },
            ));
    if (res.statusCode == 200) {
      return ErrorPackageModel(
        "success",
      );
    } else {
      return ErrorPackageModel("fail");
    }
  }

  Future<List<GoodsIssueModel>> getUncompletedGoodsIssue() async {
    final res = await http.get(
      Uri.parse('${Constants.baseUrl}api/GoodsIssues/Unconfirmed'),
      // headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Accept': '*/*',
      //   'Authorization': 'Bearer ',
      // },
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<GoodsIssueModel> allIssues = body
          .map(
            (dynamic item) => GoodsIssueModel.fromJson(item),
          )
          .toList();
      return allIssues;
    }
    if (res.statusCode == 204) {
      return [];
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<List<GoodsIssueModel>> getCompletedGoodsissue(
      DateTime startDate, DateTime endDate) async {
    final res = await http.get(
      Uri.parse(
          '${Constants.baseUrl}api/GoodsIssues?StartDate=$startDate&EndDate=$endDate'),
      // headers: {
      //   'Content-Type': 'application/json; charset=UTF-8',
      //   'Accept': '*/*',
      //   'Authorization': 'Bearer ',
      // },
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<GoodsIssueModel> allIssues = body
          .map(
            (dynamic item) => GoodsIssueModel.fromJson(item),
          )
          .toList();
      return allIssues;
    }
    if (res.statusCode == 204) {
      return [];
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<GoodsIssueModel> getGoodsIssueById(String goodsIssueId) async {
    final res = await http.get(
        Uri.parse(Constants.baseUrl + 'api/goodsissues/$goodsIssueId'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
        });
    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      GoodsIssueModel issue = GoodsIssueModel.fromJson(body);

      return issue;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<ErrorPackageModel> updateGoodsIssueEntry(
      String goodsIssueId, String itemEntryId, double newQuantity) async {
    return ErrorPackageModel(
      "success",
    );
  }

  Future<ErrorPackageModel> addGoodsIssueEntry(
      String goodsIssueId, GoodsIssueEntry goodsIssueEntry) async {
    return ErrorPackageModel(
      "success",
    );
  }

  Future<ErrorPackageModel> updateGoodsIssueLot(
      String goodsIssueId, String goodsIssueLotId, double newQuantity) async {
    return ErrorPackageModel(
      "success",
    );
  }

  Future<ErrorPackageModel> addLotToGoodsIssue(
      String goodsIssueId, String itemId, List<GoodsIssueLot> lots) async {
    List bodyJson = [];
    for (int i = 0; i < lots.length; i++) {
      Map<String, dynamic> dimensionJson = {
        "goodsIssueLotId": lots[i].goodsIssueLotId.toString(),
        "itemId": itemId,
        "quantity": double.tryParse(lots[i].quantity.toString()),
        "sublotSize": double.tryParse(lots[i].sublotSize.toString()),
        "note": lots[i].note.toString(),
        "employeeId": "NV01"
      };
      bodyJson.add(dimensionJson);
    }
    final res = await http.patch(
        Uri.parse(
            '${Constants.baseUrl}api/GoodsIssues/$goodsIssueId/goodsIssueLots'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*',
        },
        body: jsonEncode(bodyJson));
    if (res.statusCode == 200) {
      return ErrorPackageModel(
        "success",
      );
    } else {
      return ErrorPackageModel("fail");
    }
  }
}
