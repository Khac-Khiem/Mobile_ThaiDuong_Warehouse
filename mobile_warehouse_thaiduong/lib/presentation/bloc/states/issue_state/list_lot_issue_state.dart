// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item_lot.dart';

abstract class GoodsIssueLotState extends Equatable {}

class LoadingGoodsIssueLotsSuggestState extends GoodsIssueLotState {
  DateTime timestamp;
  LoadingGoodsIssueLotsSuggestState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class LoadGoodsIssueLotsSuggestSuccessState extends GoodsIssueLotState {
  DateTime timestamp;
  List<ItemLot> lots;
  LoadGoodsIssueLotsSuggestSuccessState(this.timestamp, this.lots);
  @override

  List<Object?> get props => [timestamp];
}

class LoadGoodsIssueLotsSuggestFailState extends GoodsIssueLotState {
  DateTime timestamp;
  LoadGoodsIssueLotsSuggestFailState(this.timestamp);
  @override
  
  List<Object?> get props => [timestamp];
}
//-----

class AddGoodsIssueLotsLoadingState extends GoodsIssueLotState {
  DateTime timestamp;
  AddGoodsIssueLotsLoadingState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class AddIssueLotsSuccessState extends GoodsIssueLotState {
  DateTime timestamp;
  ItemLot lots;
  AddIssueLotsSuccessState(this.timestamp, this.lots);
  @override

  List<Object?> get props => [timestamp];
}

class AddIssueLotsFailState extends GoodsIssueLotState {
  DateTime timestamp;
  AddIssueLotsFailState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

//---------

class PostGoodsIssueLotsLoadingState extends GoodsIssueLotState {
  DateTime timestamp;
  PostGoodsIssueLotsLoadingState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class PostIssueLotsSuccessState extends GoodsIssueLotState {
  DateTime timestamp;

  PostIssueLotsSuccessState(
    this.timestamp,
  );
  @override

  List<Object?> get props => [timestamp];
}

class PostGoodsIssueLotsFailState extends GoodsIssueLotState {
  DateTime timestamp;
  PostGoodsIssueLotsFailState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}
