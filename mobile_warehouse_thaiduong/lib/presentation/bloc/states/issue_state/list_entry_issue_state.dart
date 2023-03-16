import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

abstract class GoodsIssueEntryState extends Equatable {}

class LoadGoodsIssueEntryLoadingState extends GoodsIssueEntryState {
  DateTime timestamp;
  LoadGoodsIssueEntryLoadingState(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadGoodsIssueEntrySuccessState extends GoodsIssueEntryState {
  DateTime timestamp;
  List<GoodsIssue> goodsIssues;
  LoadGoodsIssueEntrySuccessState(this.timestamp, this.goodsIssues);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadGoodsIssueEntryFailState extends GoodsIssueEntryState {
  DateTime timestamp;
  LoadGoodsIssueEntryFailState(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
