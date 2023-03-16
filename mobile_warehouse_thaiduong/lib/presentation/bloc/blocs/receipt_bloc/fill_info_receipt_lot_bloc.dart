// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_warehouse_thaiduong/domain/entities/item.dart';
// import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_receipt_usecase.dart';
// import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/events/receipt_event/fill_info_receipt_lot_event.dart';
// import 'package:mobile_warehouse_thaiduong/presentation/bloc/states/receipt_state/fill_info_receipt_lot_state.dart';

// class FillReceiptLotBloc
//     extends Bloc<FillInfoLotReceiptEvent, FillInfoReceiptLotState> {
//   GoodsReceiptUsecase goodsReceiptUsecase;
//   ItemUsecase itemUsecase;
//   FillReceiptLotBloc(this.goodsReceiptUsecase, this.itemUsecase):super(LoadItemDataLoadingState(DateTime.now())){
//       on<GetAllItemEvent>((event, emit) async {
//         emit(LoadItemDataLoadingState(DateTime.now()));
//         try {
//           final item =
//               await itemUsecase.getAllItem();
//          emit(LoadItemDataSuccessState(item, DateTime.now()));
//         } catch (e) {
//           //emit(Load(DateTime.now()));
//         }
//       });
//   }

// }
