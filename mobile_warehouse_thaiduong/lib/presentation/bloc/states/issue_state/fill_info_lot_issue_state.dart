import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';

abstract class FillInfoIssueEntryState extends Equatable {}

class LoadItemDataLoadingState extends FillInfoIssueEntryState {
  DateTime timestamp;
  LoadItemDataLoadingState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
class LoadItemDataSuccessState extends FillInfoIssueEntryState {
  //  String issueId;
  // String receiver;
  // String poNumber;
  List<Item> items;
  List<IssueEntryView> entries;
  int index;
  DateTime timestamp;
  @override
  LoadItemDataSuccessState( this.items, this.entries, this.index, this.timestamp);
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadItemDataFailState extends FillInfoIssueEntryState {
  DateTime timestamp;
  LoadItemDataFailState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
