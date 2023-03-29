import 'package:equatable/equatable.dart';

class ErrorPackage extends Equatable {
  String detail;
  ErrorPackage(this.detail);
  
  @override
  List<Object?> get props => throw UnimplementedError();
}
