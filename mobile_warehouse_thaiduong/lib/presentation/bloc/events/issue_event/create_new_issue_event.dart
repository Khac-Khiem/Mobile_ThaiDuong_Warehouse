import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

abstract class CreateNewIssueEvent extends Equatable {}
class LoadItemsDataEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  LoadItemsDataEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadDepartmentIdsEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  LoadDepartmentIdsEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class AddIssueEntryEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  IssueEntryView issueEntry;
  AddIssueEntryEvent(this.issueEntry, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class PostNewGoodsIssueEvent extends CreateNewIssueEvent {
  DateTime timestamp;
  List<IssueEntryView> issueEntries;
  PostNewGoodsIssueEvent(this.issueEntries, this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
