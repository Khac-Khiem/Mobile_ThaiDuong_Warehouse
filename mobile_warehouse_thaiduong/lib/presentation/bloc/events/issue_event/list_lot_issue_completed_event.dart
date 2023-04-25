import 'package:equatable/equatable.dart';

import '../../../../domain/entities/goods_issue.dart';

abstract class GoodsIssueLotCompletedEvent extends Equatable {}

class LoadGoodsIssueLotCompletedEvent extends GoodsIssueLotCompletedEvent {
  DateTime timestamp;
  GoodsIssue goodsIssue;
  LoadGoodsIssueLotCompletedEvent(this.timestamp, this.goodsIssue);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

//
class UpdateGoodsIssueLotEvent extends GoodsIssueLotCompletedEvent {
  DateTime timestamp;
  UpdateGoodsIssueLotEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
