import 'package:mobile_warehouse_thaiduong/datasource/models/error_package_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/models/goods_issue_model.dart';
import 'package:mobile_warehouse_thaiduong/datasource/service/goods_issue_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/goods_issue_repository.dart';

class GoodsIssueRepoImpl implements GoodsIssueRepository {
  final GoodsIssueService goodsIssueService;
  GoodsIssueRepoImpl(this.goodsIssueService);
  @override
  Future<ErrorPackageModel> addGoodsIssueEntry(
      String goodsIssueId, GoodsIssueEntry goodsIssueEntry) async {
    final status =
        goodsIssueService.addGoodsIssueEntry(goodsIssueId, goodsIssueEntry);
    return status;
  }

  @override
  Future<ErrorPackageModel> addLotToGoodsIssue(
      String goodsIssueId, String itemId, List<GoodsIssueLot> lots) async {
    final status = goodsIssueService.addLotToGoodsIssue(goodsIssueId,itemId, lots);
    return status;
  }

  @override
  Future<List<GoodsIssueModel>> getCompletedGoodsissue(DateTime startDate, DateTime endDate) async {
    final goodsIssues = goodsIssueService.getCompletedGoodsissue(startDate,endDate);
    return goodsIssues;
  }

  @override
  Future<GoodsIssueModel> getGoodsIssueById(String goodsIssueId)async {
    final goodsIssue = goodsIssueService.getGoodsIssueById(goodsIssueId);
    return goodsIssue;
  }

  @override
  Future<List<GoodsIssue>> getUncompletedGoodsIssue() async{
    final goodsIssues = goodsIssueService.getUncompletedGoodsIssue();
    return goodsIssues;
  }

  @override
  Future<ErrorPackageModel> postNewGoodsIssue(
     GoodsIssue goodsIssue)async {
    final status = goodsIssueService.postNewGoodsIssue(
      goodsIssue);
    return status;
  }

  @override
  Future<ErrorPackage> updateGoodsIssueEntry(
      String goodsIssueId, String itemEntryId, double newQuantity) async{
    final status = goodsIssueService.updateGoodsIssueEntry(
        goodsIssueId, itemEntryId, newQuantity);
    return status;
  }

  @override
  Future<ErrorPackage> updateGoodsIssueLot(
      String goodsIssueId, String goodsIssueLotId, double newQuantity)async {
    final status = goodsIssueService.updateGoodsIssueLot(
        goodsIssueId, goodsIssueLotId, newQuantity);
    return status;
  }
}
