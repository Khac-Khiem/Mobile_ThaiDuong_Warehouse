// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

abstract class CreateNewIssueEvent extends Equatable {}
// class LoadItemsDataEvent extends CreateNewIssueEvent {
//   DateTime timestamp;
//   LoadItemsDataEvent(this.timestamp);
//   @override
//   List<Object?> get props => [timestamp];
// }

// get danh số bộ phận, PO
// class LoadListDataEvent extends CreateNewIssueEvent {
//   DateTime timestamp;
//   List<GoodsIssueEntry> entriesIssue;
//   LoadListDataEvent(this.timestamp, this.entriesIssue);
//   @override
//   List<Object?> get props => [timestamp];
// }

//thêm 1 entry mới
class AddIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  // String issueId;
  // String receiver;
  // String poNumber;
  GoodsIssueEntry issueEntry;
  GoodsIssue goodsIssue;
  AddIssueEntryEvent(this.issueEntry, this.goodsIssue, this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}

// cập nhật entry cũ
class UpdateIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;

  GoodsIssue goodsIssue;
  GoodsIssueEntry issueEntry;
  int index;
  UpdateIssueEntryEvent(
      this.issueEntry, this.goodsIssue, this.index, this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}

// load lại danh sách entry
class LoadIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  // String issueId;
  // String receiver;
  // String poNumber;
  GoodsIssue goodsIssue;
  LoadIssueEntryEvent(this.goodsIssue, this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}

// post 1 đơn mới
class PostNewGoodsIssueEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  GoodsIssue goodsIssue;
  PostNewGoodsIssueEvent(this.goodsIssue, this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}
class UpdateIssueFailEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  GoodsIssue goodsIssue;
  
  UpdateIssueFailEvent(
      this.goodsIssue,  this.timestamp);
  @override
  List<Object?> get props => [timestamp];
}