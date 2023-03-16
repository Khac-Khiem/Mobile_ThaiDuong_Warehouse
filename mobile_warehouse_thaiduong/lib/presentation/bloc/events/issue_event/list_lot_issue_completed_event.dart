import 'package:equatable/equatable.dart';

abstract class GoodsIssueLotCompletedEvent extends Equatable {}

class LoadGoodsIssueLotCompletedEvent extends GoodsIssueLotCompletedEvent {
  DateTime timestamp;
  LoadGoodsIssueLotCompletedEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class UpdateGoodsIssueLotEvent extends GoodsIssueLotCompletedEvent {
  DateTime timestamp;
  UpdateGoodsIssueLotEvent(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

