import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

abstract class CreateNewIssueEvent extends Equatable {}
// class LoadItemsDataEvent extends CreateNewIssueEvent {
//   DateTime timestamp;
//   LoadItemsDataEvent(this.timestamp);
//   @override
//   // TODO: implement props
//   List<Object?> get props => [timestamp];
// }

// get danh số bộ phận, PO
class LoadListDataEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  List<IssueEntryView> entriesIssue;
  LoadListDataEvent(this.timestamp, this.entriesIssue);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
 //thêm 1 entry mới
class AddIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  // String issueId;
  // String receiver;
  // String poNumber;
  IssueEntryView issueEntry;
  List<IssueEntryView> issueEntries;
  AddIssueEntryEvent(
      this.issueEntry, this.issueEntries, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

// cập nhật entry cũ
class UpdateIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  // String issueId;
  // String receiver;
  // String poNumber;
  List<IssueEntryView> issueEntries;
  IssueEntryView issueEntry;
  int index;
  UpdateIssueEntryEvent(
      this.issueEntry, this.issueEntries, this.index, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

// load lại danh sách entry 
class LoadIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  // String issueId;
  // String receiver;
  // String poNumber;
  List<IssueEntryView> issueEntries;
  LoadIssueEntryEvent(
       this.issueEntries, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}



// post 1 đơn mới
class PostNewGoodsIssueEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  List<IssueEntryView> issueEntries;
  PostNewGoodsIssueEvent(this.issueEntries, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
