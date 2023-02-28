import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/employee.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';

class GoodsIssueLot extends Equatable {
  String? goodsIssueLotId;
  double? quantity;
  double? sublotSize;
  Employee? employee;
  String? note;
  GoodsIssueLot(this.goodsIssueLotId, this.quantity, this.sublotSize,
      this.employee, this.note);
  @override
  // TODO: implement props
  List<Object?> get props => [goodsIssueLotId];
}

class GoodsIssueEntry extends Equatable {
  Item? item;
  double? requestSublotSize;
  double? requestQuantity;
  List<GoodsIssueLot>? lots;
  GoodsIssueEntry(
      this.item, this.requestSublotSize, this.requestQuantity, this.lots);
  @override
  // TODO: implement props
  List<Object?> get props => [item];
}

class GoodsIssue extends Equatable {
  String? goodsIssueId;
  String? purchaseOrderNumber;
  DateTime? timestamp;
  bool isConfirmed;
  String? receiver;
  List<GoodsIssueEntry>? entries;
  GoodsIssue(this.goodsIssueId, this.purchaseOrderNumber, this.timestamp,
      this.isConfirmed, this.receiver, this.entries);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


