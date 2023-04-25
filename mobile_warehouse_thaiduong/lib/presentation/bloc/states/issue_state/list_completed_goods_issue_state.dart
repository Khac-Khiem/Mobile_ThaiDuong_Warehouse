import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

abstract class CompletedGoodsIssueState extends Equatable {}

class LoadCompletedGoodsIssueInitState extends CompletedGoodsIssueState {
  DateTime timestamp;
  LoadCompletedGoodsIssueInitState(this.timestamp);

  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadCompletedGoodsIssuesLoadingState extends CompletedGoodsIssueState {
  DateTime timestamp;
  LoadCompletedGoodsIssuesLoadingState(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadCompletedGoodsIssuesSuccessState extends CompletedGoodsIssueState {
  DateTime timestamp;
  List<GoodsIssue> goodsIssues;
  LoadCompletedGoodsIssuesSuccessState(this.timestamp, this.goodsIssues);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadCompletedGoodsIssuesFailState extends CompletedGoodsIssueState {
  DateTime timestamp;
  String detail;
  LoadCompletedGoodsIssuesFailState(this.timestamp, this.detail);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
