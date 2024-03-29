// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/employee.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';

class GoodsReceiptLot extends Equatable {
  String goodsReceiptLotId;
  Item? item;
  String?unit;
  double? quantity;
  double? sublotSize;
  String? purchaseOrderNumber;
  Employee? employeeId;
  String? location;
  DateTime? productionDate;
  DateTime? expirationDate;
  String? note;
  GoodsReceiptLot(
      this.goodsReceiptLotId,
      this.item,
      this.unit,
      this.quantity,
      this.sublotSize,
      this.purchaseOrderNumber,
      this.employeeId,
      this.location,
      this.productionDate,
      this.expirationDate,
      this.note);
  @override
  List<Object?> get props => [goodsReceiptLotId];
}

class GoodsReceipt extends Equatable {
  String? goodsReceiptId;
  String? supply;
  List<GoodsReceiptLot> lots;
  DateTime? timestamp;
  Employee? empployee;
  bool isConfirmed;
  GoodsReceipt(this.goodsReceiptId, this.supply, this.lots, this.timestamp,
      this.empployee, this.isConfirmed);
  @override
  List<Object?> get props => [goodsReceiptId];
}
