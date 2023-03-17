import 'package:equatable/equatable.dart';

import '../../../../domain/entities/item_lot.dart';

class FillInfoLotReceiptEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class GetAllItemEvent extends FillInfoLotReceiptEvent {
  DateTime timestamp;
  List<ItemLotView> lots;
  int index;
  GetAllItemEvent(this.timestamp, this.lots, this.index);
  @override
  List<Object> get props => [timestamp];
}
