import 'package:get_it/get_it.dart';
import 'package:mobile_warehouse_thaiduong/datasource/repositories_impl/goods_receipt_repo_impl.dart';
import 'package:mobile_warehouse_thaiduong/datasource/repositories_impl/item_repo_impl.dart';
import 'package:mobile_warehouse_thaiduong/datasource/repositories_impl/login_repo_impl.dart';
import 'package:mobile_warehouse_thaiduong/datasource/service/goods_receipt_service.dart';
import 'package:mobile_warehouse_thaiduong/datasource/service/item_service.dart';
import 'package:mobile_warehouse_thaiduong/datasource/service/login_service.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/goods_receipt_repository.dart';
import 'package:mobile_warehouse_thaiduong/domain/repositories/item_repository.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_issue_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/goods_receipt_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/item_usecase.dart';
import 'package:mobile_warehouse_thaiduong/domain/usecases/login_usecase.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/create_new_issue_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/fill_info_issue_enry_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/login_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/completed_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/completed_receipt_lot_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/create_new_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/fill_info_receipt_lot_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/uncompleted_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/uncompleted_receipt_lot_bloc.dart';

import 'domain/repositories/login_repository.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
//register data service
  injector.registerSingleton<LoginService>(LoginService());
  injector.registerSingleton<ItemService>(ItemService());
  injector.registerSingleton<GoodsReceiptService>(GoodsReceiptService());

// register repository
  injector.registerSingleton<LoginRepository>(LoginRepositoryImpl(injector()));
  injector.registerSingleton<ItemRepository>(ItemRepoImpl(injector()));
  injector.registerSingleton<GoodsReceiptRepository>(
      GoodsReceiptRepoImpl(injector()));

// register usecase
  injector.registerSingleton<LoginUsecase>(LoginUsecase(injector()));
  injector.registerSingleton<ItemUsecase>(ItemUsecase(injector()));
  injector
      .registerSingleton<GoodsReceiptUsecase>(GoodsReceiptUsecase(injector()));

       injector
      .registerSingleton<GoodsIssueUseCase>(GoodsIssueUseCase(injector(), injector()));

// register bloc
  injector.registerSingleton<LoginBloc>(LoginBloc(injector()));
  injector.registerSingleton<CreateReceiptBloc>(CreateReceiptBloc(injector(), injector()));
  injector.registerSingleton<FillReceiptLotBloc>(
      FillReceiptLotBloc(injector(), injector()));
  injector.registerSingleton<ExportingReceiptBloc>(ExportingReceiptBloc(
    injector(),
  ));
  injector.registerSingleton<ExportingReceiptLotBloc>(ExportingReceiptLotBloc(
    injector(),
  ));
  injector.registerSingleton<CompletedReceiptBloc>(CompletedReceiptBloc(
    injector(),
  ));
  injector.registerSingleton<CompletedReceiptLotBloc>(CompletedReceiptLotBloc(
    injector(),
  ));
  //  injector.registerSingleton<CreateIssueBloc>(CreateIssueBloc(
  //   injector(),
  // ));
  //  injector.registerSingleton<FillInfoIssueEntryBloc>(FillInfoIssueEntryBloc(
  //   injector(),injector()
  // ));
}
