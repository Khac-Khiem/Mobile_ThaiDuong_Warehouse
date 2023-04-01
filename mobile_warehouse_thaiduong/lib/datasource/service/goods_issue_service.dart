import 'package:mobile_warehouse_thaiduong/constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_issue_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/item_model.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/global.dart';

class GoodsIssueService {
  List bodyJson = [];
  Future<ErrorPackageModel> postNewGoodsIssue(
      String goodsIssueId,
      String purchaseOrderNumber,
      DateTime timestamp,
      String receiver,
      List<GoodsIssueEntry> entries) async {
    final res =
        await http.post(Uri.parse(Constants.baseUrl + 'api/goodsreceipts/'),
            headers: {
              'Content-Type': 'application/json',
              'Authorization': 'Bearer ',
            },
            body: jsonEncode(
              <String, dynamic>{},
            ));
    if (res.statusCode == 200) {
      return ErrorPackageModel(
        "success",
      );
    } else {
      dynamic body = jsonDecode(res.body);
      ErrorPackageModel error = ErrorPackageModel.fromJson(body);
      return error;
    }
  }

  Future<List<GoodsIssueModel>> getUncompletedGoodsIssue() async {
    // final res = await http.get(
    //   Uri.parse(Constants.baseUrl + 'api/goodsissues/pending'),
    //   headers: {
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Accept': '*/*',
    //     'Authorization': 'Bearer ',
    //   },
    // );

    // if (res.statusCode == 200) {
    //   List<dynamic> body = jsonDecode(res.body);

    //   List<GoodsIssueModel> allIssues = body
    //       .map(
    //         (dynamic item) => GoodsIssueModel.fromJson(item),
    //       )
    //       .toList();
    //   return allIssues;
    // } else {
    //   throw "Unable to retrieve posts.";
    // }
    return [
      GoodsIssueModel('đơn 1', null, null, false, 'PKK', [
        GoodsIssueEntry(
            ItemModel(
                '1', 'Một', UnitModel('cái'), ItemClassModel('TP'), 100, 10),
            10,
            100,
            []),
            GoodsIssueEntry(
            ItemModel(
                '2', 'Hai', UnitModel('cái'), ItemClassModel('BTP'), 100, 10),
            10,
            100,
            [])
      ]),
      GoodsIssueModel('đơn 2', null, null, false, 'PKK', [
        GoodsIssueEntry(
            ItemModel(
                '1', 'Một', UnitModel('cái'), ItemClassModel('TP'), 100, 10),
            10,
            100,
            [])
      ])
    ];
  }

  Future<List<GoodsIssueModel>> getCompletedGoodsissue() async {
    final res = await http.get(
      Uri.parse(Constants.baseUrl + 'api/goodsissues/pending'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': '*/*',
        'Authorization': 'Bearer ',
      },
    );

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<GoodsIssueModel> allIssues = body
          .map(
            (dynamic item) => GoodsIssueModel.fromJson(item),
          )
          .toList();
      return allIssues;
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
      String goodsIssueId, List<GoodsIssueLot> lots) async {
    return ErrorPackageModel(
      "success",
    );
  }
}
