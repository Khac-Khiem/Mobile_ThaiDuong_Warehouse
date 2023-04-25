import 'package:equatable/equatable.dart';

abstract class CompletedGoodsIssueEvent extends Equatable {}

class LoadCompletedGoodsIssuesEvent extends CompletedGoodsIssueEvent {
  DateTime timestamp;
  DateTime startDate;
  DateTime endDate;
  LoadCompletedGoodsIssuesEvent(this.timestamp, this.startDate, this.endDate);
  @override
  // TODO: implement props
  List<Object?> get props => [timestamp];
}
