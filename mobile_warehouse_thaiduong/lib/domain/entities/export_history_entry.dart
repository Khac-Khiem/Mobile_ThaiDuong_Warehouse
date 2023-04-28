import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';

class ExportHistoryEntry extends Equatable {
    String? receiver;
    String? purchaseOrderNumber;
    DateTime? timestamp;
    List<EntriesHistory>? entries;

    ExportHistoryEntry({this.receiver, this.purchaseOrderNumber, this.timestamp, this.entries});
    
      @override
      // TODO: implement props
      List<Object?> get props => [timestamp];

  
}

class EntriesHistory extends Equatable {
    Item? item;
    String? unit;
    List<LotsHistory>? lots;

    EntriesHistory({this.item, this.unit, this.lots});
    
      @override
      // TODO: implement props
      List<Object?> get props => [];

   
}

class LotsHistory extends Equatable {
    String? goodsIssueLotId;
    int? quantity;
    String? note;

    LotsHistory({this.goodsIssueLotId, this.quantity, this.note});
    
      @override
      // TODO: implement props
      List<Object?> get props => [goodsIssueLotId];

  
}