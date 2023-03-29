import 'package:equatable/equatable.dart';

import '../../../../domain/entities/goods_issue.dart';

abstract class GoodsIssueEntryEvent extends Equatable {}

class LoadGoodsIssueEntryEvent extends GoodsIssueEntryEvent {
  DateTime timestamp;
  GoodsIssue goodsIssue;
  LoadGoodsIssueEntryEvent(this.timestamp,this.goodsIssue);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
