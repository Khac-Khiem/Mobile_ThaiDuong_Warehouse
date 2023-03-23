import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/error_package.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/department_repository.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/goods_issue_repository.dart';

class GoodsIssueUseCase {
  final DepartmentRepository departmentRepository;
  final GoodsIssueRepository goodsIssueRepository;
  GoodsIssueUseCase(this.departmentRepository, this.goodsIssueRepository);
  Future<List<Department>> getAllDepartment() async {
    final departments = departmentRepository.getAllDepartment();
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
}