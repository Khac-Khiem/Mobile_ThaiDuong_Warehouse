import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';

class ImportHistoryEntry extends Equatable {
    String? supplier;
    DateTime? timestamp;
    List<LotsHistory>? lots;

    ImportHistoryEntry({this.supplier, this.timestamp, this.lots});
    
      @override
      // TODO: implement props
      List<Object?> get props => [timestamp];

   
}

class LotsHistory extends Equatable {
    String? goodsReceiptLotId;
    int? quantity;
    String? purchaseOrderNumber;
    Item? item;
    String? note;

    LotsHistory({this.goodsReceiptLotId, this.quantity, this.purchaseOrderNumber, this.item, this.note});
      @override
      // TODO: implement props
      List<Object?> get props => [goodsReceiptLotId];
}
