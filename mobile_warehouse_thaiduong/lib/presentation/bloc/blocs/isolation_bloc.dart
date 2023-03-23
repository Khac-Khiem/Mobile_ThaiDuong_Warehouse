// import 'dart:async';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
// import 'package:mobile_warehouse_thaiduong/domain/usecases/item_lot_usecase.dart';
// import 'package:mobile_warehouse_thaiduong/domain/usecases/location_usecase.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/isolation_events.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/isolation_states.dart';

// class IsolationBloc extends Bloc<IsolationEvent, IsolationState> {
//   ItemUsecase itemUsecase;
//   ItemLotUsecase itemLotUsecase;
//   LocationUsecase locationUsecase;
//   IsolationBloc(this.itemUsecase, this.locationUsecase, this.itemLotUsecase)
//       : super(GetAllItemLoadingState(DateTime.now())) {

//     on<GetAllItemEvent>((event, emit) async {
//       emit(GetAllItemLoadingState(DateTime.now()));
//       try {
//         final items = await itemUsecase.getAllItem();
//         emit(GetAllItemSuccessState(DateTime.now(), items));
//       } catch (e) {
//         //emit(Load(DateTime.now()));
//       }
//     });
//     // list lô hàng theo itemId
//        on<GetLotByItemIdEvent>((event, emit) async {
//       emit(GetLotByItemIdLoadingState(DateTime.now()));
//       try {
//         final itemLot = await itemLotUsecase.getItemLotsByItemId(event.itemId);
//         itemLot.isNotEmpty
//             ? emit(GetLotByItemIdSuccessState(DateTime.now(), itemLot))
//             : emit(GetLotByItemIdFailState(
//                 DateTime.now(), ));
//       } catch (e) {
//         emit(GetLotByItemIdFailState(
//             DateTime.now()));
//       }
//     });


//     // chọn lô để cách ly 
// on<AddNewIsolationEvent>((event, emit) async {
//       emit(ReceiptLoadingState(DateTime.now()));
//       try {
//         event.lots.add(event.itemLotView);
//         emit(UpdateLotReceiptStateSuccess(DateTime.now(), event.lots));
//       } catch (e) {
//         // emit(LoginStateLoginFailure(DateTime.now()));
//       }
//     });
// // Danh sách hàng hóa đang chờ xử lý
//     on<GetAllIsolationLotEvent>((event, emit) async {
//       emit(GetLotByLocationLoadingState(DateTime.now()));
//       try {
//         final itemLots =
//             await itemLotUsecase.getItemLotsByLocation(event.locationId);
//         itemLots.isNotEmpty
//             ? emit(GetLotByLocationSuccessState(DateTime.now(), itemLots))
//             : emit(GetLotByLocationFailState(
//                 DateTime.now(), 'Không có lô ở vị trí này'));
//       } catch (e) {
//         emit(GetLotByLocationFailState(
//             DateTime.now(), 'Không truy xuất được dữ liệu'));
//       }
//     });

