import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/department_repository.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/goods_issue_repository.dart';

class GoodsIssueUseCase {
  final DepartmentRepository departmentRepository;
  final GoodsIssueRepository goodsIssueRepository;
  GoodsIssueUseCase(this.departmentRepository, this.goodsIssueRepository);
  Future<List<Department>> getAllDepartments() async {
    final departments = departmentRepository.getAllDepartments();
    return departments;
  }

  Future<ErrorPackage> postNewGoodsIssue(
      String goodsIssueId,
      String purchaseOrderNumber,
      DateTime timestamp,
      String receiver,
      List<GoodsIssueEntry> entries) async {
    final status = goodsIssueRepository.postNewGoodsIssue(
        goodsIssueId, purchaseOrderNumber, timestamp, receiver, entries);
    return status;
  }

  Future<List<GoodsIssue>> getUncompletedGoodsIssue() async {
    final goodsIssues = goodsIssueRepository.getUncompletedGoodsIssue();
    return goodsIssues;
  }

  Future<List<GoodsIssue>> getCompletedGoodsissue() async {
    final goodsIssues = goodsIssueRepository.getCompletedGoodsIssue();
    return goodsIssues;
  }

  Future<GoodsIssue> getGoodsIssueById(String goodsIssueId) async {
    final goodsIssue = goodsIssueRepository.getGoodsIssueById(goodsIssueId);
    return goodsIssue;
  }

  Future<ErrorPackage> updateGoodsIssueEntry(
      String goodsIssueId, String itemEntryId, double newQuantity) async {
    final status = goodsIssueRepository.updateGoodsIssueEntry(
        goodsIssueId, itemEntryId, newQuantity);
    return status;
  }

  Future<ErrorPackage> addGoodsIssueEntry(
      String goodsIssueId, GoodsIssueEntry goodsIssueEntry) async {
    final status =
        goodsIssueRepository.addGoodsIssueEntry(goodsIssueId, goodsIssueEntry);
    return status;
  }

  Future<ErrorPackage> addLotToGoodsIssue(
      String goodsIssueId, List<GoodsIssueLot> lots) async {
    final status = goodsIssueRepository.addLotToGoodsIssue(goodsIssueId, lots);
    return status;
  }

  Future<ErrorPackage> updateGoodsIssueLot(
      String goodsIssueId, String goodsIssueLotId, double newQuantity) async {
    final status = goodsIssueRepository.updateGoodsIssueLot(
        goodsIssueId, goodsIssueLotId, newQuantity);
    return status;
  }
    Future<List<GoodsIssueLot>> getGoodsIssueHistory(
      String warehouse,
      DateTime startDate,
      DateTime endDate,
      String itemId,
      String department,
      String receiver,
      String purchaseOrderNumber) async {
    final goodsReceipts = goodsIssueRepository.getGoodsIssueHistory(
        warehouse,
        startDate,
        endDate,
        itemId,
        department,
        receiver,
        purchaseOrderNumber);
    return goodsReceipts;
  }
}
