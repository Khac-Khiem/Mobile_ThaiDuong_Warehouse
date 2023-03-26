// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class GoodsIssueLotEvent extends Equatable {}

class LoadGoodsIssueLotSuggestEvent extends GoodsIssueLotEvent {
  DateTime timestamp;
  LoadGoodsIssueLotSuggestEvent(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class AddGoodsIssueLotEvent extends GoodsIssueLotEvent {
  DateTime timestamp;
  ItemLot goodsIssueLot;
  AddGoodsIssueLotEvent(this.timestamp, this.goodsIssueLot);
  @override

  List<Object?> get props => [timestamp];
}

class PostGoodsIssueLotEvent extends GoodsIssueLotEvent {
  DateTime timestamp;
  List<ItemLot> lots;
  PostGoodsIssueLotEvent(this.timestamp, this.lots);
  @override

  List<Object?> get props => [timestamp];
}
