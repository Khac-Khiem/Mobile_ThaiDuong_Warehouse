// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

abstract class GoodsIssueEntryEvent extends Equatable {}

class LoadGoodsIssueEntryEvent extends GoodsIssueEntryEvent {
  DateTime timestamp;
  LoadGoodsIssueEntryEvent(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}
