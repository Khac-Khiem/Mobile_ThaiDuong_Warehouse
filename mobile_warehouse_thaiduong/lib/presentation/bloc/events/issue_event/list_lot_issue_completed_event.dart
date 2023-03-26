// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class GoodsIssueLotCompletedEvent extends Equatable {}

class LoadGoodsIssueLotCompletedEvent extends GoodsIssueLotCompletedEvent {
  DateTime timestamp;
  LoadGoodsIssueLotCompletedEvent(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

// ignore: must_be_immutable
class UpdateGoodsIssueLotEvent extends GoodsIssueLotCompletedEvent {
  DateTime timestamp;
  UpdateGoodsIssueLotEvent(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

