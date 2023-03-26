// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/department.dart';
import 'package:mobile_warehouse_thaiduong/domain/entities/goods_issue.dart';

//import '../../../../domain/entities/item.dart';

abstract class CreaNewIssueState extends Equatable {}

class CreateNewIssueInitialState extends CreaNewIssueState {
  @override
 
  List<Object?> get props => throw UnimplementedError();
}

// class LoadItemDataLoadingState extends CreaNewIssueState {
//   DateTime timestamp;
//   LoadItemDataLoadingState(this.timestamp);

//   @override

//   List<Object?> get props => [timestamp];
// }

// class LoadItemDataSuccessState extends CreaNewIssueState {
//   DateTime timestamp;
//   List<Item> items;
//   LoadItemDataSuccessState(this.items, this.timestamp);
//   @override

//   List<Object?> get props => [timestamp];
// }

// class LoadItemDataFailState extends CreaNewIssueState {
//   DateTime timestamp;
//   LoadItemDataFailState(this.timestamp);

//   @override

//   List<Object?> get props => [timestamp];
// }

class LoadDepartmentLoadingState extends CreaNewIssueState {
  DateTime timestamp;
  LoadDepartmentLoadingState(this.timestamp);

  @override

  List<Object?> get props => [timestamp];
}

class LoadDepartmentSuccessState extends CreaNewIssueState {
  List<Department> departments;
  DateTime timestamp;
  LoadDepartmentSuccessState(this.departments, this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}
//-------------------
class UpdateEntryToGoodsIssueLoading extends CreaNewIssueState {
  DateTime timestamp;
  UpdateEntryToGoodsIssueLoading(this.timestamp);

  @override

  List<Object?> get props => [timestamp];
}

class UpdateEntryToGoodsIssueSuccess extends CreaNewIssueState {
  DateTime timestamp;
  List<IssueEntryView> issueEntries;
  UpdateEntryToGoodsIssueSuccess(this.timestamp, this.issueEntries);
  @override

  List<Object?> get props => [timestamp];
}

class UpdateEntryToGoodsIssueFailState extends CreaNewIssueState {
  DateTime timestamp;
  UpdateEntryToGoodsIssueFailState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}
//--------------------
class PostNewGoodsIssueLoadingState extends CreaNewIssueState {
  DateTime timestamp;
  PostNewGoodsIssueLoadingState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class PostNewGoodsIssueSuccessState extends CreaNewIssueState {
  DateTime timestamp;
  PostNewGoodsIssueSuccessState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}

class PostNewGoodsIssueFailState extends CreaNewIssueState {
  DateTime timestamp;
  PostNewGoodsIssueFailState(this.timestamp);
  @override

  List<Object?> get props => [timestamp];
}
