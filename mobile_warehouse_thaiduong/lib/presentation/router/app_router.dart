import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_warehouse_thaiduong/injector.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/create_new_issue_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/fill_info_issue_enry_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/list_goods_issue_uncompleted_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/list_issue_entry_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/issue_bloc/list_lot_issue_uncompleted_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/login_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/completed_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/completed_receipt_lot_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/create_new_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/fill_info_receipt_lot_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/uncompleted_receipt_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/bloc/blocs/receipt_bloc/uncompleted_receipt_lot_bloc.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/create_new_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/export_function_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/fill_info_lot_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/list_entry_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/export/list_good_issue_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/create_new_receipt_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/fill_info_lot_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/import_function_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/list_completed_receipt.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/list_completed_receipt_lot_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/list_uncompleted_receipt.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/import/list_uncompleted_receipt_lot_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/others/home_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/others/login_screen.dart';
import 'package:mobile_warehouse_thaiduong/presentation/screens/others/main_screen.dart';

import '../bloc/events/issue_event/list_lot_issue_event.dart';
import '../screens/export/fill_main_info_issue_screen.dart';
import '../screens/export/list_lot_issue_screen.dart';

class AppRoute {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '//':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<LoginBloc>(create: (context) => injector()),
                ], child: LoginScreen()));
      case '/main_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<LoginBloc>(create: (context) => injector()),
                ], child: const MainScreen()));
      case '/main_receipt_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateReceiptBloc>(
                      create: (context) => injector()),
                  BlocProvider<CompletedReceiptBloc>(
                      create: (context) => injector()),
                  BlocProvider<ExportingReceiptBloc>(
                      create: (context) => injector()),
                ], child: const ImportFunctionScreen()));
      case '/create_receipt_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateReceiptBloc>(
                      create: (context) => injector()),
                  BlocProvider<FillReceiptLotBloc>(
                      create: (context) => injector()),
                ], child: const CreateNewReceiptScreen()));
      case '/fill_lot_receipt_screen':
        return MaterialPageRoute(
            settings: routeSettings,
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateReceiptBloc>(
                      create: (context) => injector()),
                  BlocProvider<FillReceiptLotBloc>(
                      create: (context) => injector()),
                  BlocProvider<ExportingReceiptLotBloc>(
                      create: (context) => injector()),
                ], child: FillInfoLotReceiptScreen()));
      case '/importing_receipt_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ExportingReceiptBloc>(
                      create: (context) => injector()),
                  BlocProvider<ExportingReceiptLotBloc>(
                      create: (context) => injector()),
                ], child: const ListUncompletedGoodReceiptScreen()));
      case '/importing_receipt_lot_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ExportingReceiptLotBloc>(
                      create: (context) => injector()),
                  BlocProvider<FillReceiptLotBloc>(
                      create: (context) => injector()),
                ], child: const ListUncompletedLotReceiptScreen()));
      case '/imported_receipt_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CompletedReceiptBloc>(
                      create: (context) => injector()),
                  BlocProvider<CompletedReceiptLotBloc>(
                      create: (context) => injector()),
                ], child: const ListCompletedReceiptScreen()));
      case '/imported_receipt_lot_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CompletedReceiptLotBloc>(
                      create: (context) => injector()),
                ], child: const ListCompletedLotReceiptScreen()));
      case '/export_main_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateIssueBloc>(
                      create: (context) => injector()),
                  BlocProvider<ListGoodsIssueUncompletedBloc>(
                      create: (context) => injector()),
                ], child: const ExportFunctionScreen()));
      case '/create_issue_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateIssueBloc>(
                      create: (context) => injector()),
                  BlocProvider<FillInfoIssueEntryBloc>(
                      create: (context) => injector()),
                ], child: const CreateNewIssueScreen()));
      case '/fill_info_entry_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateIssueBloc>(
                      create: (context) => injector()),
                  BlocProvider<FillInfoIssueEntryBloc>(
                      create: (context) => injector()),
                ], child: const FillInfoEntryIssueScreen()));

      case '/fill_main_info_issue_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CreateIssueBloc>(
                      create: (context) => injector()),
                  BlocProvider<FillInfoIssueEntryBloc>(
                      create: (context) => injector()),
                ], child: const FillMainInFoIssueScreen()));
      case '/list_goods_issue_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ListGoodsIssueUncompletedBloc>(
                      create: (context) => injector()),
                  BlocProvider<ListGoodsIssueEntryBloc>(
                      create: (context) => injector()),
                  BlocProvider<ListGoodsIssueLotUncompletedBloc>(
                      create: (context) => injector()),
                ], child: const ListGoodIssueScreen()));
      // case '/list_goods_issue_entry_screen':
      //   return MaterialPageRoute(
      //       builder: (context) => MultiBlocProvider(providers: [
      //             BlocProvider<ListGoodsIssueLotUncompletedBloc>(
      //                 create: (context) => injector()),
      //             BlocProvider<ListGoodsIssueEntryBloc>(
      //                 create: (context) => injector()),
      //           ], child: const ListGoodIssueEntryScreen()));
      case '/list_goods_issue_lot_screen':
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ListGoodsIssueLotUncompletedBloc>(
                      create: (context) => injector()),
                  BlocProvider<ListGoodsIssueUncompletedBloc>(
                      create: (context) => injector()),
                ], child: const ListLotIssueScreen()));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
