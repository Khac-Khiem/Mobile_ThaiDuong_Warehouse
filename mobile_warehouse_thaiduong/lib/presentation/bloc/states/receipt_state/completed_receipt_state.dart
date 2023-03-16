import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_receipt.dart';

abstract class CompletedReceiptState extends Equatable {}

class CompletedReceiptInitState extends CompletedReceiptState {
  DateTime timestamp;
  CompletedReceiptInitState(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadingReceiptCompletedState extends CompletedReceiptState {
  DateTime timestamp;
  LoadingReceiptCompletedState(this.timestamp);
  @override

  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadReceiptCompletedStateFail extends CompletedReceiptState {
  DateTime timestamp;
  String detail;
  LoadReceiptCompletedStateFail(this.timestamp, this.detail);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class LoadReceiptCompletedStateSuccess extends CompletedReceiptState {
  DateTime timestamp;
  List<GoodsReceipt> receipts;
  LoadReceiptCompletedStateSuccess(this.timestamp, this.receipts);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class UpdateLotReceiptCompletedStateSuccess extends CompletedReceiptState {
  DateTime timestamp;
  UpdateLotReceiptCompletedStateSuccess(this.timestamp);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}

class UpdateLotReceiptCompletedStateFail extends CompletedReceiptState {
  DateTime timestamp;
  String detail;
  UpdateLotReceiptCompletedStateFail(this.timestamp, this.detail);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
